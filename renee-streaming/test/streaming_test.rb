require File.expand_path('../test_helper', __FILE__)

describe Renee::Streaming do
  describe "#stream" do
    after  { remove_views }

    it "should stream" do
      mock_app {
        path("/a").get.stream! {|out|
          out << "One" 
          out << "Two"
        }
      }
      get('/a')
      assert_equal 200, response.status
      assert_equal "OneTwo", response.body
    end
  end
end