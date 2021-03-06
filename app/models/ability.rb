class Ability
  include CanCan::Ability

  def initialize(user)
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
    #
    user ||= User.new # guest user (not logged in)
    can :read, :all                 # allow everyone to read everything
    cannot :manage, [Clan, Request, Comment, News, NewsCategory]
    if user.has_role? :admin
      can :manage, :all
      can :access, :rails_admin   # grant access to rails_admin
      can :read, :dashboard       # grant access to the dashboard
    elsif user.has_role?(:moderator) && user.has_role?(:lider)
      can :manage, [News, Clan, Comment], :user_id => user.id
      cannot [:decline, :approve], Clan
      can :podanie, Request, :user_id => user.id # user can access only request landing page
    elsif user.has_role? :moderator
      can :manage, [News, Comment], :user_id => user.id
      can [:create, :destroy, :podanie, :new], Request, :user_id => user.id
      can :panel, Clan # user can access only new clan page
    elsif user.has_role? :lider
      can :manage, [Clan, Comment], :user_id => user.id
      cannot [:decline, :approve], Clan
      can :podanie, Request, :user_id => user.id # user can access only request landing page
    else # new user but registered
      can [:create, :destroy, :podanie, :new], Request, :user_id => user.id if user.has_role?(:newuser, Request)
      can :panel, Clan
      can :manage, Comment, :user_id => user.id if user.has_role?(:newuser, Comment) # user can manage his own comments
    end

  end
end
