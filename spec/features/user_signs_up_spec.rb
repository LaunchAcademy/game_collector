require "rails_helper"

feature "Input a Board Game", %q(
  As a Board Game Fanboy (or Fangirl)
  I want to sign up for the Game Collector application
  So that I can use all of its awesome features.

  Acceptance Criteria

  - [x] There is a link to 'Sign Up' on the homepage.
  - [x] If I fill in my first name, last name, email, password, and password confirmation correctly, I am greeted with a confirmation message that my account has been created.
  - [ ] If the password and password confirmation fields do not match, I am given an error message.
  - [ ] If my email already exists in the database, I am given a message that tells me I have already registered.
  - [ ] If my email is not formatted correctly, I am given an error message.
) do

  scenario "user provides valid information" do
    visit root_path
    click_on "Sign Up"

    fill_in "First Name", with: "Gene"
    fill_in "Last Name", with: "Parmesan"
    fill_in "Email", with: "gparmesan@privateeyes.com"
    fill_in "Password", with: "supersecret"
    fill_in "Password confirmation", with: "supersecret"
    click_on "Sign up"

    expect(page).to have_content "Welcome! Your account has been created."
  end

  scenario "password fields do not match" do
    visit root_path
    click_on "Sign Up"

    fill_in "First Name", with: "Gene"
    fill_in "Last Name", with: "Parmesan"
    fill_in "Email", with: "gparmesan@privateeyes.com"
    fill_in "Password", with: "supersecret"
    fill_in "Password confirmation", with: "notmypassword"
    click_on "Sign up"

    expect(page).to have_content "Password confirmation doesn't match"
  end
end
