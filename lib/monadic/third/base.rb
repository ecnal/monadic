module Monadic
  module Third
    class Base
      extend Dry::Initializer[undefined: false]
      param :notifications

      def call
      	notifications.instrument("third.executed", object: self) do
          sleep 10
          { api: 'Third', data: { third_name: 'Trifectus' } }
        end
      end
    end
  end  
end