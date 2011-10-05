class Ability
  include CanCan::Ability

  def initialize(current_user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
    
    can :manage, Account, :id => current_user.account_id
    can :manage, Company, :account_id => current_user.account_id
    can :manage, Contact, :account_id => current_user.account_id
    can :manage, Organization, :account_id => current_user.account_id
    can :manage, User, :id => current_user.id
    can :manage, Item, :account_id => current_user.account_id
    can :manage, Invoice, :account_id => current_user.account_id
    # what about line_items?
    
  end
end
