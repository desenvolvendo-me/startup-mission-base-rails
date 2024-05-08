require 'rails_helper'

RSpec.describe CheckoutController, type: :controller do
  describe '#create' do
    let(:plan_id) { 'price_1P9dyVRpXIS2OKDB32fpKBJy' }
    let(:mode) { 'payment_type' }

    before do
      allow(Stripe::Checkout::Session).to receive(:create).and_return(session)
    end

    context 'when successful' do
      let(:session) { double('session', url: 'https://example.com') }

      it 'redirects to the session URL' do
        post :create, params: { plan: 'startup', payment_type: 'card' }
        expect(response).to redirect_to(session.url)
      end
    end

    context 'when an unknown plan type is provided' do
      it 'raises an exception' do
        expect {
          post :create, params: { plan: 'unknown', payment_type: 'card' }
        }.to raise_error(RuntimeError, 'Plano desconhecido: unknown')
      end
    end
  end

  describe '#success' do
    it 'sets a success flash message' do
      get :success
      expect(flash[:notice]).to eq('Pagamento concluído com sucesso!')
    end

    it 'renders the success template' do
      get :success
      expect(response).to render_template('checkout/success')
    end
  end

  describe '#cancel' do
    it 'sets an alert flash message' do
      get :cancel
      expect(flash[:alert]).to eq('O pagamento foi cancelado!')
    end

    it 'renders the cancel template' do
      get :cancel
      expect(response).to render_template('checkout/cancel')
    end
  end
end
