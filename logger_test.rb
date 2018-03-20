require 'test/unit'
require 'minitest/autorun'
require 'logger'

class MyTest < MiniTest::Test

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
    @msg = "Hello World!"
    @caller = "Test"
    @l = Logger.new(@caller)
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def test_init
    assert_instance_of(Logger, @l, "Logger not initialized")
  end

  def test_log
    Time.stub :now , true do
      return "time"
    end

    expected = "[time] INFO #{caller}: #{msg}"
    mock = MiniTest::Mock.new
    mock.expect(:puts, nil, [expected])
    @l.stub :puts, mock do
      @l.log("INFO", msg, false)
    end
    assert_mock(mock)
  end

end