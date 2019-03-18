class AppearanceBroadcastJob < ApplicationJob
  queue_as :default

  def perform(tutor)
    ActionCable.server.broadcast "appearance_tutor", render_json(tutor)
  end

  private

  def render_json(tutor)
    ApplicationController.renderer.render(json: tutor)
  end
end
