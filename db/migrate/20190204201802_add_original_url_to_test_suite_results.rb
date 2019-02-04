class AddOriginalUrlToTestSuiteResults < ActiveRecord::Migration[6.0]
  def change
    change_table :test_suite_results do |t|
      t.column :original_url, :string, null: false
    end
  end
end
