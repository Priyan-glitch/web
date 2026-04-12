require "test_helper"

class StudentTest < ActiveSupport::TestCase
  test "by_course filters students by course case insensitively" do
    results = Student.by_course("ece")

    assert_includes results, students(:two)
    assert_includes results, students(:three)
    refute_includes results, students(:one)
  end
end
