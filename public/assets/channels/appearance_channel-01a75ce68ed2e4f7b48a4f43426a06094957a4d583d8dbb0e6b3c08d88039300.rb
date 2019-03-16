class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    current_tutor.appear
  end
 
  def unsubscribed
    current_tutor.disappear
  end
 
  def appear(data)
    current_tutor.appear(on: data['appearing_on'])
  end
 
  def away
    current_tutor.away
  end
end