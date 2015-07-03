require 'rails_helper'

RSpec.feature 'Listing entries', type: :feature do
  given!(:new_entry) { FactoryGirl.create(:entry) }
  given!(:old_entry) { FactoryGirl.create(:entry, created_at: 1.day.ago) }

  scenario 'User can see the list of entries' do
    visit '/'
    expect(page).to have_text(new_entry.name)
    expect(page).to have_text(old_entry.name)
    expect(page).to have_text('1 day')
  end

  scenario 'New entry should be listed on top' do
    visit '/'
    table_names = all('td:first-child')
    expect(table_names.first.text).to eq(old_entry.name)
    expect(table_names.last.text).to eq(new_entry.name)
  end
end
