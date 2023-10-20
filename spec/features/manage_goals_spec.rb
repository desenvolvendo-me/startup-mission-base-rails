require 'rails_helper'

RSpec.feature 'Manager Goals', type: :feature do
  before do
    create(:goal, name: 'Aprender Ruby')
    create(:goal, name: 'Aprender Rails')
  end

  scenario 'list goals' do
    visit manager_goals_path

    expect(page).to have_text('Aprender Ruby')
    expect(page).to have_text('Aprender Rails')
  end

  scenario 'create goal' do
    visit new_manager_goal_path

    fill_in 'Nome', with: 'Aprender Ruby on Rails'
    click_button I18n.t('views.manager.goals.save')

    expect(page).to have_text('Meta cadastrada com sucesso.')
    expect(page).to have_text('Aprender Ruby on Rails')
  end

  scenario 'show goal' do
    visit manager_goal_path(Goal.first)

    expect(page).to have_text('Aprender Ruby')
  end

  scenario 'update goal' do
    visit manager_goal_path(Goal.last)
    click_link I18n.t('views.manager.goals.edit')

    fill_in 'Nome', with: 'Aprender Ruby on Rails'
    fill_in 'Descrição', with: 'Criar projeto editora de livro'
    click_button I18n.t('views.manager.goals.save')

    expect(page).to have_text('Meta atualizada com sucesso.')
    expect(page).to have_text('Aprender Ruby on Rails')
  end

  scenario 'delete goal' do
    visit manager_goal_path(Goal.first)
    click_link I18n.t('views.manager.goals.delete')

    page.accept_alert I18n.t('views.manager.goals.delete_confirm')
    expect(page).to have_text('Meta apagada com sucesso.')
    expect(page).not_to have_text('Aprender Ruby')
  end
end
