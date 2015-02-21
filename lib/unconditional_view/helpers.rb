module UnconditionalView
  module ActionView
    module Helpers
      def depend_on(things)
        self.class.instance_variable_set(:@_locals, things)
      end

      def local_dependencies
        self.class.instance_variable_get(:@_locals)
      end

      def with_local(symbol)
        dependency = local_dependencies[symbol]
        if dependency.respond_to?(:dependable?)
          if dependency.dependable?
            yield dependency.renderable_value
          end
        elsif dependency.present?
          yield dependency
        end
      end

      def without_local(symbol)
        dependency = local_dependencies[symbol]
        if dependency.blank? || (dependency.respond_to?(:dependable?) && !dependency.dependable?)
          yield
        end
      end

      def with_global(symbol)
        dependency = ActiveSupport::HashWithIndifferentAccess.new(assigns)[symbol]
        yield dependency unless dependency.blank?
      end

      def without_global(symbol)
        yield unless ActiveSupport::HashWithIndifferentAccess.new(assigns)[symbol]
      end
    end
  end
end
