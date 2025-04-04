class Project < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :owner, class_name: 'User'

  enum status: { pending: 0, in_progress: 1, completed: 2, on_hold: 3 }
end
