require 'helper'

class TestNivo < Test::Unit::TestCase
  should "Find out if Nivo::Helper exists" do
    assert_equal Class, Nivo::Helper.class, "Nivo::Helper is a #{Nivo::Helper.class}"
  end

  
end

