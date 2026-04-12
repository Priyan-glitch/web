require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should show a student" do
    get api_student_url(@student), as: :json

    assert_response :success
    response_body = JSON.parse(response.body)
    assert_equal @student.id, response_body["id"]
    assert_equal @student.name, response_body["name"]
  end

  test "should update a student with put" do
    put api_student_url(@student), params: {
      student: { course: "ECE", year_of_study: 4 }
    }, as: :json

    assert_response :success
    @student.reload
    assert_equal "ECE", @student.course
    assert_equal 4, @student.year_of_study
  end

  test "should update a student with patch" do
    patch api_student_url(@student), params: {
      student: { name: "Alice Updated" }
    }, as: :json

    assert_response :success
    assert_equal "Alice Updated", @student.reload.name
  end

  test "should delete a student" do
    assert_difference("Student.count", -1) do
      delete api_student_url(@student), as: :json
    end

    assert_response :no_content
  end

  test "should search students by course" do
    get search_api_students_url(course: "ECE")

    assert_response :success
    response_body = JSON.parse(response.body)
    returned_ids = response_body.map { |student| student["id"] }

    assert_equal [ students(:two).id, students(:three).id ].sort, returned_ids.sort
    assert_not_includes returned_ids, students(:one).id
  end

  test "should require a course parameter for search" do
    get search_api_students_url

    assert_response :unprocessable_entity
    response_body = JSON.parse(response.body)
    assert_includes response_body["errors"], "course parameter is required"
  end
end
