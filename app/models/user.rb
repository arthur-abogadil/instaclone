# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: {case_sensitive: false}

  has_many :photos, dependent: :delete_all
  has_many :comments, dependent: :delete_all

  has_many :friend_request_to_me, class_name: 'FriendRequest', foreign_key: 'to_id' # friend request by me
  has_many :friend_request_by_me, class_name: 'FriendRequest', foreign_key: 'by_id' # friend request to me

  def self.is_my_friend?(by_id, to_id)

    request_by_me = FriendRequest.find_by(by: by_id, to: to_id)
    request_to_me = FriendRequest.find_by(by: to_id, to: by_id)
    
    request_by_me&.accepted || request_to_me&.accepted

  end

  def self.not_a_friend?(by_id, to_id)
    request = FriendRequest.find_by(by: by_id, to: to_id)
    true if request.blank?
  end

  def self.request_by_me_not_accepted?(by_id, to_id)

    request = FriendRequest.find_by(by: by_id, to: to_id)
    request.present? && !request.accepted 

  end
  

  def self.request_to_me_not_accepted?(by_id, to_id)

    request = FriendRequest.find_by(by: to_id, to: by_id)
    request.present? && !request.accepted 

  end

end
