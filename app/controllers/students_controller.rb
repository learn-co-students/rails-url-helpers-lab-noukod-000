class StudentsController < ApplicationController
  before_action :set_student, only: :show
  # before_action :set_student, only: [:show, :activate]
  
  def index
    @students = Student.all
  end

  def show
  end

  def activate
    @student = Student.find(params[:id]) # if not... below ... only: [:show, :activate]
    # he will be active
    @student.active = !@student.active
    @student.save
    redirect_to student_path(@student)
    # without this redirection you will go to active.html.erb
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end