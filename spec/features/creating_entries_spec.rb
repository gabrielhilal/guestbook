require 'rails_helper'

RSpec.feature 'Creating entries', type: :feature do
  scenario 'User submits name and message' do
    visit '/'
    fill_in 'Name', with: 'someone'
    fill_in 'Message', with: 'some text'
    click_button 'Submit'

    expect(page).to have_text('The entry was created succesfully')
    expect(page).to have_text('someone')
    expect(page).to have_text('some text')
  end

  scenario 'User submits empty form' do
    visit '/'
    click_button 'Submit'

    expect(page).to have_text("Name can't be blank")
    expect(page).to have_text("Message can't be blank")
  end
end
