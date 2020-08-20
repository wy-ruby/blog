# frozen_string_literal: true

module Rack
  class A
    def initialize(app)
      @app = app # @app: Rack::B
      @header_name = 'X-A'
    end

    def call(env)
      start_time = Time.now
      status, headers, body = @app.call(env) #  Rack::B 实例调用 call
      request_time = Time.now - start_time

      headers[@header_name] = '%0.6f' % request_time unless headers.key?(@header_name)

      [status, headers, body]
    end
  end

  class B
    def initialize(app)
      @app = app # @app: Rack::C
      @header_name = 'X-test'
    end

    def call(env)
      status, headers, body = @app.call(env) #  Rack::C 实例调用 call

      headers[@header_name] = 'yyyyyy' unless headers.key?(@header_name)

      [status, headers, body + ['aaaaaa']]
    end
  end

  class C
    def call(_env)
      [200, { 'Content-Type' => 'text/plain' }, ['hello world!']]
    end
  end
end

use Rack::A
use Rack::B

run Rack::C.new
