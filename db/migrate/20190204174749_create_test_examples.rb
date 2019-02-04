class CreateTestExamples < ActiveRecord::Migration[6.0]
  def change
    create_table :test_examples, id: :uuid do |t|
      t.string :name, null: false
      t.string :classname, null: false
      t.string :file, null: false
      t.boolean :pending, null: false, default: false
      t.references :test_suite, foreign_key: true, null: false, index: true, type: :uuid

      t.timestamps
    end
  end
end
