require 'spec_helper'

describe 'Creating entries' do
  it 'redirects to the entries index page on success' do
    expect(Entry.all.count).to be(0)

    visit root_path
    click_link 'New Entry'

    expect(page).to have_content('New Entry')

    fill_in 'entry[start]', with: Time.now
    fill_in 'entry[stop]', with: (Time.now + 10)
    fill_in 'entry[notes]', with: 'Description of new entry'
    click_button 'Save'

    expect(page).to have_content('Time Entries')
    expect(Entry.all.count).to be(1)
    expect(Entry.first.running?).to be(false)
  end

  it 'displays an error if no start time is given' do
    expect(Entry.all.count).to be(0)

    visit root_path
    click_link 'New Entry'
    expect(page).to have_content('New Entry')

    fill_in 'entry[stop]', with: (Time.now + 10)
    fill_in 'entry[notes]', with: 'Description of new entry'
    click_button 'Save'

    expect(page).to have_content('New Entry')
    expect(Entry.all.count).to be(0)
  end

  it 'displays an error if the notes field is left blank' do
    expect(Entry.all.count).to be(0)

    visit root_path
    click_link 'New Entry'
    expect(page).to have_content('New Entry')

    fill_in 'entry[start]', with: (Time.now)
    fill_in 'entry[stop]', with: (Time.now + 10)
    fill_in 'entry[notes]', with: ''
    click_button 'Save'

    expect(page).to have_content('New Entry')
    expect(Entry.all.count).to be(0)
  end
end

