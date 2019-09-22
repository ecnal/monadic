#!/usr/bin/env ruby

require 'bundler/setup'
require 'monadic'

# subscribe an object where its methods are treated as event listeners
Monadic.notifications.subscribe(Monadic::Logger.new)

# subscribe arbitrary code as an event listener (optional)
Monadic.notifications.subscribe('all.executed') do |event|
  puts "EVENT: #{event.id}"
  puts "PAYLOAD: #{event.payload.inspect}"
end

runner = Monadic::Runner.new(Monadic.notifications)
runner.call
