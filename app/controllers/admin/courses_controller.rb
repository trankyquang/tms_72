class Admin::CoursesController < ApplicationController
  layout "admin_application"
  before_action :authenticate_user!
  before_action :verify_admin
  before_action :load_subjects, only: :new
  before_action :load_course, only: [:edit, :update, :destroy]

  def index
    @courses = Course.recent.page(params[:page]).per Settings.paginate.subjects_per_page
  end

  def show
    @subjects = Subject.all || []
    @course = Course.includes(course_subjects:[:subject]).find_by id: params[:id]
    unless @course
      flash[:danger] = t "course.course_not_found"
      redirect_to admin_courses_path
    end
  end

  def new
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = t "course.create_success"
      redirect_to admin_courses_path
    else
      load_subjects
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update_attributes course_params
      flash[:success] = t "course.update_success"
      redirect_to admin_course_path @course
    else
      flash[:danger] = t "course.update_fail"
      render :edit
    end
  end

  def destroy
    if @course.started?
      flash[:danger] = t "course.cannot_delete"
    else
      if @course.destroy
        flash[:success] = t "course.delete_success"
      else
        flash[:danger] = t "course.delete_fail"
      end
    end
    redirect_to admin_courses_path
  end

  private
  def course_params
    params.require(:course).permit :name, :description, :start_date, :end_date,
      :status
  end

  def load_subjects
    @course = @course || Course.new
  end

  def load_course
    @course = Course.includes(course_subjects:[:subject]).find_by id: params[:id]
    unless @course
      flash[:danger] = t "course.course_not_found"
      redirect_to admin_courses_path
    end
  end
end
