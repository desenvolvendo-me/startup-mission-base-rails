require "rails_helper"

RSpec.describe RailsuiMailer, type: :mailer do
  describe "minimal" do
    let(:mail) { RailsuiMailer.minimal }

    it "renders the headers" do
      expect(mail.subject).to eq("Minimal")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "promotion" do
    let(:mail) { RailsuiMailer.promotion }

    it "renders the headers" do
      expect(mail.subject).to eq("Promotion")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "transactional" do
    let(:mail) { RailsuiMailer.transactional }

    it "renders the headers" do
      expect(mail.subject).to eq("Transactional")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
