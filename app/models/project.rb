class Project < ApplicationRecord
    has_many :students
    has_many :project_evelutions
end
