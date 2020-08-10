module Rack
  class A
    def initialize(app)
      @app = app            # @app: Rack::B
      @header_name = "X-A"
    end

    def call(env)
      start_time = Time.now
      status, headers, body = @app.call(env)  #  Rack::B 实例调用 call
      request_time = Time.now - start_time

      if !headers.has_key?(@header_name)
        headers[@header_name] = "%0.6f" % request_time
      end

      [status, headers, body]
    end
  end

  class B
    def initialize(app)
      @app = app          # @app: Rack::C
      @header_name = "X-test"
    end

    def call(env)
      status, headers, body = @app.call(env)   #  Rack::C 实例调用 call

      if !headers.has_key?(@header_name)
        headers[@header_name] = 'yyyyyy'
      end

      [status, headers, body+['aaaaaa']]
    end
  end

  class C
    def call(env)
      [200, {'Content-Type' => 'text/plain'}, ['hello world!']]
    end
  end
end

use Rack::A
use Rack::B

run Rack::C.new