class CreateExamSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :exam_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :exam, null: false, foreign_key: true

      t.timestamps
    end
  end
end
