module Timebacus
  module ActivityRepository
    extend self
    @memory_storage = {}

    def store(activity)
      unless activity.id
        activity.id = next_id
      end
      @memory_storage[activity.id] = activity
      activity
    end

    def fetch(id)
      @memory_storage[id]
    end

    private
      def next_id
        (@memory_storage.keys.map(&:to_i).max || -1 ) + 1
      end
  end
end
