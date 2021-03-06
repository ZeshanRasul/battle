require 'spec_helper'
require 'player'

describe 'switching turns' do
  context 'seeing the current turn' do
    scenario 'at the start of the game' do
      sign_in_and_play
      expect(page).to have_content "Lou's turn"
    end

    scenario 'after player_1 attacks' do
      sign_in_and_play
      click_button "Attack"
      click_button "Play on..."
      expect(page).not_to have_content "Lou's turn"
      expect(page).to have_content "Zee's turn"
    end
  end
end
