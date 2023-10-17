require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference("Project.count", 1) do
      post projects_url, params: { project: { name: "New Project", url: "http://newproject.url" } }
    end
    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { name: "Updated Name", url: "http://updated.url" } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference("Project.count", -1) do
      @project.students.each do |s|
        s.destroy
      end
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end





  test "should get index in JSON format" do
    get projects_url(format: :json)
    assert_response :success
  end

  test "should get index in XML format" do
    get projects_url(format: :xml)
    assert_response :success
  end

  test "should not create project with invalid params" do
    assert_no_difference('Project.count') do
      post projects_url, params: { project: { name: '', url: '' } }
    end
    assert_response :unprocessable_entity
  end

  test "should not update project with invalid params" do
    patch project_url(@project), params: { project: { name: '', url: '' } }
    assert_response :unprocessable_entity
  end

  test "should not destroy project if students exist" do
    assert_no_difference('Project.count') do
      delete project_url(@project)
    end
    assert_redirected_to projects_url
    assert_equal "Cannot delete project with existing evaluations.", flash[:alert]
  end
end
