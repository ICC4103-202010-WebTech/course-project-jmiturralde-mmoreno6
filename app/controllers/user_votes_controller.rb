class UserVotesController < ApplicationController
  before_action :set_user_vote, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource :event_invitation

  # GET /user_votes
  # GET /user_votes.json
  def index
    @user_votes = UserVote.all
  end

  # GET /user_votes/1
  # GET /user_votes/1.json
  def show
  end

  # GET /user_votes/new
  def new
    @user = User.all.where('id = ?', EventInvitation.find(params[:event_invitation_id]).user_id).first
    @event_invitation = EventInvitation.find(params[:event_invitation_id])
    @event = EventInvitation.find(params[:event_invitation_id]).event
    if @event.user_votes.exists?(event_invitation_id: @event_invitation.id)
      redirect_back(fallback_location: root_path)
      flash[:alert] = "You have already vote for this Event"
    else
      @event_invitation = EventInvitation.find(params[:event_invitation_id])
      @user_vote = UserVote.new
    end
  end

  # GET /user_votes/1/edit
  def edit
  end

  # POST /user_votes
  # POST /user_votes.json
  def create
    @event_invitation = EventInvitation.find(params[:event_invitation_id])
    @user_vote = UserVote.new(user_vote_params)
    @user_vote.event_invitation = @event_invitation

    respond_to do |format|
      if @user_vote.save
        format.html { redirect_to user_event_invitations_path(@event_invitation.user), notice: 'User vote was successfully created.' }
        format.json { render :show, status: :created, location: @user_vote }
      else
        format.html { render :new }
        format.json { render json: @user_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_votes/1
  # PATCH/PUT /user_votes/1.json
  def update
    respond_to do |format|
      if @user_vote.update(user_vote_params)
        format.html { redirect_to @user_vote, notice: 'User vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_vote }
      else
        format.html { render :edit }
        format.json { render json: @user_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_votes/1
  # DELETE /user_votes/1.json
  def destroy
    @user_vote.destroy
    respond_to do |format|
      format.html { redirect_to user_votes_url, notice: 'User vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_vote
      @user_vote = UserVote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_vote_params
      params.fetch(:user_vote, {}).permit(:event_date_id, :event_invitation_id)
    end
end
