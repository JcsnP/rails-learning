class Api::V1::TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /tasks
  def index
    limit = params[:limit] || 5

    @tasks = Task.all.limit limit
    render json: {"ok": true, "message": "successfully", "request_from": request.remote_ip,  "length": @tasks.count, "result": @tasks}
  end

  # GET /tasks/1
  def show
    if @task
      render json: {"ok": true, "result": @task}
    else
      render json: {"ok": false, message: "not found"}, status: :not_found
    end
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  def destroy
    if @task.destroy
      render json: {"message": "delete successfully"}
    else
      render json: {"message": "delete failed"}
    end
  end

  # HELLO
  def hello
    render json: {"ok": true, "message": "successfully"}
  end

  private

  def set_task
    @task = Task.find(params[:id]) rescue nil
  end

  def task_params
    params.require(:task).permit(:title, :description, :completed)
  end
end
