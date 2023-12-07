class CreateExams < ActiveRecord::Migration[7.1]
  def change
    create_table :exams do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :timer, default: 30

      t.timestamps
    end
  end
end
