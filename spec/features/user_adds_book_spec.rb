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

      visit new_user_book_path

      fill_in "Title", with: book.title
      fill_in "Author", with: book.author
      fill_in "Condition", with: book.condition
      fill_in "Price", with: book.price
      fill_in "Description", with: book.description
      fill_in "Status", with: book.status

      click_on "Submit Book"

      expect(page).to have_content "Book successfully added."
    end

    scenario "book creation fails due to missing fields" do
      book = FactoryGirl.build(:user_book, user: @user)

      visit new_user_book_path

      click_on "Submit Book"

      expect(page).to have_content "Title can't be blank"
      expect(page).to have_content "Author can't be blank"
      expect(page).to have_content "Condition can't be blank"
      expect(page).to have_content "Price can't be blank"
    end
  end

  context "unauthenticated user" do
    scenario "user cannot add a book" do
      visit new_user_book_path

      expect(page).to have_content
      "You need to sign in or sign up before continuing."
    end

    scenario "user doesn't have access to List a Book button" do
      visit user_books_path
      expect(page).to_not have_button "List a Book"
    end
  end
end
