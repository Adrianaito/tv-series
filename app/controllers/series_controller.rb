class SeriesController < ApplicationController
  before_action :set_serie, only: [:show, :edit, :update, :destroy]
  def index
    @series = Serie.all
  end

  def show
    @serie = Serie.find(params[:id])
  end

  def new
    @serie = Serie.new
  end

  def create
    @serie = Serie.new(serie_params)
    if @serie.save
      redirect_to series_path(@serie), notice: "A neew title was added!"
    else
      render :new
    end
  end

  def destroy
    @serie.destroy
    redirect_to series_index_path, notice: 'Title was destroyed'
  end

  private

  def set_serie
    @serie = Serie.find(params[:id])
  end

  def serie_params
    params.require(:serie).permit(:title, :rating, :image)
  end
end
