require "rails_helper"

RSpec.describe Book, type: :model do
  it "is valid with a title" do
    book = Book.new(title: "Dune")

    expect(book).to be_valid
  end

  it "is invalid without a title" do
    book = Book.new(title: "")

    expect(book).not_to be_valid
    expect(book.errors[:title]).to include("can't be blank")
  end

  it "stores the author" do
    book = Book.new(title: "Dune", author: "Frank Herbert")

    expect(book.author).to eq("Frank Herbert")
  end

  it "stores the price" do
    book = Book.new(title: "Dune", price: 12.99)

    expect(book.price).to eq(12.99)
  end

  it "stores the published date" do
    published_date = Date.new(1965, 8, 1)
    book = Book.new(title: "Dune", published_date: published_date)

    expect(book.published_date).to eq(published_date)
  end
end
