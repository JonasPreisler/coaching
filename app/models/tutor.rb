class Tutor < ApplicationRecord
  after_create :send_admin_mail
  is_impressionable
  mount_uploader :profile_picture, TutorUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum status: [:pending, :approved, :unapproved, :suspended]
  has_many :tutors_categories
  has_many :sub_categories, through: :tutors_categories
  has_many :categories, through: :tutors_categories
  has_many :documents
  has_one :company
  has_many :active_hours
  has_many :offers
  has_many :bookings
  has_many :reviews
  paginates_per 12
  
  accepts_nested_attributes_for :documents, allow_destroy: true,
                                 reject_if: ->(attrs) { attrs['file'].blank? }

  accepts_nested_attributes_for :active_hours, allow_destroy: true

  def next_active_hours
    ActiveHour.where(tutor_id: self.id).limit(1).each do |hour|
      if hour.start.future?
        hour
      end
    end
  end

  validates_presence_of :email, :first_name, :last_name, :job_title
  extend FriendlyId
  after_update_commit {AppearanceBroadcastJob.perform_later self}

  def full_name
    first_name + ' ' + last_name
  end
  
  friendly_id :full_name, use: :slugged
  has_many :reviews

  def active_for_authentication? 
    super && approved? 
  end 
  
  def inactive_message 
    approved? ? super : :not_approved
  end

  def send_admin_mail
    #AdminMailer.new_tutor_waiting_for_approval(email).deliver
    if email == 'roysacer@live.no'
      self.update_column(:admin, true)
      self.approved!
    end
    if email == 'jonas.preisler@gmail.com'
      self.update_column(:admin, true)
      self.approved!
    end

    self.update_column(:first_name, self.first_name.capitalize)
    self.update_column(:last_name, self.last_name.capitalize)
  end

  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.approved?
      recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable
  end


end
