class PagesController < ApplicationController
  def search

    #user search
    @users = User.all.where("username LIKE ?", params[:q] + '%')
    @profile_pages = ProfilePage.all.where("name LIKE ?", params[:q] + '%')
    @distinct_profile_pages =[]
    if @user != []
      @profile_pages.each do |j|
        @users.each do |k|
          if j.user_id = k.id
          else
            @distinct_profile_pages.append(j)
          end
        end
      end
    else
      @profile_pages.each do |j|
        @distinct_profile_pages.append(j)
      end
    end
    #organization search
    @organizations = Organization.all.where("name LIKE ?", params[:q] + '%')

    #event seratch
    @events = Event.all.where("title LIKE ? OR description LIKE ?", '%' + params[:q] + '%',  '%' + params[:q] + '%')
    @event_creators = []
    @users.each do |user|
      @temp = Event.where("user_id = ?", user.id)
      @temp.each do |t|
        @event_creators.append(t)
      end
    end

    @distinct_event_creators =[]
    if @events!= []
      @event_creators.each do |j|
        @events.each do |k|
          if (j.id == k.id)
          else
            @distinct_event_creators.append(j)
          end
        end
      end
    else
      @event_creators.each do |j|
        @distinct_event_creators.append(j)
      end
    end

    @event_organization = []
    @organizations.each do |org|
      @temp = Event.where("organization_id = ?", org.id)
      @temp.each do |t|
        @event_organization.append(t)
      end
      end
  end
end
