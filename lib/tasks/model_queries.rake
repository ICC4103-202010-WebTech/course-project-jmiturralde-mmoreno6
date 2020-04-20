namespace :db do

  task :queries_demo => :environment do

    user_id = 2
    puts("Query 1: Get all events created by certain user id: " + user_id.to_s)
    result = User.find(user_id).events
    puts(result)
    puts("EQQ")

    organization_id = 1
    puts("Query 2: Get all users belonging to organization id: " + organization_id.to_s)
    result = Organization.find(organization_id).users
    puts(result)
    puts("EQQ")

    organization_id = 1
    puts("Query 3: Get all public events in an organization id: " + organization_id.to_s)
    result = Organization.find(organization_id).events.where("hidden = ?", false)
    puts(result)
    puts("EQQ")

    organization_id = 1
    puts("Query 4: Get all private events in an organization id: " + organization_id.to_s)
    result = Organization.find(organization_id).events.where("hidden = ?", true)
    puts(result)
    puts("EQQ")

    event_id = 1
    puts("Query 5: Get all guests that have been invited to a certain event id: " + event_id.to_s)
    result = Event.find(event_id).users
    puts(result)
    puts("EQQ")

    event_id = 2
    puts("Query 6: Get all guests that have voted for a date option in a certain event id: " + event_id.to_s)
    result = User.joins(event_invitations: :user_vote).where("event_id = ?", event_id)
    puts(result)
    puts("EQQ")

    event_id = 1
    puts("Query 7: Get all comments written by users on a specific event id: " + event_id.to_s)
    result = Event.find(event_id).comments
    puts(result)
    puts("EQQ")

    user_id = 2
    puts("Query 8: Get all comments written by a specific user on all events, user id: " + user_id.to_s)
    result = User.find(user_id).comments
    puts(result)
    puts("EQQ")

    organization_id = 1
    puts("Query 9: Get all users with administrative privileges in organization id: " + organization_id.to_s)
    result = User.joins(:organization_invitations).where("admin = ? AND organization_id = ?", true, organization_id)
    puts(result)
    puts("EQQ")

    puts("Query 10: Get all users with administrative privileges in the system: ")
    result = User.where("system_admin = ?", true)
    puts(result)
    puts("EQQ")

  end

end