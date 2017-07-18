class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  after_initialize :set_default_role

  enum role: [:standard, :admin, :premium]

  private
  def set_default_role
    self.role ||= :standard
  end

end
