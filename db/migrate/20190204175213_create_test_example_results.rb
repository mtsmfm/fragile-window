class CreateTestExampleResults < ActiveRecord::Migration[6.0]
  def change
    create_table :test_example_results do |t|
      t.string :result
      t.decimal :run_time
      t.references :test_example, foreign_key: true
      t.references :test_suite_result, foreign_key: true

      t.timestamps
    end
  end
end
