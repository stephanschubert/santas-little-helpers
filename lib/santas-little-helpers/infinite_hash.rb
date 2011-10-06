module Santas::Little::Helpers
  class InfiniteHash < Hash
    def method_missing(*args)
      self.class.new
    end
  end
end
