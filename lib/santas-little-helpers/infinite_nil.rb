module Santas::Little::Helpers
  class InfiniteNil < NilClass
    def method_missing(*args)
      self.class.new
    end
  end
end
