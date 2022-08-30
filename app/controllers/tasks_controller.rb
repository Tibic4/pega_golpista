require "json"
require "open-uri"

class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  before_action :set_scammer, only: %i[show new create]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all.page(params[:page]).per(10)
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    @task.scammers.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save

        # Save nested form scammer data
        # if params[:task][:scammers_attributes].present?
        #   params[:task][:scammers_attributes].each do |scammer|
        #     Scammer.create(name: scammer[:name], phone: scammer[:phone], email: scammer[:email],
        #                    description: scammer[:description], category: scammer[:category], task_id: @task.id)
        #   end
        if params[:task][:scammers_attributes]
          params[:task][:scammers_attributes].each do |scammer|
            @scammer = Scammer.new(scammer)
            @scammer.task_id = @task.id
            @scammer.save
          end

          # Save count in ddd table
          Zone.find_by(ddd: set_ddd).increment!(:count)
          # Zone.create(task_id: @task.id, ddd: set_ddd, count: +1) not working, create a new row

          format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
          format.json { render :show, status: :created, location: @task }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @task.errors, status: :unprocessable_entity }

        end

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    # Only for admins
    # respond_to do |format|
    #   if @task.update(task_params)
    #     format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
    #     format.json { render :show, status: :ok, location: @task }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @task.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    # Only for admins
    # @task.destroy

    # respond_to do |format|
    #   format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  # def set ddd by cep
  def set_ddd
    url = "https://viacep.com.br/ws/#{params[:task][:cep]}/json/"
    ddds = URI.open(url).read
    dddi = JSON.parse(ddds)
    hash = dddi.select { |ddd| ddd["ddd"] }
    @ddd = hash["ddd"].to_i
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  def set_scammer
    @scammer = Scammer.find_by(task_id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:date, :scam_type, :cep, :money, :description,
                                 scammers_attributes: %i[name phone email description category task_id])
  end
end
