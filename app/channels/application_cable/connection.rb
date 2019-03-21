module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_tutor

    def connect
      self.current_tutor = find_verified_user
    end

    private

    def find_verified_user
      verified_user = Tutor.find_by(id: cookies.signed['tutor.id'])

      if verified_user && cookies.signed['tutor.expires_at'] > Time.now
        verified_user
      else
        reject_unauthorized_connection
      end
    end

  end
end
