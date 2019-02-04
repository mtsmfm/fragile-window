class TestExampleResult < ApplicationRecord
  belongs_to :test_example
  belongs_to :test_suite_result
end
