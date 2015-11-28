class CountrySuppliesController < ApplicationController
  def index
    @country = current_user.country
    authorize @country, :manage_supplies?
    @supplies  = Supply.all
    @available = Set.new @country.country_supplies.pluck :supply_id
  end

  def toggle
    country = current_user.country
    authorize country, :manage_supplies?
    country.toggle_supply Supply.find params[:id]
    redirect_to :back
  end
end
