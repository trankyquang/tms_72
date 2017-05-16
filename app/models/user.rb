class User < ApplicationRecord

  acts_as_paranoid
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :remember_token
  enum role: {trainee: 0, supervisor: 1, admin: 2}
  has_many :user_courses, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  has_many :activities, dependent: :destroy
  before_save {self.email = email.downcase}
  validates :name, presence: true
  mount_uploader :avatar_url, PictureUploader
  validates_integrity_of :avatar_url
  validates_processing_of :avatar_url

  scope :order_by_created_at, ->{order("created_at DESC")}
  scope :search_by_name_and_email, ->search do
    where "name LIKE '%#{search}%' OR email LIKE '%#{search}%'" if search.present?
  end
end
