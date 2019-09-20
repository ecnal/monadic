require 'dry/monads'

module Monadic
  class Runner
    include Dry::Monads[:task]
    include Dry::Monads[:result, :do]
    include Dry::Monads[:list]

    def call
      one   = Task[:io] { First::Base.new.call }
      two   = Task[:io] { Second::Base.new.call }
      three = Task[:io] { Third::Base.new.call }

      un, dos, tres = yield List::Task[one, two, three].traverse
      {
        enhanced: { **un[:data].to_h, **tres[:data].to_h },
        apis: [un[:api], dos[:api], tres[:api]].flatten
      }
    end
  end
end
