module UnconditionalView
  module ActionView
    module Helpers
      def with_local(symbol)
        yield assigns[symbol]
      end

      def without_local(symbol)
        yield
      end
    end
  end
end
