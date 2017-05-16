class Task < ApplicationRecord

  belongs_to :subject
  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks

  validates :name, presence: true
  validates :description, presence: true
end
