module Monadic
  module Second
    class Base
      extend Dry::Initializer[undefined: false]
      param :notifications

      def call
      	notifications.instrument("second.executed", object: self) do
          sleep 10
          { api: 'Second', data: { second_name: 'Secundus' } }
        end
      end
    end
  end  
end