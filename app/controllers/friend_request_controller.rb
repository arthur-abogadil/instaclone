class FriendRequestController < ApplicationController

  def accept_request

    request = FriendRequest.find_by(by_id: params[:by_id], to_id: current_user.id)
    if request.present?
      request.accepted = true
      request.save!      
    end

    redirect_to '/profiles'

  end

  def send_request

    request = FriendRequest.new(by_id: current_user.id, to_id: params[:to_id], accepted: false)
    request.save
    
    redirect_to '/profiles'

  end
end
