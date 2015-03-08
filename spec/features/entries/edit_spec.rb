require 'spec_helper'

describe 'Editing entries' do
  it 'redirects to the entries page on success' do
    entry = Entry.create(
      :start => Time.now,
      :stop  => nil,
      :notes => "I forgot that this field can't be blank"
    )
    entry.save
    expect(Entry.all.count).to eq(1)

    visit root_path
    click_link 'edit'

    expect(page).to have_content('Editing Entry')

    fill_in 'entry[stop]', with: ( Time.now + 10 )
    fill_in 'entry[notes]', with: "Edited description"
    click_button 'Save'

    expect(page).to have_content('Time Entries')
    expect(Entry.first.stop).to_not be(nil)
  end

  it 'displays an error if start time is deleted' do
    Entry.create(
      :start   => Time.now,
      :stop    => nil,
      :notes   => "I forgot that this field can't be blank"
    )
    expect(Entry.all.count).to be(1)

    visit root_path
    click_link 'edit'

    expect(page).to have_content('Editing Entry')

    fill_in 'entry[start]', with: ''
    fill_in 'entry[stop]', with: Time.now
    fill_in 'entry[notes]', with: "Edited description"
    click_button 'Save'

    expect(page).to have_content('Editing Entry')
    expect(Entry.first.start).not_to be(nil)
  end
end
