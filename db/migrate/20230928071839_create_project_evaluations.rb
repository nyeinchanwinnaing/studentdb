class CreateProjectEvaluations < ActiveRecord::Migration[7.0]
  def change
    create_table :project_evaluations do |t|
      t.integer :score
      t.references :project, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
