class ChangeColumnNameEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :organizer_id_id, :organizer_id
  end
end
