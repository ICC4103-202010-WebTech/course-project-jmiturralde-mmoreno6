class Admin::UsersController < ApplicationController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /admin/users
  # GET /admin/users.json
  def index
    @admin_users = User.all
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
  end

  # GET /admin/users/new
  def new
    @admin_user = User.new
    @admin_profile_page = ProfilePage.new
    @admin_user.profile_page = @admin_profile_page
  end

  # GET /admin/users/1/edit
  def edit
    @admin_profile_page = @admin_user.profile_page
  end

  # POST /admin/users
  # POST /admin/users.json
  def create
    name = params[:user][:profile_page][:name]
    last_name = params[:user][:profile_page][:last_name]
    location = params[:user][:profile_page][:location]
    bio = params[:user][:profile_page][:bio]
    @profile_page = ProfilePage.new(name: name, last_name: last_name, location: location, bio: bio)
    username = params[:user][:username]
    password = params[:user][:password]
    email = params[:user][:email]
    terms = true
    @admin_user = User.new(email: email, password: password, username: username, terms: terms)
    @admin_user.profile_page = @profile_page
    respond_to do |format|
      if @admin_user.save
        format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @admin_user }
      else
        format.html { render :new }
        format.json { render json: admin_users_path.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    @admin_user.profile_page.update(name: params[:user][:profile_page][:name],
                                    last_name: params[:user][:profile_page][:last_name],
                                    location: params[:user][:profile_page][:location],
                                    bio: params[:user][:profile_page][:bio])
    respond_to do |format|
      if @admin_user.update(admin_user_params)
        format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_user }
      else
        format.html { render :edit }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    @admin_user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_user_params
      params.fetch(:user, {}).permit(:username, :email, :password, :name, :last_name, :location, :bio)
    end
end
