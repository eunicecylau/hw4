class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if @user != nil
        if BCrypt::Password.new(@user["password"]) == params["password"]
          session["user_id"] = @user["id"]
          flash["notice"] = "You've logged in."
          redirect_to "/places"
        else
          flash["notice"] = "Unsuccessful login."
          redirect_to "/login"
        end
      else
        flash["notice"] = "Welcome! Please Login."
        redirect_to "/login"
      end
    end
  end

  def destroy
    flash["notice"] = "Goodbye."
    session["user_id"] = nil
    redirect_to "/login"
  end
end
  