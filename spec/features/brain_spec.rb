require 'spec_helper'
require 'rake'

feature "brain stuff" do
  before :all do
    Rake.application.rake_require "tasks/import_animals_csv"
    Rake::Task.define_task(:environment)
    Rake::Task["csv:import_csv"].reenable
    Rake.application.invoke_task "csv:import_csv"
  end
  scenario "finds brains" do

    visit "/"

    expect(page).to have_content "Brains"

  end

  scenario "seed file populates the table" do
    visit "/"
    expect(page).to have_content("Mountain beaver")
  end
end