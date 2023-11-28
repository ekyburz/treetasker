class Task < ApplicationRecord
  belongs_to :user
  has_one :tree
end
