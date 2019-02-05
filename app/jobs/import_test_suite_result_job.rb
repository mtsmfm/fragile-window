class ImportTestSuiteResultJob < ApplicationJob
  queue_as :default

  def perform(test_suite_result)
    test_suite_result.with_lock do
      doc = Nokogiri::XML(test_suite_result.data)
      doc.search('//testcase').each do |testcase|
        example = TestExample.find_or_create_by(
          test_suite_id: test_suite_result.test_suite_id,
          classname: testcase['classname'],
          name: testcase['name'],
          file: testcase['file']
        )

        TestExampleResult.create!(
          test_example_id: example.id,
          test_suite_result_id: test_suite_result.id,
          run_time: testcase['time'].to_r,
          result:
            if !testcase.search('skipped').empty?
              'skipped'
            elsif !testcase.search('failure').empty?
              'failure'
            else
              'success'
            end
        )
      end

      test_suite_result.update!(processed: true)
    end
  end
end
