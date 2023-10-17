class Student < ApplicationRecord
  belongs_to :project
  has_many :project_evaluations, dependent: :destroy

  validates :studentid, presence: true, uniqueness: { scope: :project_id }
  validates :name, presence: true
end
