class CreateTestSuites < ActiveRecord::Migration[6.0]
  def change
    create_table :test_suites, id: :uuid do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
