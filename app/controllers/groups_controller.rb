class GroupsController < ApplicationController
  before_action :authenticate_user!

  # GET /groups or /groups.json
  def index
    @groups = Group.includes(:deals).all
    @group_sums = calculate_group_sums(@groups)
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to groups_url(@group), notice: 'Group was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def calculate_group_sums(groups)
    group_sums = {}

    groups.each do |group|
      sum = 0
      group.deals.each do |deal|
        sum += deal.amount
      end
      group_sums[group.id] = sum
    end

    group_sums
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
