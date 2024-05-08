require 'rails_helper'

RSpec.describe PageController, type: :controller do
  describe '#activity' do
    it 'renders the activity template with the admin layout' do
      get :activity
      expect(response).to render_template(:activity)
      expect(response).to render_template(layout: 'admin')
    end
  end

  describe '#profile' do
    it 'renders the profile template with the admin layout' do
      get :profile
      expect(response).to render_template(:profile)
      expect(response).to render_template(layout: 'admin')
    end
  end

  describe '#people' do
    it 'renders the people template with the admin layout' do
      get :people
      expect(response).to render_template(:people)
      expect(response).to render_template(layout: 'admin')
    end
  end

  describe '#calendar' do
    it 'renders the calendar template with the admin layout' do
      get :calendar
      expect(response).to render_template(:calendar)
      expect(response).to render_template(layout: 'admin')
    end
  end

  describe '#assignments' do
    it 'renders the assignments template with the admin layout' do
      get :assignments
      expect(response).to render_template(:assignments)
      expect(response).to render_template(layout: 'admin')
    end
  end

  describe '#message' do
    it 'renders the message template with the admin layout' do
      get :message
      expect(response).to render_template(:message)
      expect(response).to render_template(layout: 'admin')
    end
  end

  describe '#messages' do
    it 'renders the messages template with the admin layout' do
      get :messages
      expect(response).to render_template(:messages)
      expect(response).to render_template(layout: 'admin')
    end
  end

  describe '#project' do
    it 'renders the project template with the admin layout' do
      get :project
      expect(response).to render_template(:project)
      expect(response).to render_template(layout: 'admin')
    end
  end

  describe '#projects' do
    it 'renders the projects template with the admin layout' do
      get :projects
      expect(response).to render_template(:projects)
      expect(response).to render_template(layout: 'admin')
    end
  end

  describe '#dashboard' do
    it 'renders the dashboard template with the admin layout' do
      get :dashboard
      expect(response).to render_template(:dashboard)
      expect(response).to render_template(layout: 'admin')
    end
  end

  describe '#homepage' do
    it 'renders the homepage template' do
      get :homepage
      expect(response).to render_template(:homepage)
    end
  end

  describe '#about' do
    it 'renders the about template' do
      get :about
      expect(response).to render_template(:about)
    end
  end

  describe '#pricing' do
    it 'renders the pricing template' do
      get :pricing
      expect(response).to render_template(:pricing)
    end
  end

  describe '#faq' do
    it 'renders the faq template' do
      get :faq
      expect(response).to render_template(:faq)
    end
  end

  describe '#billing' do
    describe '#billing' do
      before do
        allow(Stripe).to receive(:api_key).and_return('test_api_key')
      end

      it 'renders the billing template' do
        get :billing
        expect(response).to render_template(:billing)
      end

      it 'assigns the recent invoices from Stripe' do
        invoices = double('invoices')
        allow(controller).to receive(:retrieve_recent_invoices_from_stripe).and_return(invoices)

        get :billing
        expect(assigns(:recent_invoices)).to eq(invoices)
      end
    end
  end

  describe '#integrations' do
    it 'renders the integrations template' do
      get :integrations
      expect(response).to render_template(:integrations)
    end
  end

  describe '#team' do
    it 'renders the team template' do
      get :team
      expect(response).to render_template(:team)
    end
  end

  describe '#notifications' do
    it 'renders the notifications template' do
      get :notifications
      expect(response).to render_template(:notifications)
    end
  end

  describe '#settings' do
    it 'renders the settings template' do
      get :settings
      expect(response).to render_template(:settings)
    end
  end
end
