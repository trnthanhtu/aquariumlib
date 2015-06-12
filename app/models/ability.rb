class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      # user ||= User.new # guest user (not logged in)
      # if user.role? :member
      #   can :manage, :all
      #   can :access, :rails_admin
      # else
      #    can :manage, [Plant]
      #    can :access, :rails_admin
      # end
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities                 # allow everyone to read everything
    $session_account_admin = nil
    if user && user.admin?
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard                  # allow access to dashboard
      if user.role? :super_admin
        can [:read, :destroy], PostSell    
        can [:read, :destroy], UserAccount  
        can :manage, [Plant, PlantImage, Account, Category, Post, Shop, Technical, Contact, Role]            # allow superadmins to do anything
      elsif user.role? :member
         can [:read, :create, :update], [Plant, PlantImage, Post, Technical, Shop]
         can [:read, :destroy], Contact
         can [:show, :update], Account, :id => user.id
      elsif user.role? :guest
        # can :update, Product, :hidden => false  # allow sales to only update visible products
      end
      $session_account_admin = user.id
    end
  end
end
