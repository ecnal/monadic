require_relative 'lib/monadic/'

results = Monadic::Runner.new.call
sleep 11
p results