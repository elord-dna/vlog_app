class StudentController < ApplicationController

  def all
     render json: Student.all
  end

  def insert
    sno = params[:sno]
    sname = params[:sname]
    student = Student.new(sno:sno, sname:sname)
    student.save
    render json: student
  end

end
