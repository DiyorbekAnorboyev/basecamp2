class PrmersController < ApplicationController
  before_action :set_prm, only: %i[ new ]
  before_action :set_prmer, only: %i[ show edit update destroy ]
  
  def index
    @prmers = Prmer.all
  end

  def show
  end

  def new
    @prmer = Prmer.new
  end

  def edit
  end

  def create
    @prmer = Prmer.new(prmer_params)

    respond_to do |format|
      if @prmer.save
        format.html { redirect_to prm_url(@prmer.prm), notice: "Prmer was successfully created." }
        format.json { render :show, status: :created, location: @prmer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prmer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @prmer.update(prmer_params)
        format.html { redirect_to prmer_url(@prmer), notice: "Prmer was successfully updated." }
        format.json { render :show, status: :ok, location: @prmer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prmer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @prmer.destroy

    respond_to do |format|
      format.html { redirect_to prm_url(@prmer.prm)}
      format.json { head :no_content }
    end
  end

  private
  def set_prm
    @prm = Prm.find(params[:prm_id])
  end
    def set_prmer
      @prmer = Prmer.find(params[:id])
    end
    def prmer_params
      params.require(:prmer).permit(:name, :body, :prm_id)
    end
end
