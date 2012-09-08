class RegistrationsController < Devise::RegistrationsController
    def update

      if params[resource_name][:avatar].blank?
                  super
          else
                  @user=resource

    end
end