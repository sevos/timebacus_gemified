module Timebacus
  class ReportActivity
    def initialize(duration, description)
      @duration = duration
      @description = description
    end

    def execute
      activity = Activity.new(@duration, @description)
      if activity.valid?
        ActivityRepository.store(activity).id
      else
        raise ArgumentError, activity.errors.join(', ')
      end
    end
  end
end

