require 'rails_helper'

describe ProposalsController do
  let!(:the_pi) { User.create!(first_name: "Alonzo", last_name: "Palonzo", credentials: "MD", email: "thepalonzo@gmail.com", password_digest: 'password')}
  let!(:proposal) { Proposal.create!(title: "Remember the Time", summary: "When we fell in love, do you remember the time", hypothesis: "If one remembers the time, then the time is remembered.", status: "open", pi_id: the_pi.id) }

  describe 'Get #index' do
    it 'responds with status code 200' do
      get :index
      expect(response.status).to eq(200)
    end

    it 'assigns all the @proposals' do
      get :index
      expect(assigns(:proposals)).to eq(Proposal.all)
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
