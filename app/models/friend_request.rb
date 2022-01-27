class FriendRequest < ApplicationRecord
  belongs_to :by, class_name: 'User' # friend request by me
  belongs_to :to, class_name: 'User' # friend request to me
end
