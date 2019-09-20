module Monadic
  module First
    class Base
      def call
        sleep 10
        { api: 'First', data: { first_name: 'Primus' } }
      end
    end
  end  
end