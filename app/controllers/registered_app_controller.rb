class RegisteredAppController < ApplicationController
  def create
    @registeredapp = RegisterdApp.new
    @registeredapp.name = params[:registeredapp][:name]
    @registeredapp.url = params[:registeredapp][:url]
    @registeredapp.user = current_user

    if @registeredapp.save
      flash[:notice] = "Your app is now registered."
      redirect_to root_path
    else
      flash[:notice] = "There was an error registering your app."
      render :new
    end
  end

  def new
    @registeredapp = RegisteredApp.new
  end

  def show
    @registeredapp = RegisteredApp.find(params[:id])
    unless @registeredapp.user == current_user
      flash[:notice] = "Sorry, you are not authorized to view this app."
      redirect_to root_path
    end
  end

  def index
    @registeredapps = []
    @userapps = RegisteredApp.all
    @userapps.each do |app|
      if app.user == current_user
        @registeredapps.push(app)
      end
    end
  end

  def edit
    @registeredapp = RegisteredApp.find(params[:id])
  end

  def update
    @registeredapp = RegisteredApp.find(params[:id])
    @registeredapp.name = params[:registeredapp][:name]
    @registeredapp.url = params[:registeredapp][:url]

    if @registeredapp.save
      flash[:notice] = "Your registered app has been updated."
      redirect_to root_path
    else
      flash[:notice] = "There was an error updating your registered app."
      render :edit
    end
  end

  def destroy
    @registeredapp = RegisteredApp.find(params[:id])
    if @registeredapp.destroy
      flash[:notice] = "\"#{@registeredapp.name}\" was deleted successfully."
      redirect_to root_path
    else
      flash[:notice] = "There was an error deleting your app."
      render :show
    end
  end
end
