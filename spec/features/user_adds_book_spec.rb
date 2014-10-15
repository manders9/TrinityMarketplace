require "rails_helper"

feature "user creates a book listing", %{
  As a user
  I want to add a book listing
  So that I can provide post my
  book to provide other users with
  the opportunity to purchase the
  book

  Acceptance Criteria:

  I must add a new book listing from
  the user books index page
  I must include a title, author, condition
  and price, or there are errors
  I can optionally add a description and
  status
  } do

  context "authenticated user" do
    before :each do
      @user = FactoryGirl.create(:user)
      sign_in_as(@user)
    end

    scenario "book successfully added" do
      book = FactoryGirl.build(:user_book, user: @user)

      binding.pry

      visit new_user_book_path

      fill_in "Title", with: book.title
      fill_in "Author", with: book.author
      fill_in "Condition", with: book.condition
      fill_in "Price", with: book.price
      fill_in "Description", with: book.description
      fill_in "Status", with: book.status

      click_on "Submit Book"

      expect(page).to have_content "Book successfully created."
    end

    scenario "book creation fails due to missing fields" do
      book = FactoryGirl.build(:user_book, user: @user)

      visit new_user_book_path

      click_on "Submit Book"

      expect(page).to have_content "can't be blank"
    end

    scenario "book creation fails due to incorrect price" do

    end
  end
end
