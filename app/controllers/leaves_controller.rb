class LeavesComtroller < ApplicationController

  before_action :get_leave, only: [:show, :update, :destroy]

  def index 
    leave = Leave.all
    render json: leave, status: 200
  end

  def new 
    leave = Leave.new
    render json: leave, status: 200
  end 

  def create
    leave = Leave.new(leave_params)
    if leave.save
      render json: { status: 'SUCCESS', message: 'Created leave', data: leave }, status: :created
    else
      render json: { status: 'ERROR', message: 'Leave not created', data: leave.errors }, status: :unprocessable_entity
    end
  end

  def show 
    render json: @leave, status: 200
  end

  def update
    if @leave.update(leave_params)
      render json: { status: 'SUCCESS', message: 'Updated leave', data: @leave }, status: :ok
    else
      render json: { status: 'ERROR', message: 'Department not updated', data: @leave.errors }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @leave.destroy
    render json: { status: 'SUCCESS', message: 'Deleted leave' }, status: :ok
  end

  def get_leave
    @leave = Leave.find(params[:id])
  end

  private

  def leave_params
    params.require(:leave).permit(:start_date, :end_date, :leave_type, :employee_id)
  end
end
