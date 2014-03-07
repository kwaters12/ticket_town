require 'spec_helper'

describe TicketController do
  describe "#index" do
    it "is successful do" do
      get :index
      expect(response).to be_success
    end
  end

  describe "#new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end

  describe "#create" do
    it "creates a new ticket" do
      expect do
        post :create, ticket: {title: 'bacon', body: 'eggs'}
      end.to change {Ticket.count}.by(1)
    end
    it "redirects to show all tickets" do
      post :create, ticket: {title: 'bacon', body: 'eggs'}
      expect(response).to be_redirect 
  end

  describe "#complete" do
    it "sets a task as resolved when clicked" do
      post :create, ticket: {title: 'bacon', body: 'eggs'}
    end
  end
end
