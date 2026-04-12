module Api
  class StudentsController < ApplicationController
    before_action :set_student, only: %i[show update destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index
      render json: Student.all
    end

    def show
      render json: @student
    end

    def create
      student = Student.new(student_params)

      if student.save
        render json: student, status: :created
      else
        render_validation_errors(student)
      end
    end

    def update
      if @student.update(student_params)
        render json: @student
      else
        render_validation_errors(@student)
      end
    end

    def destroy
      @student.destroy
      head :no_content
    end

    def search
      course = params[:course].to_s.strip

      if course.blank?
        render json: { errors: [ "course parameter is required" ] }, status: :unprocessable_entity
      else
        render json: Student.by_course(course)
      end
    end

    private

    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :email, :course, :year_of_study)
    end

    def render_not_found
      render json: { errors: [ "Student not found" ] }, status: :not_found
    end

    def render_validation_errors(student)
      render json: { errors: student.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
