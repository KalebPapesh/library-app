require 'rails_helper'

RSpec.describe "Patrons", type: :request do
  describe "GET /patrons" do
    it "returns a successful response" do
      get "/patrons"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /patrons/:id" do
    let(:patron) { create(:patron) }

    it "returns a successful response" do
      get "/patrons/#{patron.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /patrons" do
    let(:valid_attributes) { { name: "Sample Name", email: "Sample Email" } }

    it "creates a new patron" do
      expect {
        post "/patrons", params: { patron: valid_attributes }
      }.to change(Patron, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe "PATCH /patrons/:id" do
    let!(:patron) { create(:patron) }
    let(:new_attributes) { { email: "Updated Email" } }

    it "updates the patron" do
      patch "/patrons/#{patron.id}", params: { patron: new_attributes }
      patron.reload
      expect(patron.email).to eq("Updated Email")
    end
  end

  describe "DELETE /patrons/:id" do
    let!(:patron) { create(:patron) }

    it "destroys the patron" do
      expect {
        delete "/patrons/#{patron.id}"
      }.to change(Patron, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end
end
