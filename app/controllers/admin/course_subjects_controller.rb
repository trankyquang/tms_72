class Admin::CourseSubjectsController < ApplicationController
  layout "admin_application"
  before_action :authenticate_user!
  before_action :verify_admin
  before_action :load_course_subject, only: :destroy

  def create
    @course_subject_item = CourseSubject.new course_subject_params
    if @course_subject_item.save
      flash[:success] = t "add_subject_to_course_success"
      redirect_to admin_course_path course_subject_params[:course_id]
    end
  end

  def destroy
    course_id = @course_subject.course_id
    if @course_subject.destroy
      flash[:success] = t "remove_subject_to_course_success"
    else
      flash[:danger] = t "remove_subject_to_course_fail"
    end
    redirect_to admin_course_path course_id
  end

  private
  def course_subject_params
    params.require(:course_subject).permit :course_id, :subject_id, :status
  end

  def load_course_subject
    @course_subject = CourseSubject.find_by id: params[:id]
    redirect_to admin_courses_path unless @course_subject.present?
  end
end
