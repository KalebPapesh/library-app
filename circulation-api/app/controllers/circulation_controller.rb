require 'httparty'

class CirculationController < ApplicationController
  def check_out
    book_id = params[:book_id]
    patron_id = params[:patron_id]

    # Check if book and patron exist
    book = fetch_book(book_id)
    patron = fetch_patron(patron_id)

    if book && patron
      # Calculate return date as 2 weeks from now
      return_date = 2.weeks.from_now
      timestamp = Time.now

      result = Circulation.create(book_id: book_id, patron_id: patron_id, return_date: return_date, timestamp: timestamp, action_type: "check_out")

      render json: result, status: :created
    else
      render json: { error: 'Book or patron not found' }, status: :not_found
    end
  end

  def check_in
    book_id = params[:book_id]

    book = fetch_book(book_id)

    if book
      timestamp = Time.now
      result = Circulation.create(book_id: book_id, timestamp: timestamp, action_type: "check_in")
      render json: result, status: :created
    else
      render json: { error: 'Book not found' }, status: :not_found
    end
  end

  private

  def fetch_book(book_id)
    response = HTTParty.get("http://books-api-service:3000/books/#{book_id}")
    response.success? ? JSON.parse(response.body) : nil
  end

  def fetch_patron(patron_id)
    response = HTTParty.get("http://patrons-api-service:3001/patrons/#{patron_id}")
    response.success? ? JSON.parse(response.body) : nil
  end
end
