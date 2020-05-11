class Api::V1::CommentsController < ApiController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Event.find(params[:event_id]).comments
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.event = Event.find(params[:event_id])
    @comment.event_invitation = EventInvitation.find(params[:event_invitation_id])

    respond_to do |format|
      if @comment.save
        format.json { render :show, status: :created, location: api_v1_comment_path(@comment) }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.json { render :show, status: :ok, location: api_v1_comment_path(@comment) }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    respond_to do |format|
      if @comment.destroy
        format.json { head :no_content }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.fetch(:comment, {}).permit(:id, :content, :commented_id, :event_invitation_id, :event_id, :created_at, :updated_at)
    end
end