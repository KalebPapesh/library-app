require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "GET /books" do
    it "returns a successful response" do
      get "/books"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /books/:id" do
    let(:book) { create(:book) }

    it "returns a successful response" do
      get "/books/#{book.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /books" do
    let(:valid_attributes) { { title: "Sample Title", author: "Sample Author" } }

    it "creates a new book" do
      expect {
        post "/books", params: { book: valid_attributes }
      }.to change(Book, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe "PATCH /books/:id" do
    let!(:book) { create(:book) }
    let(:new_attributes) { { title: "Updated Title" } }

    it "updates the book" do
      patch "/books/#{book.id}", params: { book: new_attributes }
      book.reload
      expect(book.title).to eq("Updated Title")
    end
  end

  describe "DELETE /books/:id" do
    let!(:book) { create(:book) }

    it "destroys the book" do
      expect {
        delete "/books/#{book.id}"
      }.to change(Book, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
