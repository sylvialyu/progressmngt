class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin?
    self.role == "admin"
  end

  has_many :tasks
  has_many :courses

  def display_name
    self.email.split("@").first
  end


end
