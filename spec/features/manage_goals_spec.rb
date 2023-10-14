require 'rails_helper'

RSpec.feature "Manager Goals", type: :feature do

  before do
    Goal.create!(name: "Learn Ruby")
    Goal.create!(name: "Learn Rails")
  end

  scenario "User visits the goals index page" do
    visit manager_goals_path

    expect(page).to have_text("Learn Ruby")
    expect(page).to have_text("Learn Rails")
  end

  scenario "User creates a new goal" do
    visit new_manager_goal_path

    fill_in "Name", with: "Learn Ruby on Rails"
    click_button "Save"

    expect(page).to have_text("Goal was successfully created.")
    expect(page).to have_text("Learn Ruby on Rails")
  end

  scenario "User views a goal" do
    visit manager_goal_path(Goal.first)

    expect(page).to have_text("Learn Ruby")
  end

  scenario "User deletes a goal" do
    visit manager_goal_path(Goal.first)
    click_link "Destroy"

    expect(page).to have_text("Goal was successfully destroyed.")
    expect(page).not_to have_text("Learn Ruby")
  end
end
