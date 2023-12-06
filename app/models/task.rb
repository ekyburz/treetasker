class Task < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :assignee, class_name: 'User'
  has_one :tree

  validates :name, :priority, :deadline, presence: true

  after_create :create_tree, :update_user_status

  PRIORITIES = {
    1 => 'Do',
    2 => 'Decide',
    3 => 'Delegate',
    4 => 'Depository'
  }.freeze

  def priority_label
    PRIORITIES[priority]
  end

  def create_tree
    priority_to_name = {
      1 => 'Do Tree',
      2 => 'Decide Tree',
      3 => 'Delegate Tree',
      4 => 'Depository Tree'
    }

    tree_params = {
      name: priority_to_name[priority],
      task_id: id,
      garden_id: creator.garden.id
    }

    Tree.create(tree_params.merge(task: self))

    return unless assignee != creator

    Tree.create(tree_params.merge(task: self, garden_id: assignee.garden.id))
  end

  def update_user_status
    return unless assignee == creator

    tree_count = creator.trees.count

    if tree_count >= 1000
      assignee.update(status: 'Landscape Legend')
    elsif tree_count >= 500
      assignee.update(status: 'Wildlife Wizard')
    elsif tree_count >= 250
      assignee.update(status: 'Forest Fairy')
    elsif tree_count >= 100
      assignee.update(status: 'Tree Whisperer')
    elsif tree_count >= 50
      assignee.update(status: 'Plant Scientist')
    elsif tree_count >= 25
      assignee.update(status: 'Floral Engineer')
    elsif tree_count >= 10
      assignee.update(status: 'Sprouts Scout')
    end
  end
end
