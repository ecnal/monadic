module Monadic
  module Second
    class Base
      def call
        sleep 10
        { api: 'Second', data: { second_name: 'Secundus' } }
      end
    end
  end  
end