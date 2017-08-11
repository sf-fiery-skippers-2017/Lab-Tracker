require 'rails_helper'

describe ExperimentsController do
  let!(:lab_staff) { User.create!(first_name: “Alonzo”, last_name: “Palonzo”, credentials: “MD”, email: “thepalonzo@gmail.com”, password_digest: ‘password’)}
  let!(:proposal) { Proposal.create!(title: “Remember the Time”, summary: “When we fell in love, do you remember the time”, hypothesis: “If one remembers the time, then the time is remembered.“, status: “open”, pi_id: the_pi.id) }
  let!(:experiment) { Experiment.create!(title: "Do you remember", proposal: proposal, lab_staff: lab_staff) }

  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to have_http_status 200
    end

    # it "assigns the recent games as @games" do
    #   get :index
    #   expect(assigns(:games)).to eq(Game.recent)
    # end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, { id: experiment.id }
      expect(response).to have_http_status 200
    end

    it "assigns the correct experiment as @experiment" do
      get :show, { id: experiment.id }
      expect(assigns(:experiment)).to eq(experiment)
    end

    it "renders the :show template" do
      get :show, { id: experiment.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "responds with status code 200" do
      expect(response).to have_http_status 200
    end

    it "assigns a new experiment to @experiment" do
      get :new
      expect(assigns(:experiment)).to be_a_new Experiment
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "responds with status code 302" do
        post :create, { experiment: { user_throw: "rock", computer_throw: "scissors" } }
        expect(response).to have_http_status 302
      end

      it "creates a new experiment in the database" do
        expect { post :create,  { experiment: { user_throw: 'scissors', computer_throw: 'paper' } } }.to change(experiment, :count).by(1)
      end

      it "assigns the newly created experiment as @experiment" do
        post :create, { experiment: { user_throw: "rock", computer_throw: "scissors" } }
        expect(assigns(:experiment)).to eq Experiment.last
      end

      # it "sets a notice that the experiment was successfully created" do
      #   post :create, { experiment: { user_throw: "rock", computer_throw: "scissors" } }
      #   expect(flash[:notice]).to match /Game was successfully created./
      # end

      # it "redirects to the created experiment" do
      #   post :create, { experiment: {user_throw: 'paper', computer_throw: 'rock'}}
      #   expect(response).to redirect_to Experiment.last
      # end
    end

    context "when invalid params are passed" do
      it "responds with status code 422: Unprocessable Entity" do
        post :create, { experiment: { user_throw: "pineapple" } }
        expect(response).to have_http_status 422
      end

      it "does not create a new experiment in the database" do
        expect{ post :create, { experiment: { user_throw: "pineapple" } } }.to change(Experiment, :count).by 0
      end

      it "assigns the unsaved experiment as @experiment" do
        post :create, {experiment: {user_throw: 'apple'}}
        expect(assigns(:experiment)).to be_a_new Experiment
      end

      it "renders the :new template" do
        post :create, {experiment: {user_throw: 'apple'}}
        expect(response).to render_template(:new)
      end
    end
  end

  describe "DELETE #destroy" do
    it "responds with status code 302" do
      delete :destroy, { id: experiment.id }
      expect(response).to have_http_status 302
    end

    it "destroys the requested experiment" do
      expect { delete(:destroy, { id: experiment.id }) }.to change(Experiment, :count).by(-1)
    end

    # it "sets a notice that the experiment was destroyed" do
    #   delete :destroy, { id: experiment.id }
    #   expect(flash[:notice]).to match /Game was successfully destroyed/
    # end

    it "redirects to the experiments list" do
      delete :destroy, { id: experiment.id }
      expect(response).to redirect_to experiments_url
    end
  end

  # let!(:proposal)   { Proposal.first }
  # let!(:experiment) { proposal.experiments }
  # let!(:comments)   { proposal.comments }
  #
  # describe "GET # INDEX" do
  #   it "responds with status code 200" do
  #     expect(response)to have_http_status 200bu
  #   end
  # end
end


