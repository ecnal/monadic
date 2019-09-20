require 'dry-initializer'
require 'dry/monitor/notifications'
require "monadic/version"
require 'monadic/runner'
require 'monadic/first/base'
require 'monadic/second/base'
require 'monadic/third/base'

module Monadic
  def self.notifications
    @__notifications__ ||= Dry::Monitor::Notifications.new(:monadic)
  end

  notifications.register_event("all.executed")
  notifications.register_event("first.executed")
  notifications.register_event("second.executed")
  notifications.register_event("third.executed")

  class Logger
    def on_all_executed(object:, time:)
      puts "#{object}: #{time}ms"
    end

    def on_first_executed(object:, time:)
      puts "#{object}: #{time}ms"
    end

    def on_second_executed(object:, time:)
      puts "#{object}: #{time}ms"
    end

    def on_third_executed(object:, time:)
      puts "#{object}: #{time}ms"
    end
  end
end
