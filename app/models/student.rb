class Student < ApplicationRecord
  belongs_to :project
  has_many :project_evaluations, dependent: :destroy
end
