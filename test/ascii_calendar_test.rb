require "test_helper"

class AsciiCalendarTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::AsciiCalendar::VERSION
  end

  def test_it_generates_a_string
    assert_instance_of String, AsciiCalendar.generate
  end
end
