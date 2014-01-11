class SessionsController < ApplicationController
  respond_to :html

  def new
    @login_form = LoginForm.new(params[:login_form])
  end

  def create
    @login_form = LoginForm.new(params[:login_form])

    # if user = login(@login.email, @login.password, @login.remember_me)
      redirect_to root_url
    else
      render action: :new
    end
  end
end
