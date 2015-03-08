require 'spec_helper'

describe 'Starting entries' do
  it 'creates new entry with start time of now and blank end time' do
    expect(Entry.all.count).to be(0)

    visit root_path
    click_link 'Start'

    expect(page).to have_content('Starting Entry')

    fill_in 'entry[notes]', with: 'A "running" entry'
    click_button 'Save'

    expect(page).to have_content('Time Entries')
    expect(Entry.all.count).to be(1)
    expect(Entry.first.running).to be(true)
  end
end
