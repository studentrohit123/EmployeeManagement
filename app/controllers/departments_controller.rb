class DepartmentsController < ApplicationController

  before_action :get_department, only: [:show, :update, :destroy]

  def index 
    department = Department.all
    render json: department, status: 200
  end

  # def new 
  #   department = Department.new
  #   render json: department, status: 200
  # end 

  def create
    department = Department.new(department_params)
    if department.save
      render json: { status: 'SUCCESS', message: 'Created department', data: department }, status: :created
    else
      render json: { status: 'ERROR', message: 'Department not created', data: department.errors }, status: :unprocessable_entity
    end
  end

  def show 
    render json: @department, status: 200
  end

  def update
    if @department.update(department_params)
      render json: { status: 'SUCCESS', message: 'Updated department', data: @department }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Department not updated', data: @department.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @department.destroy
    render json: { status: 'SUCCESS', message: 'Deleted department' }, status: :ok
  end

  def get_department
    @department = Department.find(params[:id])
  end

  private

  def department_params
    params.require(:department).permit(:name)
  end
end
