
class Test
  def method_public
    puts  "In method_public"
  end

  def method_protected
    puts "In method_protected"
  end

  def method_private
    puts "In method_private"
  end

  protected :method_protected
  private   :method_private
end

class SonTest < Test
end

test = SonTest.new
test.method_public
# test.method_protected
# test.method_private