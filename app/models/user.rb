class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :given_match, class_name: "Match", foreign_key: "giver_id"
  has_one :received_match, class_name: "Match", foreign_key: "receiver_id"
end
