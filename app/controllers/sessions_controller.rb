class SessionsController < ApplicationController
  respond_to :html

  def new
    @login_form = LoginForm.new(params[:login_form])
  end

  def create
    @login_form = LoginForm.new(params[:login_form])

    if @login_form.process
      redirect_to root_url
    else
      render action: :new
    end
  end
end
