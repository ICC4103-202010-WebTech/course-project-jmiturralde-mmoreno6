# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)


    if user.present?
      event_invitations = user.event_invitations.map {|invitation| invitation.event_id}
      organization_invitations = user.organization_invitations.map {|invitation| invitation.organization_id}
      organization_admins = user.organization_invitations.where(admin: true).map {|invitation| invitation.organization_id}

      if user.system_admin?
        can :manage, Event
        can :manage, Organization
        can :manage, Comment
        can :manage, User
      else
        #User
        can :manage, User, id: user.id

        #Events
        can :manage, Event, user_id: user.id
        can :manage, EventInvitation, user_id: user.id
        can :read, Event do |event|
          event_invitations.include? event.id
        end

        #Organizations
        can :manage, Organization do |org|
          (organization_admins.include? org.id or org.user_id == user.id)
        end
        can :create, Organization
        can :manage, OrganizationInvitation, user_id: user.id
        can :read, Organization do |org|
          organization_invitations.include? org.id
        end

        #Comments
        can :manage, Comment

        #ProfilePage
        can :manage, ProfilePage, user_id: user.id

        #MailBox
        can :read, MailBox, user_id: user.id

        #Messages
        can :manage, Message, mail_box_id: user.mail_box.id

        #Notifications
        can :read, Notification, user_id: user.id
      end
    end


    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
