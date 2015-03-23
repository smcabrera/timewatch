require 'rails_helper'

describe EntriesController do
  before do
    @entry = Entry.create(
      :id    => 1,
      :start => Time.now,
      :stop  => Time.now + 1,
      :notes => 'This is a note'
    )
  end

  describe "GET #index" do
    it 'populates an array of time entries' do
      entry = @entry
      get :index
      assigns(:entries).to_a.should eq([entry])
    end

    it 'renders the :index view' do
      get :index
      response.should render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the requested time entry to @entry' do
      entry = @entry
      get :show, id: @entry.id
      assigns(:entry).should eq(entry)
    end

    it 'renders the show template' do
      get :show, id: @entry.id
      response.should render_template :show
    end
  end

  describe 'GET #new' do
    it 'assigns a new time entry to @entry' do
      get :new
      assigns(:entry).should be_a(Entry)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new time entry in the database' do
        expect {
          post :create, entry: @entry.attributes
        }.to change(Entry, :count).by(1)
      end
      xit 'redirects to the homepage'
    end

    context 'with invalid attributes' do
      xit 'does not save the new time entry in the database'
      xit 're-renders the :new template'
    end
  end
end

