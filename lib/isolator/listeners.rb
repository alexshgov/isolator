module Isolator
  class Listeners
    @listeners = []

    class << self
      attr_reader :listeners

      def register(listener)
        listeners << listener
      end

      def enable!
        listeners.each(&:enable!)
      end

      def infer!
        listeners.each(&method(:disable_listener_and_infer!))
      end

      def reset
        @listeners = []
      end

      private

      def disable_listener_and_infer!(listener)
        listener.disable!
        listener.infer!
      end
    end
  end
end
