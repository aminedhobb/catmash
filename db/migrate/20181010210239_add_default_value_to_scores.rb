class AddDefaultValueToScores < ActiveRecord::Migration[5.2]
  def change
    change_column :cats, :score, :integer, default: 1000
  end
end
