module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user
    #super means if current_user is true, treat everything as normal with devise
    #rhs of || is where we build the null object pattern / i.e. guest user
    super || guest_user
  end

  def guest_user
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@example.com"
    guest
  end
end
