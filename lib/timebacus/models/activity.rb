module Timebacus
  class Activity
    attr_accessor :id, :duration, :description
    attr_accessor :errors

    def initialize(duration, description)
      @duration, @description = duration, description
    end

    def valid?
      validate
      self.errors.empty?
    end

    private
      def validate
        self.errors = []
        self.errors << 'description' if !@description || @description == ''          # non blank
        self.errors << 'duration' if @duration.to_i.abs != @duration                 # positive integer
      end
  end
end
