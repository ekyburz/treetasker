class Task < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :assignee, class_name: 'User'
  has_one :tree

  PRIORITIES = {
    1 => 'Do',
    2 => 'Decide',
    3 => 'Delegate',
    4 => 'Depository'
  }.freeze

  after_commit :create_tree_after_commit, on: :create

  def priority_label
    PRIORITIES[priority]
  end

  private

  def create_tree_after_commit
    save!
    Tree.create(task: self)
  end
end
