def sign_in_and_play
  visit("/")
    fill_in :player01, with: "Hagrid"
    fill_in :player02, with: "Dumbledore"

    click_button "Submit"
end

def player02_loses_100_HP
  sign_in_and_play
  19.times do
    click_link "Attack"
    click_link "Play on"
  end
end
