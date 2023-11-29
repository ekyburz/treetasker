class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :create_user_profile

  private

  def create_user_profile
    Profile.create(user: self)
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :creator_tasks, class_name: 'Task', foreign_key: 'creator_id'
  has_many :assignee_tasks, class_name: 'Task', foreign_key: 'assignee_id'
  has_one :garden, dependent: :destroy
  has_many :trees, through: :garden

  has_one :profile
end
