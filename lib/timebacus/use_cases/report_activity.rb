module Timebacus
  class ReportActivity
    def initialize(duration, description)
      @duration = duration
      @description = description
    end

    def execute
      ActivityRepository.store(Activity.new(@duration, @description)).id
    end
  end
end

