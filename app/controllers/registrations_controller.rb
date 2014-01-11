class RegistrationsController < ApplicationController
  def new
    @registration_form = RegistrationForm.new
  end

  def create
    @registration_form = RegistrationForm.new(params[:registration_form])

    if @registration_form.process
      redirect_to '/'
    else
      render action: :new
    end
  end
end