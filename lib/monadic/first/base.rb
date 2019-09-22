module Monadic
  module First
    class Base
      extend Dry::Initializer[undefined: false]
      param :notifications

      def call
        notifications.instrument('first.executed', object: self) do
          sleep 10
          { api: 'First', data: { first_name: 'Primus' } }
        end
      end
    end
  end
end
