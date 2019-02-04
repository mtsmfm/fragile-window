class CreateTestExamples < ActiveRecord::Migration[6.0]
  def change
    create_table :test_examples do |t|
      t.string :name
      t.string :classname
      t.string :file
      t.boolean :pending
      t.references :test_suite, foreign_key: true

      t.timestamps
    end
  end
end
