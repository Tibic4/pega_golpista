require "json"
require "open-uri"

class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  # GET /tasks or /tasks.json
  def index
    respond_to do |format|
      format.html
      format.text { render partial: "tasks", locals: { tasks: Task.all }, formats: [:html] }
    end
    map
    # Search
    if params[:search].present? && params[:query].blank? && params[:zip].blank?
      @tasks = Task.where(scam_type: params[:search]).page(params[:page]).per(10)

    elsif params[:search].present? && params[:query].present? && params[:zip].blank?
      @tasks = Task.where(scam_type: params[:search]).where(date: params[:query]).page(params[:page]).per(10)

    elsif params[:search].present? && params[:query].blank? && params[:zip].present?
      @tasks = Task.where(scam_type: params[:search]).where(cep: params[:zip]).page(params[:page]).per(10)

    elsif params[:search].present? && params[:query].present? && params[:zip].present?
      @tasks = Task.where(scam_type: params[:search], date: params[:query],
                          cep: params[:zip]).page(params[:page]).per(10)

    elsif params[:query].present? && params[:search].blank? && params[:zip].blank?
      @tasks = Task.where(date: params[:query]).page(params[:page]).per(10)

    elsif params[:query].present? && params[:search].blank? && params[:zip].present?
      @tasks = Task.where(date: params[:query],
                          cep: params[:zip]).page(params[:page]).per(10).order("created_at DESC")

    elsif params[:zip].present? && params[:search].blank? && params[:query].blank?
      @tasks = Task.where(cep: params[:zip]).page(params[:page]).per(10).order("created_at DESC")

    else
      @tasks = Task.all.page(params[:page]).per(10).order("created_at DESC")
    end
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
    # raise
    if @task.save && Zone.find_by(ddd: set_ddd).present?

      # Save nested form scammer data
      @scammer = Scammer.new(scammer_params[:scammer])
      @scammer.task_id = @task.id
      @scammer.save

      # Save count in ddd table
      Zone.find_by(ddd: set_ddd).increment!(:count_of_scammers)
      # end

      # Zone.create(task_id: @task.id, ddd: set_ddd, count: +1) not working, create a new row
      redirect_to tasks_path, flash: { success: "Obrigado por compartilhar sua experiência!" }
      #  flash.now[:alert] = "Task was successfully created."

    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    # Only for admins
    # respond_to do |format|
    #   if @task.update(task_params)
    #     format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    # Only for admins
    # @task.destroy

    # respond_to do |format|
    #   format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
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

  # Render the map

  def map
    @zones = Zone.where.not(latitude: nil, longitude: nil) # returns zones with coordinates
    # Mark a zone DDD in google maps
    @markers = @zones.map do |zone|
      {
        lat: zone.latitude,
        lng: zone.longitude,
        ddd: zone.ddd
      }
    end
    # Count total scamers
    @total_scammers = Zone.where.not(count_of_scammers: nil).sum(:count_of_scammers)

    # Count the number of scammers in each ddd
    @countOfScammer = Zone.where.not(count_of_scammers: 0)
    @countOfScammers = @countOfScammer.map do |zone|
      {
        ddd: zone.ddd,
        count_of_scammers: zone.count_of_scammers
      }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:date, :scam_type, :cep, :money_lost, :description)
  end

  def scammer_params
    params.require(:task).permit(scammer: %i[name phone email website description category])
  end
end
