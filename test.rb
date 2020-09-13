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

    def call_method_protected(testmember)
        puts testmember.method_protected
    end
    def call_method_private(testmember)
        puts testmember.method_private
    end

end
test1 = Test.new
test2 = Test.new

test2.call_method_protected(test1)
# test2.call_method_private(test1)