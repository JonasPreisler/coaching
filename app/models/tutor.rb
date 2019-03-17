class Tutor < ApplicationRecord
  after_create :send_admin_mail
  mount_uploader :profile_picture, TutorUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tutors_categories
  has_many :sub_categories, through: :tutors_categories
  has_many :documents
  accepts_nested_attributes_for :documents, allow_destroy: true,
                                 reject_if: ->(attrs) { attrs['file'].blank? }
  validates_presence_of :email, :first_name, :last_name, :job_title
  extend FriendlyId
  def full_name
  	first_name + ('-') + last_name
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
    AdminMailer.new_tutor_waiting_for_approval(email).deliver
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
