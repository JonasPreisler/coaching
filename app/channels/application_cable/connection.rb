module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_tutor

    def connect
      self.current_tutor = find_verified_user
    end

    private

    def find_verified_user
      (current_tutor = env['warden'].user) ? current_tutor : reject_unauthorized_connection
    end
  end
end
