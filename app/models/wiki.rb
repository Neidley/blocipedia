class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  def public?
    self.private == false
  end

  def owner
    self.user
  end
end
