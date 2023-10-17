require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one) # Assuming have a fixture for projects
  end

  test "should create student" do
    assert_difference('@project.students.count') do
      post project_students_url(@project), params: { student: { studentid: '123', name: 'New Student' } }
    end
    assert_redirected_to project_url(@project)
  end

  test "should not create student with invalid params" do
    assert_no_difference('@project.students.count') do
      post project_students_url(@project), params: { student: { studentid: '', name: '' } }
    end
    assert_response :unprocessable_entity
  end

  test "should not create student with duplicate studentid" do
    existing_student = @project.students.create!(studentid: '123', name: 'Existing Student')
    assert_no_difference('@project.students.count') do
      post project_students_url(@project), params: { student: { studentid: existing_student.studentid, name: 'New Student' } }
    end
    assert_response :unprocessable_entity
  end
  
end
