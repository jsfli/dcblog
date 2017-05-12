module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user
    #super means if current_user is true, treat everything as normal with devise
    #rhs of || is where we build the null object pattern / i.e. guest user
    super || guest_user
  end

  def guest_user
    OpenStruct.new(name: "Guest User",
                   first_name: "Guest",
                   last_name: "User",
                   email: "guest@example.com"
                   )
  end
end
