require "test_helper"

class StudentTest < ActiveSupport::TestCase
  setup do
    @project = projects(:one)  # Assuming have a fixture for projects
    @student = Student.new(studentid: "123", name: "John", project: @project)
    @student.save  # Save the student to the database
  end

  test "should be valid" do
    assert @student.valid?
  end

  test "should belong to project" do
    assert_equal @student.project, @project
  end

  test "should have many project_evaluations" do
    first_evaluation = project_evaluations(:one)  # Assuming have a fixture for project_evaluations
    second_evaluation = project_evaluations(:two) # Assuming have a fixture for project_evaluations
    
    first_evaluation.student = @student  # Associate with student
    second_evaluation.student = @student # Associate with student
    
    first_evaluation.save  # Save to database
    second_evaluation.save # Save to database
    
    # Debugging lines
    puts @student.project_evaluations.inspect
    puts @student.project_evaluations.count
    
    assert_equal 2, @student.project_evaluations.count
  end
end
