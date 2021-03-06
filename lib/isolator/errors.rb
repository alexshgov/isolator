# frozen_string_literal: true

module Isolator
  class UnsafeOperationError < StandardError
    MESSAGE = "You are trying to do unsafe operation inside db transaction"

    def initialize(msg = self.class::MESSAGE)
      super
    end
  end

  class NetworkRequestError < UnsafeOperationError
    MESSAGE = "You are trying to make an outgoing network request inside db transaction. "
  end

  class BackgroundJobError < UnsafeOperationError
    MESSAGE = "You are trying to enqueue background job inside db transaction." \
      "In case of transaction failure, this may lead to data inconsistency and unexpected bugs"
  end
end
