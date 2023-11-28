class Tree < ApplicationRecord
  belongs_to :task
  belongs_to :garden
end
