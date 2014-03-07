class TicketsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = current_user.tickets.new ticket_params
    if @ticket.save
      redirect_to tickets_url
    else
      render :new
    end
  end

  def complete
    @ticket = Ticket.find(params[:id])
    if @ticket.user === current_user
      @ticket = current_user.tickets.find(params[:id])
      if @ticket.status == false    
        @ticket.status = true
        @ticket.save
      else
        @ticket.status = false
        @ticket.save
      end    
      redirect_to tickets_path
    else
      redirect_to tickets_path, alert: "Sorry, you can not edit this ticket"
    end
    # respond_to do |format|
    #   if @ticket.save
    #     format.html {redirect_to tickets_url, notice: "Thanks for your Ticket!"}
    #     format.js 
    #   else
    #     redirect_to tickets_url
    #   end
    # end
  end

  private

  def ticket_params
    params.require(:ticket).permit([:title, :body])
  end
end
