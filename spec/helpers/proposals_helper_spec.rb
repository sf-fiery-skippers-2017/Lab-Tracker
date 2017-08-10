require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ProposalsHelper. For example:
#
# describe ProposalsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe ProposalsHelper do
  let!(:the_pi) { User.create!(first_name: "Alonzo", last_name: "Palonzo", credentials: "MD", email: "thepalonzo@gmail.com", password_digest: "password")}
  let!(:proposal1) { Proposal.create!(title: "Remember the Time", summary: "When we fell in love, do you remember the time", hypothesis: "If one remembers the time, then the time is remembered", status: "archived", pi_id: the_pi.id) }
  let!(:proposal2) { Proposal.create!(title: "Remember the Time2", summary: "When we fell in love, do you remember the time2", hypothesis: "If one remembers the time, then the time is remembered2", status: "archived", pi_id: the_pi.id) }

  describe '#archived_proposals' do
    it 'returns the proposals with archived status' do
      the_pi_proposals = the_pi.proposals
      expect(archived_proposals(the_pi_proposals).length). to eq(2)
    end
  end
end
