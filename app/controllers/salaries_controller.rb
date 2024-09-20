class SalariesController < ApplicationController

  before_action :authenticate_employee!, only: [:create, :update, :destroy]

  before_action :get_salary, only: [:show, :update, :destroy]

  def index 
    salary = Salary.all
    render json: salary, status: 200
  end

  def new 
    salary = Salary.new
    render json: salary, status: 200
  end

  def create
    salary = Salary.new(salary_params)
    if salary.save
      render json: { status: 'SUCCESS', message: 'Created salary', data: salary }, status: :created
    else
      render json: { status: 'ERROR', message: 'salary not created', data: salary.errors }, status: :unprocessable_entity
    end
  end

  def show 
    render json: @salary, status: 200
  end

  def update
    if @salary.update(salary_params)
      render json: { status: 'SUCCESS', message: 'Updated salary', data: @salary }, status: :ok
    else
      render json: { status: 'ERROR', message: 'salary not updated', data: @salary.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @salary.destroy
    render json: { status: 'SUCCESS', message: 'Deleted salary' }, status: :ok
  end

  def get_salary
    @salary = Salary.find(params[:id])
  end

  private

  def salary_params
    params.require(:salary).permit(:basic_salary, :employee_id)
  end
end
