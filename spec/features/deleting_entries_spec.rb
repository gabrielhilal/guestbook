require 'rails_helper'

RSpec.feature 'Deleting entries', type: :feature do
  given!(:first_entry) { FactoryGirl.create(:entry, created_at: 1.day.ago) }
  given!(:second_entry) { FactoryGirl.create(:entry, name: 'someone 2') }

  scenario 'User deletes the first entry' do
    visit '/'
    first(:button, 'delete').click
    expect(page).to_not have_text(second_entry.name)
    expect(page).to have_text(first_entry.name)
    expect(page).to have_text('The entry was deleted succesfully')
  end
end
