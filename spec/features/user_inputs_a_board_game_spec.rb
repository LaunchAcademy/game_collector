require "rails_helper"

feature "Input a Board Game", %q(

  As a 7th Level Dungeon Master
  I want to save the details of a board game that I own
  So that I can have a digital record of it.

  Acceptance Criteria
  [x] I must enter a name, publisher, description, and release_date
  [x] Description must be a minimum of 50 characters
  [x] If all fields are complete, I am told that my board game has been saved
  [x] If a field is incomplete, I am given an error message and brought back to the input form.
  [x] If a board game already exists in the database, I am given an error message.
  [ ] I must be signed in to add a board game.

) do

  context "authenticated user" do
    before(:each) do
      user = User.create(
        first_name: "Gene",
        last_name: "Parmesan",
        email: "gparmesan@privateeyes.com",
        password: "supersecret"
      )

      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"

      visit new_board_game_path
    end

    scenario 'user inputs a board game' do
      fill_in "Name", with: "Settlers of Catan"
      fill_in "Publisher", with: "Mayfair Games"
      fill_in "Description", with: "Best Game Evar! xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      select "2014", from: "board_game_release_date_1i"
      select "December", from: "board_game_release_date_2i"
      select "30", from: "board_game_release_date_3i"
      click_on "Create Board Game"

      expect(page).to have_content("Board Game Created!")
    end

    scenario "user is given an error if they forget fields" do
      click_on "Create Board Game"

      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Publisher can't be blank")
      expect(page).to have_content("Description is too short (minimum is 50 characters)")
      expect(page).to have_content("New Board Game")
    end

    scenario "user enters duplicate board game" do
      board_game = BoardGame.create(
        name: "Monopoly",
        publisher: "Milton Bradley",
        description: "It really never ends. xxxxxxxxxxxxxxxxxxxxxxxxxxxx",
        release_date: Date.today
      )
      month = Date::MONTHNAMES[board_game.release_date.month]

      fill_in "Name", with: board_game.name
      fill_in "Publisher", with: board_game.publisher
      fill_in "Description", with: board_game.description
      select board_game.release_date.year, from: "board_game_release_date_1i"
      select month, from: "board_game_release_date_2i"
      select board_game.release_date.day, from: "board_game_release_date_3i"
      click_on "Create Board Game"

      expect(page).to have_content("This board game already exists in our records!")
    end
  end

  context "unauthenticated user" do
    scenario "can't access new board game form" do
      visit new_board_game_path

      expect(page).to have_content "You need to sign in or sign up before continuing"
    end
  end
end
