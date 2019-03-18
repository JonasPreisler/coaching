class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    member = Tutor.where(id: current_tutor.id).first
    return unless member
    member.update_attributes(online: true)
    stream_from "appearance_tutor"
  end

  def unsubscribed
    member = Tutor.where(id: current_tutor.id).first
    return unless member
    member.update_attributes(online: false)
  end
end
