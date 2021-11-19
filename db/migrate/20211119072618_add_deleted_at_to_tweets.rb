class AddDeletedAtToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :deleted_at, :datetime
    add_index :tweets, :deleted_at
  end
end
