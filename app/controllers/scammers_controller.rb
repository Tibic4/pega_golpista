class ScammersController < ApplicationController
  before_action :set_task, only: %i[show new create]

  def show
    @scammer = Scammer.find(params[:id])
  end

  def new
  end

  def create
  end

  private

  def scammer_params
    params.require(:scammer).permit(:name, :phone, :email, :description, :category, :task_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
