class BuyersController < ApplicationController

  def index
    @buyers = Buyer.all
  end

  def new
    @buyer = Buyer.new
  end

  def create
    @buyer = Buyer.new(buyer_params)

    if @buyer.save
      redirect_to buyer_path(@buyer)
    else
      render new_buyer_path
    end
  end

  def show
    @buyer = Buyer.find_by(id: params[:id])
  end

  private

  def buyer_params
    params.require(:buyer).permit(:name, :email)
  end
end
