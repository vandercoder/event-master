# Event Master

This a is mock-up website project based on www.eventbrite.com created using 
Ruby on Rails.

### Specifications:
Create a website where users can create events for other users to attend. The 
site allows users to create events and then manage user signups. Users can 
create events and send invitations and parties. Events take place at a specific 
date and at a location.

* A user can create events. 
* A user can attend many events. 
* An event can be attended by many users.
```
events:
id, event_name, date, location, organizer_id

users:
id, name, age, username, email, password, password_confirmation

event_attendings:
id, event_id, attending_user_id
```

```ruby
class Event < ActiveRecord::Base
    belongs_to :organizer, class_name: "User"
    has_many :event_attendings, foreign_key: :event_id
    has_many :attenders, through: :event_attendings, source: :attending_user_id

class User < ActiveRecord::Base
    has_many :organized_events, foreign_key: :organizer_id, class_name: "Event"
    has_many :event_attendings, foreign_key: :attending_user_id
    has_many :accepted_events, through: :event_attendings, source: :event

class EventAttending < ActiveRecord::Base
   belongs_to :event, class_name: "Event"
   belongs_to :attending_user, class_name: "User"
```