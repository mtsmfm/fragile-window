class CreateTestSuiteResults < ActiveRecord::Migration[6.0]
  def change
    create_table :test_suite_results, id: :uuid do |t|
      t.xml :data, null: false
      t.references :test_suite, foreign_key: true, null: false, index: true, type: :uuid
      t.boolean :processed, null: false, index: true, default: false

      t.timestamps
    end
  end
end
