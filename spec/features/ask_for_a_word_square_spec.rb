require 'spec_helper'

describe 'homepage' do
  it 'asks for an integer and given 1 returns no word squares' do
    visit root_path
    fill_in 'word_square_dimension', with: '1'
    click_button 'submit'
    expect(page).to have_content 'No word square'
  end
end
