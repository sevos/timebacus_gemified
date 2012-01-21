require 'spec_helper'

require 'timebacus/repositories/activity_repository'
require 'ostruct'

describe Timebacus::ActivityRepository do
  let(:store) {->(act) { Timebacus::ActivityRepository.store(act) } }
  let(:fetch) {->(id) { Timebacus::ActivityRepository.fetch(id) } }
  let(:activity) { OpenStruct.new(duration: 1800) }

  context 'when storing new activity' do
    it 'returns activity' do
      store[activity].should eq(activity)
    end

    it 'sets new id' do
      store[activity].id.should be_a(Fixnum)
    end
  end

  describe :fetch do
    before { @id = store[activity].id }

    it 'should fetch activity' do
      fetch[@id].should eq(activity)
    end
  end

end

