# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.is_admin?
      can :manage, :all

      cannot :add_or_remove_favorite_books, FavouriteBook
    else
      can :read, Book
    end
  end
end
