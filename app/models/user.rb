class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :create_garden

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
end
