class DealsController < ApplicationController
  before_action :authenticate_user!

  # GET /deals or /deals.json
  def index
    @deals = Group.find(params[:group_id]).deals.order(created_at: :desc)
    @total = 0
    @deals.each do |deal|
      @total += deal.amount
    end
  end

  # GET /deals/new
  def new
    @deal = Deal.new
  end

  # POST /deals or /deals.json
  def create
    @deal = Deal.new(name: deal_params[:name], amount: deal_params[:amount], user_id: deal_params[:user_id])

    if @deal.save
      @deal.groups << Group.find(deal_params[:group])
      redirect_to group_deals_url(group_id: deal_params[:group]), notice: 'Deal was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def deal_params
    params.require(:deal).permit(:name, :amount, :user_id, :group)
  end
end
