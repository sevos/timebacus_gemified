module Timebacus
  class ReportActivity
    def initialize(duration, description)
      @duration = duration
      @description = description
    end

    def execute
      activity = Activity.new(@duration, @description)
      ActivityRepo.store(activity)
      activity
    end
  end
end

