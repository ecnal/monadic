require 'dry/monads'

module Monadic
  class Runner
    include Dry::Monads[:task]
    include Dry::Monads[:result, :do]
    include Dry::Monads[:list]
    extend Dry::Initializer[undefined: false]
    param :notifications

    def call
      notifications.instrument('all.executed', object: self) do
        one   = Task[:io] { First::Base.new(notifications).call }
        two   = Task[:io] { Second::Base.new(notifications).call }
        three = Task[:io] { Third::Base.new(notifications).call }

        un, dos, tres = yield List::Task[one, two, three].traverse
        {
          enhanced: { **un[:data].to_h, **tres[:data].to_h },
          apis: [un[:api], dos[:api], tres[:api]].flatten
        }
      end
    end
  end
end
