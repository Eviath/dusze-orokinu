module RolesHelper

  # check if user is logged in and has role
  def has_role?(role)
    current_user && current_user.has_role?(role)
  end
end