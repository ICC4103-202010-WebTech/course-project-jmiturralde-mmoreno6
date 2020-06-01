class PagesController < ApplicationController
  def search
    @users = User.all.where("username LIKE ?", params[:q] + '%')
    @profile_pages = ProfilePage.all.where("name LIKE ?", params[:q] + '%')
    @organizations = Organization.all.where("name LIKE ?", params[:q])
    @events = Event.all.where("title LIKE ? OR description LIKE ?", '%' + params[:q] + '%',  '%' + params[:q] + '%')
    @event_creators = []
    @users.each do |user|
      @temp = Event.where("user_id = ?", user.id)
      @temp.each do |t|
        @event_creators.append(t)
      end
    end
    @organization_creators = []
    @organizations.each do |org|
      @temp = Event.where("organization_id = ?", org.id)
      @temp.each do |t|
        @organization_creators.append(t)
      end
      end
  end
end
