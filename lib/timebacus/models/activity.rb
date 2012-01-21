module Timebacus
  class Activity
    attr_accessor :id, :duration, :description

    def initialize(duration, description)
      @duration, @description = duration, description
    end
  end
end
