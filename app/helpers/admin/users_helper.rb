module Admin::UsersHelper

  def show_select_option_role f
    f.select :role, User.roles.map {|key, value| [key, key]}
  end
end
