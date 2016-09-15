class CreateEpisodeRanks < ActiveRecord::Migration
  def change
    create_table(:episode_ranks) do |t|
      t.integer :episode_id, null: false
      t.integer :likes,      null: false, default: 0
      t.integer :dislikes,   null: false, default: 0
      t.timestamps           null: false
    end
  end
end
