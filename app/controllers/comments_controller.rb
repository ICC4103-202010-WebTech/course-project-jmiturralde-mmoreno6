class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Event.find(params[:event_id]).comments.where("commented_id IS NULL")
    @event = Event.find(params[:event_id])
    @users =[]
    @comments.each do |comment|
      @users.append(Comment.find(comment.id).event_invitation.user)
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])
    @replies_comments = Comment.all.where("commented_id = ?", params[:id])
    @users =[]
    @replies_comments.each do |comment|
      @users.append(Comment.find(comment.id).event_invitation.user)
      end
  end

  # GET /comments/new
  def new
    @event= Event.find(params[:event_id])

    if @user.id == Event.find(params[:event_id]).user.id
      redirect_back(fallback_location: root_path)
      flash[:alert] = "The event creator can't comment his own event"
    end

    @comment = Comment.new()
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @event_invitation = EventInvitation.where("user_id = ? AND event_id = ?", @user.id, params[:event_id]).first
    @comment = Comment.new(comment_params)
    @comment.event_invitation = @event_invitation
    @comment.event = Event.find(params[:event_id])
    @comment.commented_id = params[:comment][:commented_id]
    respond_to do |format|
      if @comment.save
        format.html { redirect_to event_comments_path(params[:event_id]), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.fetch(:comment, {}).permit(:id, :content, :commented_id, comment_images: [])
    end
end
