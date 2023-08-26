class PrmsController < ApplicationController
  before_action :set_project, only: %i[ index new ]
  before_action :set_prm, only: %i[ show edit update destroy ]

  def index
    @prms = @project.prms
  end

  def show
    @prmer = @prm.prmers.new
    @prmers = @prm.prmers
  end

  def new
    @prm = Prm.new
  end

  def edit
  end

  def create
    @prm = Prm.new(prm_params)

    respond_to do |format|
      if @prm.save
        format.html { redirect_to prm_url(@prm), notice: "Prm was successfully created." }
        format.json { render :show, status: :created, location: @prm }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prm.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @prm.update(prm_params)
        format.html { redirect_to prm_url(@prm), notice: "Prm was successfully updated." }
        format.json { render :show, status: :ok, location: @prm }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prm.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @prm.destroy
    @proj = @prm.project
    respond_to do |format|
      format.html { redirect_to project_prms_url(@proj), notice: "Prm was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_project
    
    @project = Project.find(params[:project_id])
  end
    def set_prm
      @prm = Prm.find(params[:id])
    end
    def prm_params
      params.require(:prm).permit(:name, :body, :project_id)
    end
end
