require 'rails_helper'

RSpec.describe "Invoices", type: :request do

  let(:current_user) { create(:user) }

  let!(:user) { current_user }
  let(:referer) { 'http://example.com/test' }

  before { sign_in current_user }

  shared_examples "a redirect response" do
    it { expect(response.status).to eq(302) }
  end

  shared_examples "a success response" do
    it { expect(response.status).to eq(200) }
  end

  shared_examples "not authorized error" do
    before(:each) do
      request.headers["HTTP_REFERER"] = "http://exapmpe.com/test"
      subject
    end
    it "shows not authorized flashes" do
      expect(flash[:error]).to include("You are not authorized")
    end

    it { expect(response.location).to eq("http://exapmpe.com/test") }
    it { expect(response.status).to eq(302) }
  end

# Index

  describe "GET #index" do
    subject { get root_path }

    context "user doesn't exist" do
      before(:each) do
        sign_out user
        subject
      end
      it "redirects to login page" do
        expect(response.status).to redirect_to new_user_session_path
      end
      it_behaves_like "a redirect response"
    end

    context "user exists" do
      before(:each) { subject }
      it "returns successful response and renders index page" do
        expect(response.status).to render_template(:index)
      end
    end
  end

# Pagination Index

  describe "GET #index pagination test" do
    let!(:invoices) { create_list(:invoice, 15, user: current_user) }

    context "first page with 10 invoices" do
      subject { get root_path, params: { page: 1 } }
      it "returns only 10 invoices" do
        subject
        expect(assigns(:invoices).length).to eq(10)
      end
    end

    context "second page with 5 invoices" do
      subject { get root_path params: { page: 2 } }
      it "returns only 5 invoices" do
        subject
        expect(assigns(:invoices).length).to eq(5)
      end
    end
  end

# New

  describe "GET #new" do
    subject { get new_invoice_path }
    before(:each) { subject }

    context "successful request" do
      it "returns successful response and renders new form" do
        expect(response).to render_template(:new)
      end

      it_behaves_like "a success response"

      it "sends a new invoice" do
        expect(assigns(:invoice)).to be_a(Invoice)
        expect(assigns(:invoice)).to be_a_new(Invoice)
      end
    end
  end

# Create

  describe "POST #create" do
    let(:invoice_params) do
       { title: 'Saturday taxi',
         description: 'From friends to home',
         category: 'Other',
         amount: 100,
         user_id: current_user,
         created_at: Time.now }
    end

    subject { post invoices_path(invoice: invoice_params) }

    context "not authorized user" do
      before(:each) do
        sign_out current_user
        subject
      end

      it "has status unauthorized" do
        expect(response.status).to eq(302)
        expect(response.body).to redirect_to(new_user_session_path)
      end
    end

    context 'correct params are passed' do
      it 'has successful status' do
        subject
        expect(response.status).to eq(302)
      end

      it 'sets successful flash' do
        subject
        expect(flash[:success]).to include("Invoice was successfully created.")
      end

      it 'adds new object to db' do
        expect{subject}.to change(Invoice, :count).by(1)
      end
      it "renders new template" do
        subject
        expect(response.status).to redirect_to(invoice_path(Invoice.last))
      end
    end

    context 'incorrect params are passed' do
      let!(:invoice_params) do
        { title: 'there som items', description: 'Buy some apples', category: 'Other' }
      end

      # TODO fix tests with incorrect params
      #
      # it 'has unprocessable status' do
      #   subject
      #   expect(response.status).to eq(422)
      # end

      # it 'sets correct flash' do
      #   subject
      #   expect(flash[:error]).to include("Title can't be blank")
      # end

      # it 'not adds new object to db' do
      #   expect{subject}.to change(Invoice, :count).by(0)
      # end
    end
  end

# Show

  describe "GET #show" do
    subject { get invoice_path(invoice) }
    before(:each) { subject }

    context "successful request" do
      let(:invoice) { create(:invoice, user: current_user) }
      it "returns successful response  and renders show page" do
        expect(response.status).to render_template(:show)
      end

      it_behaves_like "a success response"
    end

    context "pass invoice" do
      let(:invoice) { create(:invoice, user: current_user) }
      it "returs valid invoice" do
        expect(assigns(:invoice)).to be_a(Invoice)
        expect(assigns(:invoice)).to eq(invoice)
      end
    end
  end

# Destroy

  describe "DELETE #destroy" do
    subject { delete invoice_path(invoice) }

    let!(:invoice) { create(:invoice, user: current_user) }

    context 'correct params are passed' do
      it 'has successful status' do
        subject
        expect(response.status).to eq(302)
      end

      it 'has successful redirect' do
        subject
        expect(response.body).to redirect_to(invoices_path)
      end

      it 'sets successful flash' do
        subject
        flash[:success].should =~ /Invoice was successfully destroyed./
      end

      it 'delete object from db' do
        expect{subject}.to change(Invoice, :count).by(-1)
      end
    end
  end

end
