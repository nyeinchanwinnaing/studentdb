require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  test "should not save project without name" do
    project = Project.new(url: "http://new.url")
    assert_not project.save
  end  
end
