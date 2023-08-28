require 'rails_helper'

RSpec.describe "Circulation", type: :request do
  let(:book) { double("Book", id: 1) }
  let(:patron) { double("Patron", id: 1) }
  let(:book_api_response) {
    double(
      "book_api_response",
      success?: true,
      body: { "title": "title example", "author": "example"}.to_json
    )
  }

  let(:patron_api_response) {
    double(
      "patron_api_response",
      success?: true,
      body: { "name": "example name", "email": "example@example.com" }.to_json
    )
  }

  describe "POST /check_out" do
    it "creates a new circulation data entry" do
      allow(book).to receive(:find).with(book.id.to_s).and_return(book)
      allow(patron).to receive(:find).with(patron.id.to_s).and_return(patron)
      allow(HTTParty).to receive(:get).with("http://books-api-service:3000/books/#{book.id.to_s}").and_return(book_api_response)
      allow(HTTParty).to receive(:get).with("http://patrons-api-service:3001/patrons/#{patron.id.to_s}").and_return(patron_api_response)

      post "/check_out", params: { book_id: book.id, patron_id: patron.id }
      expect(response).to have_http_status(:created)
      expect(Circulation.count).to eq(1)
    end
  end

  describe "POST /check_in" do
    it "creates a new circulation data entry" do
      allow(book).to receive(:find).with(book.id.to_s).and_return(book)
      allow(HTTParty).to receive(:get).with("http://books-api-service:3000/books/#{book.id.to_s}").and_return(book_api_response)

      post "/check_in", params: { book_id: book.id }
      expect(response).to have_http_status(:created)
      expect(Circulation.count).to eq(1)
    end
  end
end
