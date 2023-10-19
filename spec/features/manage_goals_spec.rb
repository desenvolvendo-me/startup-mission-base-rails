require 'rails_helper'

RSpec.feature 'Manager Goals', type: :feature do
  before do
    Goal.create!(name: 'Aprender Ruby')
    Goal.create!(name: 'Aprender Rails')
  end

  scenario 'User visits the goals index page' do
    visit manager_goals_path

    expect(page).to have_text('Aprender Ruby')
    expect(page).to have_text('Aprender Rails')
  end

  scenario 'User creates a new goal' do
    visit new_manager_goal_path

    fill_in 'Nome', with: 'Aprender Ruby on Rails'
    click_button 'Salvar'

    expect(page).to have_text('Objetivo cadastrado com sucesso.')
    expect(page).to have_text('Aprender Ruby on Rails')
  end

  scenario 'User views a goal' do
    visit manager_goal_path(Goal.first)

    expect(page).to have_text('Aprender Ruby')
  end

  scenario 'User deletes a goal' do
    visit manager_goal_path(Goal.first)
    click_link I18n.t('views.manager.goals.delete')

    page.accept_alert I18n.t('views.manager.goals.delete_confirm')
    expect(page).to have_text('Objetivo apagado com sucesso.')
    expect(page).not_to have_text('Aprender Ruby')
  end
end
