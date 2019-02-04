class CreateTestExampleResults < ActiveRecord::Migration[6.0]
  def change
    create_table :test_example_results, id: :uuid do |t|
      t.string :result, null: false
      t.decimal :run_time, null: false
      t.references :test_example, foreign_key: true, index: true, type: :uuid
      t.references :test_suite_result, foreign_key: true, index: true, type: :uuid

      t.timestamps
    end
  end
end
