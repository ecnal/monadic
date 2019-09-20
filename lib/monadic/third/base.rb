module Monadic
  module Third
    class Base
      def call
        sleep 10
        { api: 'Third', data: { thrid_name: 'Trifectus' } }
      end
    end
  end  
end