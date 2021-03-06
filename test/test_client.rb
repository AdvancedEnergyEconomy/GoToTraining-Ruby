require 'helper'

class ClientTest < Test::Unit::TestCase

  context "attributes" do

    setup do
      @c = GoToTraining::Client.new("12345", "121212", "54321")
    end

    should "have access_token is set" do
      assert_equal("12345", @c.access_token)
    end
    
    should "have organizer key is set" do
      assert_equal("54321", @c.organizer_key)
    end
    
    should "have account key is set" do
      assert_equal("121212", @c.account_key)
    end
    
    
    should "have valid accept header" do
      assert_equal("application/json", @c.class.headers["Accept"])
    end
    
    should "have valid content-type header" do
      assert_equal("application/json", @c.class.headers["Content-type"])
    end
    
    should "have custom OAuth header" do
      assert_equal("OAuth oauth_token=12345", @c.class.headers["Authorization"])
    end
    
  end
end
