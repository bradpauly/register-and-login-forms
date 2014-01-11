class RegistrationsController < ApplicationController
  respond_to :html

  def new
    @registration_form = RegistrationForm.new
  end

  def create
    @registration_form = RegistrationForm.new(params[:registration_form])
    @registration_form.process
    respond_with @registration_form, location: root_url
  end
end
