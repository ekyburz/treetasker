class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_garden
  after_create :create_task

  validates :first_name, :last_name, presence: true

  has_many :creator_tasks, class_name: 'Task', foreign_key: 'creator_id'
  has_many :assignee_tasks, class_name: 'Task', foreign_key: 'assignee_id'
  has_one :garden, dependent: :destroy
  has_many :trees, through: :garden

  has_one_attached :photo

  private

  def create_garden
    Garden.create(user: self)
  end

  def create_task
    task_params = {
      name: 'Add a profile picture',
      priority: 1,
      creator_id: id,
      assignee_id: id,
      deadline: DateTime.current + 1.hour,
      details: 'Upload a profile picture to make your account more personal!'
    }
    Task.create(task_params)
  end
end
