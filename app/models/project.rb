class Project < ApplicationRecord
    has_many :students
    has_many :project_evaluations
  
    validates :name, presence: true
    validates :url, presence: true, format: { with: URI::regexp(%w(http https))}
  end
  