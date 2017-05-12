class Task < ApplicationRecord

  belongs_to :subject
  has_many :user_tasks, dependent: :destroy
  validates :name, presence: true
end
