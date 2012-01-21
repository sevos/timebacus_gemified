module Timebacus
  class ReportActivity
    def initialize(duration, description)
      @duration = duration
      @description = description
    end

    def execute
      validate
      ActivityRepository.store(Activity.new(@duration, @description)).id
    end

    private
      def validate
        errors = []
        errors << 'description' if !@description || @description == ''          # non blank
        errors << 'duration' if @duration.to_i.abs != @duration                 # positive integer
        raise ArgumentError, errors.join(', ') unless errors.empty?
      end
  end
end

