require 'spec_helper'
require 'timebacus'

describe 'Report activity' do
  it 'Report activity' do
    john = TestUser.new

    john.extend(TestUser::Reporter)

    id = john.report(1800, 'reporting')

    activity = Timebacus::ActivityRepository.fetch(id)
    activity.duration.should eq(1800)
    activity.description.should eq('reporting')
  end
end

