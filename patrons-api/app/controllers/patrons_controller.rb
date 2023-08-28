class PatronsController < ApplicationController
  before_action :set_patron, only: [:show, :update, :destroy]

  def index
    @patrons = Patron.all
    render json: @patrons
  end

  def show
    render json: @patron
  end

  def create
    @patron = Patron.new(patron_params)
    if @patron.save
      render json: @patron, status: :created
    else
      render json: @patron.errors, status: :unprocessable_entity
    end
  end

  def update
    if @patron.update(patron_params)
      render json: @patron
    else
      render json: @patron.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @patron.destroy
    head :no_content
  end

  def find_by_ids
    patron_ids = params[:ids]
    @patrons = Patron.where(id: patron_ids)
    render json: @patrons
  end

  private

  def set_patron
    @patron = Patron.find(params[:id])
  end

  def patron_params
    params.require(:patron).permit(:name, :email)
  end
end
