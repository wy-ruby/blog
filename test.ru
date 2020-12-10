class StatusLogger
  def initialize(app, options={})
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    puts status
    [status, headers, body]
  end
end

class BodyTransformer
  def initialize(app, options={})
    @app = app
    @count = options[:count]
  end

  def call(env)
    status, headers, body = @app.call(env)
    body = body.map { |str| str[0...@count].upcase + str[@count..-1] }
    [status, headers, body]
  end
end

use StatusLogger
use BodyTransformer, count: 3
run Proc.new { |env| ['200', { 'Content-Type' => 'text/html' }, ['get rack\'d']]}
