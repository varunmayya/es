class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :get_event
  before_action :authenticate_user!, :except => [:show, :index]
  # GET /tickets
  # GET /tickets.json

  
  def index
    @tickets = @event.tickets
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @tickets = @event.tickets.find(params[:id])
  end

  # GET /tickets/new
  def new
    @ticket = @event.tickets.build
  end

  # GET /tickets/1/edit
  def edit
    @ticket = @event.tickets.find(params[:id])
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = @event.tickets.create(ticket_params)
    #@ticket.event_id = params[:modal]
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to [@ticket.event, @ticket], notice: 'Ticket was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ticket }
      else
        format.html { render action: 'new' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    @ticket = @event.tickets.find(params[:id])
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to event_ticket_path(@event.ticket), notice: 'Ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket = @event.tickets.find(params[:id])
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to event_tickets_url }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:name, :description, :price, :quantity, :sales_start_datetime, :sales_end_datetime, :event_id)
    end
    
    def get_event
    @event = Event.find(params[:event_id])
    end
    
end
