class PagesController < ApplicationController

  def search
    #user search
    @users = User.all.where("username LIKE ? AND system_admin = ?", params[:q] + '%', false)
    @profile_pages = ProfilePage.all.where("name LIKE ?", params[:q] + '%')
    @distinct_profile_pages =[]
    if @users != []
      @profile_pages.each do |j|
        @users.each do |k|
          if j.user_id = k.id
          else
            @distinct_profile_pages.append(j)
          end
        end
      end
    else
      @profile_pages.each do |name|
        @distinct_profile_pages.append(name)
      end
    end

    #organization search
    @organizations = Organization.all.where("name LIKE ?", params[:q] + '%')

    #event search
    @events = Event.all.where("title LIKE ? OR description LIKE ?", '%' + params[:q] + '%',  '%' + params[:q] + '%')
    @event_creators = []
    @users.each do |user|
      @temp = Event.where("user_id = ?", user.id)
      @temp.each do |t|
        @event_creators.append(t)
      end
    end


    @event_organization = []
    @organizations.each do |org|
      @temp = Event.where("organization_id = ?", org.id)
      @temp.each do |t|
        @event_organization.append(t)
      end
    end
    @all_organizations=Organization.all
    @all_users=User.all
  end
end
