# frozen_string_literal: true

module Isolator
  class Listeners
    class HTTP
      def enable!
        Sniffer.enable!
      end

      def infer!
        return unless requests_were_made?
        disable!
        Isolator.notify(klass: self)
      end

      def disable!
        Sniffer.clear! && Sniffer.disable!
      end

      private

      def requests_were_made?
        !Sniffer.data.empty?
      end
    end
  end
end

Isolator::Listeners.register(Isolator::Listeners::HTTP.new)
