class Company < ApplicationRecord
  has_many :projects, dependent: :destroy
end
