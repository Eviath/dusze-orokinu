class RegistrationsController < Devise::RegistrationsController

  # PUT /resource
  # We need to use a copy of the resource because we don't want to change
  # the current user in place.
def update
  self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
  prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

  resource_updated = update_resource(resource, account_update_params)
  yield resource if block_given?
  if resource_updated
    set_flash_message_for_update(resource, prev_unconfirmed_email)
    bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?


    if params[:rails_settings_setting_object]
      params[:rails_settings_setting_object].each do |key, value|
        Rails.logger.debug('setting notification setting ' + key + 'to ' + value=="1")
        current_user.settings(:notification).update_attributes! key.to_sym => value=="1"
      end
    end

    respond_with resource, location: after_update_path_for(resource)
  else
    clean_up_passwords resource
    set_minimum_password_length
    respond_with resource
  end
end

  end
