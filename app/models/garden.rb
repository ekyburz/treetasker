class Garden < ApplicationRecord
  belongs_to :user
  has_many :trees, dependent: :destroy
end
