class CreateEventAttendings < ActiveRecord::Migration[5.2]
  def change
    create_table :event_attendings do |t|
      t.references :event
      t.references :attending_user

      t.timestamps
    end
  end
end
