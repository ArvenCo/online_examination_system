class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.references :exam_session, null: false, foreign_key: true
      t.references :choice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
