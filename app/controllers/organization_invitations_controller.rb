class OrganizationInvitationsController < ApplicationController
  before_action :set_organization_invitation, only: [:show, :edit, :update, :destroy]

  # GET /organization_invitations
  # GET /organization_invitations.json
  def index
    @organization_invited = OrganizationInvitation.joins(:organization).where("organization_invitations.user_id = ? AND admin = ?", params[:user_id],false).select("organizations.id, organizations.name as name, admin, organizations.description as description, organizations.banner_picture as banner_picture, organizations.created_at")

  end

  # GET /organization_invitations/1
  # GET /organization_invitations/1.json
  def show
  end

  # GET /organization_invitations/new
  def new
    @organization_invitation = OrganizationInvitation.new
  end

  # GET /organization_invitations/1/edit
  def edit
  end

  # POST /organization_invitations
  # POST /organization_invitations.json
  def create
    @organization_invitation = OrganizationInvitation.new(organization_invitation_params)

    respond_to do |format|
      if @organization_invitation.save
        format.html { redirect_to @organization_invitation, notice: 'Organization invitation was successfully created.' }
        format.json { render :show, status: :created, location: @organization_invitation }
      else
        format.html { render :new }
        format.json { render json: @organization_invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organization_invitations/1
  # PATCH/PUT /organization_invitations/1.json
  def update
    respond_to do |format|
      if @organization_invitation.update(organization_invitation_params)
        format.html { redirect_to @organization_invitation, notice: 'Organization invitation was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization_invitation }
      else
        format.html { render :edit }
        format.json { render json: @organization_invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_invitations/1
  # DELETE /organization_invitations/1.json
  def destroy
    @organization_invitation.destroy
    respond_to do |format|
      format.html { redirect_to organization_invitations_url, notice: 'Organization invitation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization_invitation
      @organization_invitation = OrganizationInvitation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def organization_invitation_params
      params.fetch(:organization_invitation, {})
    end
end
