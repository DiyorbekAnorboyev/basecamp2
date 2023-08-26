class PatchesController < ApplicationController
  before_action :set_project, only: %i[ index new ]
  before_action :set_patch, only: %i[ show edit update destroy ]

  def index
    @patches = Patch.all
  end

  def show
  end

  def new
    @patch = @project.patches.new
  end

  def edit
  end

  def create
    @patch = Patch.new(patch_params)

    respond_to do |format|
      if @patch.save
        format.html { redirect_to patch_url(@patch), notice: "Patch was successfully created." }
        format.json { render :show, status: :created, location: @patch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @patch.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @patch.update(patch_params)
        format.html { redirect_to patch_url(@patch), notice: "Patch was successfully updated." }
        format.json { render :show, status: :ok, location: @patch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @patch.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @patch.destroy

    respond_to do |format|
      format.html { redirect_to project_patches_url(@patch.project), notice: "Patch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_project
    @project = Project.find(params[:project_id])
  end
    def set_patch
      @patch = Patch.find(params[:id])
    end

    def patch_params
      params.require(:patch).permit(:description,:pat, :project_id)
    end
end
