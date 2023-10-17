class StudentsController < ApplicationController
    before_action :set_project
def create
    @student = @project.students.new(student_params)
    respond_to do |format|
        if @student.save
            format.html { redirect_to @project, notice: 'Student was successfully created.' }
        end
    end
end
private
def set_project
    @project = Project.find(params[:project_id])
end
def student_params
    params.require(:student).permit(:studentid, :name)
end
end
