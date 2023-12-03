class CreateChoices < ActiveRecord::Migration[7.1]
  def change
    create_table :choices do |t|
      t.references :item, null: false, foreign_key: true
      t.string :option
      t.boolean :correct

      t.timestamps
    end
  end
end
