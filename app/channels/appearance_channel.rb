class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    member = Tutor.find_by_id(current_tutor.id)
    return unless member
    member.update_attributes(online: true)
    stream_from "appearance_channel"
  end

  def unsubscribed
    member = Tutor.find_by_id(current_tutor.id)
    return unless member
    member.update_attributes(online: false)
  end
end
