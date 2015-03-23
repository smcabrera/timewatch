require 'spec_helper'

describe 'Deleting entries' do
  it 'redirects to the entries index page on success' do

    entry = Entry.create(:start => Time.now, :stop => Time.now + 1, :notes => "Notes")
    entry_count = Entry.all.count
    expect(Entry.all.count).to be(1)

    visit root_path
    click delete

    expect(Entry.all.count).not_to be(entry_count)
  end
end
