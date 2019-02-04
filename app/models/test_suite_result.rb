class TestSuiteResult < ApplicationRecord
  belongs_to :test_suite
  has_many :test_example_results

  def ok?
    failed_count == 0
  end

  def original_ok?
    original_failed_count == 0
  end

  def failed_count
    original_failed_count - fragile_failed_count
  end

  def fragile_failed_count
    @fragile_failed_count ||= original_failed_test_cases.inject(TestExample.none) {|scope, testcase|
      scope.or(
        TestExample.where(
          test_suite_id: test_suite_id,
          pending: true,
        ).where(
          testcase.to_h.slice('classname', 'name', 'file')
        )
      )
    }.count
  end

  def original_failed_count
    original_failed_test_cases.count
  end

  private

  def original_failed_test_cases
    @original_failed_test_cases ||= doc.search('//testcase[failure]')
  end

  def doc
    @doc ||= Nokogiri::XML(data)
  end
end
