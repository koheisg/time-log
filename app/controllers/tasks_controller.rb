class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy]

  def index
    this_month = Time.now.month
    last_month = Time.now.month - 1
    days = Date.new(Time.now.year, this_month, -1).day.to_i
    range = 1..days
    @tasks = range.each do |date|
      Task.create_with_date(date)
    end
  end

  def show
    @this_day = Date.today.strftime('%Y%m%d')
    selected_day = DateTime.parse(params[:id]) #strong parameters
    @date = params[:date]
    @tasks = Task.where("date = :date", date: selected_day.strftime('%Y-%m-%d'))
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_path(@task.date.strftime('%Y%m%d')), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :duration, :date)
    end
end
