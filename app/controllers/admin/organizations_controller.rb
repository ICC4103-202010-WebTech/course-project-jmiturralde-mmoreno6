class Admin::OrganizationsController < ApplicationController
  before_action :set_admin_organization, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /admin/organizations
  # GET /admin/organizations.json
  def index
    @admin_organizations = Organization.all
  end

  # GET /admin/organizations/1
  # GET /admin/organizations/1.json
  def show
  end

  # GET /admin/organizations/new
  def new
    @admin_organization = Organization.new
  end

  # GET /admin/organizations/1/edit
  def edit
  end

  # POST /admin/organizations
  # POST /admin/organizations.json
  def create
    @admin_organization = Organization.new(admin_organization_params)
    @admin_organization.user = User.find(params[:organization][:user_id])

    respond_to do |format|
      if @admin_organization.save
        format.html { redirect_to admin_organizations_path, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @admin_organization }
      else
        format.html { render :new }
        format.json { render json: @admin_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/organizations/1
  # PATCH/PUT /admin/organizations/1.json
  def update
    respond_to do |format|
      if @admin_organization.update(admin_organization_params)
        format.html { redirect_to admin_organizations_path, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_organization }
      else
        format.html { render :edit }
        format.json { render json: @admin_organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/organizations/1
  # DELETE /admin/organizations/1.json
  def destroy
    @admin_organization.destroy
    respond_to do |format|
      format.html { redirect_to admin_organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_organization
      @admin_organization = Organization.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_organization_params
      params.fetch(:organization, {}).permit(:id, :name, :description, :banner_picture, :organization_picture,
                                             documents: [], videos: [], images: [] )
    end
end
