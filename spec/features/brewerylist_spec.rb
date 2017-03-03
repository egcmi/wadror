require 'rails_helper'

describe "brewerylist page" do

  before :all do
    self.use_transactional_fixtures = false
    WebMock.disable_net_connect!(allow_localhost:true)
  end

  before :each do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start

    @brewery1 = FactoryGirl.create(:brewery, name: "Koff", year:1897)
    @brewery2 = FactoryGirl.create(:brewery, name: "Schlenkerla", year:1405)
    @brewery3 = FactoryGirl.create(:brewery, name: "Ayinger", year:1877)

  end

  after :each do
    DatabaseCleaner.clean
  end

  after :all do
    self.use_transactional_fixtures = true
  end

  it "shows breweries by name in ascending order", js: true do
    visit brewerylist_path
    click_link('Name')
    find('table').find('tr:nth-child(2)')
    expect(page).to have_content "Ayinger"
    find('table').find('tr:nth-child(3)')
    expect(page).to have_content "Koff"
    find('table').find('tr:nth-child(4)')
    expect(page).to have_content "Schlenkerla"
  end
end