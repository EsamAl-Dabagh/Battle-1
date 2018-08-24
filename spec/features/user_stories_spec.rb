feature "Submit names" do
  # As two Players,
  # So we can play a personalised game of Battle,
  # We want to Start a fight by entering our names and seeing them
  scenario "players enter their names" do
    sign_in_and_play
    expect(page).to have_content("Hagrid", "Dumbledore")
  end
end

feature "see hit points" do
  # As Player 1,
  # So I can see how close I am to winning
  # I want to see Player 2's Hit Points
  scenario "can see Player 2's Hit Points" do 
    sign_in_and_play
    expect(page).to have_content("HP = 100")
  end
end

feature "attack player 2" do
  # As Player 1,
  # So I can win a game of Battle,
  # I want to attack Player 2, and I want to get a confirmation
  scenario "player 1 attacks player 2 and sees confirmation" do
    sign_in_and_play
    click_link "Attack"
    expect(page).to have_content("Hagrid attacked Dumbledore")
  end

  # As Player 1,
  # So I can start to win a game of Battle,
  # I want my attack to reduce Player 2's HP by 10
  scenario "reduce Player 2's HP by 10" do
    sign_in_and_play
    click_link "Attack"
    expect(page).to have_content("HP = 90")
  end

  feature "switch turns" do 
    # As two Players,
    # So we can continue our game of Battle,
    # We want to switch turns
    scenario "switch to player 2's turn" do
      sign_in_and_play
      click_link "Attack"
      expect(page).to have_content("It's Dumbledore's turn")
    end
  end
end
