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
  end
end
