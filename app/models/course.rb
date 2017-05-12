class Course < ApplicationRecord

  has_many :course_subjects, dependent: :destroy
  belongs_to :user_course
  validates :name, presence: true
  validate :end_date_after_start_date
  validates :start_date, :end_date, presence: true

  private
  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add :end_date, t("must_be_after_the_start_date")
    end
  end
end
