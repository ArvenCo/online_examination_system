class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.references :exam, null: false, foreign_key: true
      t.string :question

      t.timestamps
    end
  end
end
