class RenameColumnsEventAttending < ActiveRecord::Migration[5.2]
  def change
    rename_column :event_attendings, :attending_user_id, :attendee_id
    rename_column :event_attendings, :event_id, :attended_event_id
  end
end
