json.extract! event, :id, :user_id, :organization_id, :location, :minimum_guest, :start_event_date_vote, :event_rule, :hidden, :banner_picture, :title, :description
json.url api_v1_event_url(event, format: :json)
