require "rails_helper"

RSpec.describe "Books", type: :request do
  describe "POST /main/index" do
    it "creates a book and shows a success notice" do
      expect {
        post main_index_path, params: {
          book: {
            title: "Dune",
            author: "Frank Herbert",
            price: 12.99,
            published_date: "1965-08-01"
          }
        }
      }.to change(Book, :count).by(1)

      expect(response).to redirect_to(main_index_path)
      expect(flash[:notice]).to eq("Book was added.")
      expect(Book.last.title).to eq("Dune")
    end

    it "does not create a book with a blank title" do
      expect {
        post main_index_path, params: {
          book: {
            title: "",
            author: "Frank Herbert",
            price: 12.99,
            published_date: "1965-08-01"
          }
        }
      }.not_to change(Book, :count)

      expect(response).to redirect_to(new_book_path)
      expect(flash[:alert]).to eq("Title can't be blank.")
    end
  end

  describe "GET /books/:id" do
    it "shows all book information" do
      book = Book.create!(
        title: "Dune",
        author: "Frank Herbert",
        price: 12.99,
        published_date: Date.new(1965, 8, 1)
      )

      get book_path(book)

      expect(response).to have_http_status(:success)
      expect(response.body).to include("Dune", "Frank Herbert", "12.99", "1965")
    end
  end

  describe "GET /books/new" do
    it "shows the add-book form" do
      get new_book_path

      expect(response).to have_http_status(:success)
      expect(response.body).to include("Add a Book")
    end
  end
end
