class StudentsController < ApplicationController
    before_action :set_project
  
    def create
      @student = @project.students.new(student_params)
      if @student.save
        redirect_to @project, notice: 'Student was successfully created.'
      else
        render :new, status: :unprocessable_entity
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
  