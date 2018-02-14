# frozen_string_literal: true

module Isolator
  module Listeners
    class HTTP
      def start!
        Sniffer.enable!
      end

      def infer!
        disable!
        return unless requests_were_made?
        Isolator.notify(klass: self)
      end

      def disable!
        Sniffer.clear! && Sniffer.disable!
      end

      private

      def requests_were_made?
        Sniffer.data.empty?
      end
    end
  end
end

Isolator::Listeners.register(Isolator::Listeners::HTTP.new)
