require 'spec_helper'
require 'player'

feature "Player Attack" do



  scenario "Player 1 attacks Player 2 and receives confirmation" do
    sign_in_and_play
    click_button "Attack"
    expect(page).to have_content "Lou attacked Zee and they lost 10hp"
  end

  scenario 'Player 1 attacks player 2 and decreases their HP by 2' do
    sign_in_and_play
    click_button "Attack"
    click_button "Play on..."
    expect(page).to have_content "Zee: 90hp"
    expect(page).not_to have_content "Zee: 100hp"
  end

end
