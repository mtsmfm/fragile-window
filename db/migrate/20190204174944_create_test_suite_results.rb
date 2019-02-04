class CreateTestSuiteResults < ActiveRecord::Migration[6.0]
  def change
    create_table :test_suite_results do |t|
      t.xml :data
      t.references :test_suite, foreign_key: true

      t.timestamps
    end
  end
end
