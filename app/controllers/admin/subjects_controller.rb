class Admin::SubjectsController < ApplicationController

  layout "admin_application"
  before_action :load_subject, except: [:index, :create, :new]
  load_and_authorize_resource

  def index
    @subjects = Subject.recent.page(params[:page]).per Settings.paginate.subjects_per_page
  end

  def show
  end

  def new
    @subject = Subject.new
    @task = @subject.tasks.build
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t "subject.create_success"
      redirect_to admin_subject_path @subject
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = t "subject.update_success"
      redirect_to admin_subject_path @subject
    else
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      flash[:success] = t "subject.delete_success"
    else
      flash[:danger] = t "subject.delete_fail"
    end
    redirect_to admin_subjects_path
  end

  private
  def subject_params
    params.require(:subject).permit :name, :description,
      tasks_attributes: [:id, :name, :description, :_destroy]
  end

  def load_subject
    @subject = Subject.includes(:tasks).find_by(id: params[:id])
    unless @subject
      flash[:danger] = t "subject.not_found"
      redirect_to admin_subjects_path
    end
  end
end
