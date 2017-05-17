class Course < ApplicationRecord

  has_many :course_subjects
  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses
  has_many :subjects, through: :course_subjects

  enum status: {pending: 0, started: 1, finished: 2}
  acts_as_paranoid

  validates :name, presence: true
  validates :description, presence: true
  validate :end_date_after_start_date
  validates :start_date, :end_date, presence: true

  scope :recent, ->{order created_at: :desc}

  private
  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add :end_date, t("must_be_after_the_start_date")
    end
  end
end
