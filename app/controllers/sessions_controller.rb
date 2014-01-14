class SessionsController < ApplicationController
  respond_to :html

  def new
    @login_form = LoginForm.new
  end

  def create
    @login_form = LoginForm.new(params[:login_form])
    user = User.find_by_email(@login_form.email)

    if UserAuthenticator.new(user).authenticate(@login_form.password)
      redirect_to root_url
    else
      render action: :new
    end
  end
end
