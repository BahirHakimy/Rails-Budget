class CreateJoinTableGroupsDeals < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :deals do |t|
      # t.index [:group_id, :deal_id]
      # t.index [:deal_id, :group_id]
    end
  end
end
