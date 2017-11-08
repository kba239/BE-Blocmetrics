class RegisteredAppsController < ApplicationController
  def create
    @registered_app = RegisteredApp.new
    @registered_app.name = params[:registered_app][:name]
    @registered_app.url = params[:registered_app][:url]
    @registered_app.user = current_user

    if @registered_app.save
      flash[:notice] = "Your app is now registered."
      redirect_to root_path
    else
      flash[:notice] = "There was an error registering your app."
      render :new
    end
  end

  def new
    @registered_app = RegisteredApp.new
  end

  def show
    @registered_app = RegisteredApp.find(params[:id])
    @events = @registered_app.events.sort_by(&:name)
    unless @registered_app.user == current_user
      flash[:notice] = "Sorry, you are not authorized to view this app."
      redirect_to root_path
    end
  end

  def index
    @registered_apps = []
    @user_apps = RegisteredApp.all
    @user_apps.each do |app|
      if app.user == current_user
        @registered_apps.push(app)
      end
    end
  end

  def edit
    @registered_app = RegisteredApp.find(params[:id])
  end

  def update
    @registered_app = RegisteredApp.find(params[:id])
    @registered_app.name = params[:registered_app][:name]
    @registered_app.url = params[:registered_app][:url]

    if @registered_app.save
      flash[:notice] = "Your registered app has been updated."
      redirect_to root_path
    else
      flash[:notice] = "There was an error updating your registered app."
      render :edit
    end
  end

  def destroy
    @registered_app = RegisteredApp.find(params[:id])
    if @registered_app.destroy
      flash[:notice] = "\"#{@registered_app.name}\" was deleted successfully."
      redirect_to root_path
    else
      flash[:notice] = "There was an error deleting your app."
      render :show
    end
  end
end
