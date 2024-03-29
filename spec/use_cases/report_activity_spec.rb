require 'spec_helper'

require 'timebacus/use_cases/report_activity'

describe Timebacus::ReportActivity do
  mock_const Timebacus::ReportActivity, 'Activity' do |activity_class|
    activity_class.stub(new: activity)
  end
  mock_const Timebacus::ReportActivity, 'ActivityRepository' do |repository_class|
    repository_class.stub(store: activity)
  end

  context 'with valid data' do
    let(:activity) { mock(id: 5, duration: 1800, description: 'remote work',
                          valid?: true) }
    subject { Timebacus::ReportActivity.new 1800, 'remote work' }

    it 'returns id of new activity' do
      subject.execute.should eq(5)
    end

    it 'stores activity to repository' do
      ActivityRepository.should_receive(:store).
        with(activity)
      subject.execute
    end
  end

  context 'with invalid data' do
    let(:activity) { mock(valid?: false, errors: ['duration', 'description']) }
    subject { Timebacus::ReportActivity.new -1800, 'creating bugs' }

    it 'raises ArgumentError' do
      -> {subject.execute }.
        should raise_error(ArgumentError, 'duration, description')
    end
  end
end

