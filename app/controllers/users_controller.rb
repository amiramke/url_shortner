class UsersController < ApplicationController
  def index

    @urls = Url.find_by_user_id(params[:user_id])
    redirect_to 'urls#index'
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @user = User.new( { :name => params[:user][:name], :email => params[:user][:email] } )
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'a user has been successfully created' }
      else
        flash.now[:notice] = "could not create the user"
        format.html { render action: "new", notice: 'could not add the entry'}
      end
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
    end
  end














end