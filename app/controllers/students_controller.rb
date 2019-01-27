class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
  end

  def activate
    set_active_state

    redirect_to student_path(@student)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    def set_active_state
      set_student

      @student.active = ! @student.active
      @student.save
    end
end
