require 'rails_helper'

RSpec.describe Manager::GoalsController,
               type: :controller do
  let(:goal) { create(:goal) }
  let(:valid_attributes) do
    { name: 'New name',
      description: 'New description' }
  end
  let(:invalid_attributes) do
    { name: '', description: '' }
  end

  describe 'GET #index' do
    it 'assigns all goals as @goals' do
      get :index
      expect(assigns(:goals)).to eq([goal])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested goal as @goal' do
      get :show, params: { id: goal.id }
      expect(assigns(:goal)).to eq(goal)
    end
  end

  describe 'GET #new' do
    it 'assigns a new goal as @goal' do
      get :new
      expect(assigns(:goal)).to be_a_new(Goal)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested goal as @goal' do
      get :edit, params: { id: goal.id }
      expect(assigns(:goal)).to eq(goal)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Goal' do
        expect do
          post :create,
               params: { goal: valid_attributes }
        end.to change(Goal, :count).by(1)
      end

      it 'redirects to the created goal' do
        post :create,
             params: { goal: valid_attributes }
        expect(response).to redirect_to(manager_goal_path(Goal.last))
      end
    end

    context 'with invalid params' do
      it 're-renders the "new" template' do
        post :create,
             params: { goal: invalid_attributes }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested goal' do
        put :update,
            params: { id: goal.id,
                      goal: valid_attributes }
        goal.reload
        expect(goal.name).to eq('New name')
      end

      it 'redirects to the goal' do
        put :update,
            params: { id: goal.id,
                      goal: valid_attributes }
        expect(response).to redirect_to(manager_goal_path(goal))
      end
    end

    context 'with invalid params' do
      it 're-renders the "edit" template' do
        put :update,
            params: { id: goal.id,
                      goal: invalid_attributes }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested goal' do
      goal = create(:goal)
      expect do
        delete :destroy, params: { id: goal.id }
      end.to change(Goal, :count).by(-1)
    end

    it 'redirects to the goals list' do
      delete :destroy, params: { id: goal.id }
      expect(response).to redirect_to(manager_goals_path)
    end
  end
end
