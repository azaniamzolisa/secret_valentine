class Match < ApplicationRecord
  belongs_to :giver, class_name: "User", foreign_key: "giver_id"
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"

  validates :giver, presence: true
  validates :receiver, presence: true
  validates :status, presence: true
end
