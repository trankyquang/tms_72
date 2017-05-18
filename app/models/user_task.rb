class UserTask < ApplicationRecord

  has_many :activities, dependent: :destroy
  belongs_to :user
  belongs_to :user_subject
  has_many :tasks, dependent: :destroy
  validates :status, presence: true

  enum status: {pending: 0, started: 1, finished: 2}
  scope :task_finish_on_day,
    ->{where "status = ? AND DATE(updated_at) = DATE(?)",
      UserTask.statuses[:finished], Date.current}
end
