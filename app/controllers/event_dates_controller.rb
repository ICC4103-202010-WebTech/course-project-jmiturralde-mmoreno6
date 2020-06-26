class EventDatesController < ApplicationController
  before_action :set_event_date, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource :event

  # GET /event_dates
  # GET /event_dates.json
  def index
    @event_dates = Event.find(params[:event_id]).event_dates
    @creator_user = Event.find(params[:event_id]).user
    @users_votes =[]
    @event_dates.each do |date|
      @users_votes.append(UserVote.where("event_date_id = ?", date).count)
    end
  end
  # GET /event_dates/1
  # GET /event_dates/1.json
  def show
  end

  # GET /event_dates/new
  def new
    @event = Event.find(params[:event_id])
    @event_date = EventDate.new
  end

  # GET /event_dates/1/edit
  def edit
  end

  # POST /event_dates
  # POST /event_dates.json
  def create
    @event_date = EventDate.new(event_date_params)
    @event = Event.find(params[:event_id])
    @event_date.event = @event

    respond_to do |format|
      if @event_date.save
        format.html { redirect_to event_event_dates_path(@event.id), notice: 'Event date was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /event_dates/1
  # PATCH/PUT /event_dates/1.json
  def update
    respond_to do |format|
      if @event_date.update(event_date_params)
        format.html { redirect_to @event_date, notice: 'Event date was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_date }
      else
        format.html { render :edit }
        format.json { render json: @event_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_dates/1
  # DELETE /event_dates/1.json
  def destroy
    begin
      @event_date.destroy
      redirect_back(fallback_location: root_path)
      flash[:notice] = "The event date has been destroyed"
    rescue
      flash[:alert] = "Could not delete the event date!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_date
      @event_date = EventDate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_date_params
      params.fetch(:event_date, {}).permit(:event_date, :event_id)
    end
end
