require 'rails_helper'

describe "Create new book", type: :feature do
  scenario "will create a new book" do
    # As a user
    #
    # When I visit the page to create a new book
    visit new_book_path
    # And I fill in the book title
    fill_in "book[title]", with: "The Lord of Flies"
    # And I fill in the price
    fill_in "Price", with: 15.99
    # And I enter the quantity of books
    fill_in "book[quantity]", with: 3
    #
    # And I click create book
    click_button("Create Book") # or find("Create Book").click
    #
    # Then I expect to be on the new book's page
    expect(current_path).to eq(book_path(Book.last))
    # and I expect to see the book's title
    # and I expect to see the book's price
    # and I expect to see the book's quantity
    within("div.book_info") do # for nth child within("div.book_info li:nth-child(10)") or within("div.book_info li:last")
      expect(page).to have_content("The Lord of Flies")
      expect(page).to have_content("Price: $15.99")
      expect(page).to have_content("Quantity: 3")
    end

  end
end
