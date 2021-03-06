class Event < ApplicationRecord
    belongs_to :organizer, class_name: "User"
    has_many :event_attendings, foreign_key: :attended_event_id
    has_many :attendees, through: :event_attendings, source: :attendee
end
