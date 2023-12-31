class PrtdsController < ApplicationController
  before_action :set_project, only: %i[ index new ]
  before_action :set_prtd, only: %i[ show edit update destroy ]

  def index
    @prtds = @project.prtds
    @prtd = @project.prtds.new

  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @prtd = Prtd.new(prtd_params)

    respond_to do |format|
      if @prtd.save
        format.html { redirect_to project_prtds_url(@prtd.project) }
        format.json { render :show, status: :created, location: @prtd }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prtd.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @prtd.update(prtd_params)
        format.html { redirect_to prtd_url(@prtd) }
        format.json { render :show, status: :ok, location: @prtd }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prtd.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @prtd.destroy

    respond_to do |format|
      format.html { redirect_to project_prtds_url(@prtd.project), notice: "Prtd was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_project
    @project = Project.find(params[:project_id])
  end
    def set_prtd
      @prtd = Prtd.find(params[:id])
    end
    def prtd_params
      params.require(:prtd).permit(:description, :project_id)
    end
end
