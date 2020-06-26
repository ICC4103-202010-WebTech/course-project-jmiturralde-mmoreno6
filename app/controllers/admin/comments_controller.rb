class Admin::CommentsController < ApplicationController
  before_action :set_admin_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  # GET /admin/comments
  # GET /admin/comments.json
  def index
    @admin_comments = Comment.all.where("event_id = ?", params[:event_id])
    @event=Event.find(params[:event_id])
  end

  # GET /admin/comments/1
  # GET /admin/comments/1.json
  def show
  end

  # GET /admin/comments/new
  def new
    @admin_comment = Comment.new
    @admin_event = Event.find(params[:event_id])
  end

  # GET /admin/comments/1/edit
  def edit
    @admin_event = Event.find(@admin_comment.event.id)
  end

  # POST /admin/comments
  # POST /admin/comments.json
  def create
    if params[:comment][:user_id].nil?
      redirect_back(fallback_location: root_path)
      flash[:alert] = "No user selected"
    else
      @admin_comment = Comment.new(admin_comment_params)
      @admin_comment.event_invitation = EventInvitation.find_by(user_id: params[:comment][:user_id], event_id: params[:event_id])
      @admin_comment.event =Event.find(params[:event_id])
      respond_to do |format|
        if @admin_comment.save
          format.html { redirect_to admin_event_comments_path(params[:event_id]), notice: 'Comment was successfully created.' }
        else
          format.html { render :new }
        end
      end
    end
  end

  # PATCH/PUT /admin/comments/1
  # PATCH/PUT /admin/comments/1.json
  def update
    respond_to do |format|
      if @admin_comment.update(admin_comment_params)
        format.html { redirect_to admin_event_comments_path(@admin_comment.event.id), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_comment }
      else
        format.html { render :edit }
        format.json { render json: @admin_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/comments/1
  # DELETE /admin/comments/1.json
  def destroy
    @admin_comment.destroy
    respond_to do |format|
      format.html { redirect_to admin_event_comments_path(params[:event_id]), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_comment
      @admin_comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_comment_params
      params.fetch(:comment, {}).permit(:id, :content)
    end
end
