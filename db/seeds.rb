
require 'faker'

User.delete_all
Proposal.delete_all
Experiment.delete_all
Observation.delete_all
Procedure.delete_all
Comment.delete_all


10.times do
  user = {
    first_name:     Faker::Name.first_name,
    last_name:      Faker::Name.last_name,
    email:          Faker::Internet.safe_email(:first_name),
    credentials:    Faker::Educator.course,
    password:       "password"
  }
  User.create(user)
end

20.times do
  proposal = {
    title: Faker::Hacker.adjective + " " + Faker::Hacker.noun + " " + Faker::Hacker.ingverb,
    hypothesis: Faker::Hacker.say_something_smart + " " + Faker::Hacker.say_something_smart,
    summary: Faker::Hipster.paragraph,
    status: ["open","in progess", "closed", "archived"].sample,
    pi_id: User.all.sample.id
  }
  newProp = Proposal.create(proposal)
  newProp.comments.create(body: Faker::Hipster.paragraph, commenter_id: User.all.sample.id)
end

40.times do
  experiment = {
    title: Faker::HowIMetYourMother.catch_phrase + " " + Faker::RickAndMorty.location,
    conclusion: Faker::Hipster.sentence(2),
    results: Faker::Measurement.volume + " " + Faker::Food.ingredient + " " + Faker::Hipster.paragraph(2),
    proposal_id: Proposal.all.sample.id,
    lab_staff_id: User.all.sample.id
  }

  experiment = Experiment.create(experiment)
  experiment.comments.create(body: Faker::Hipster.paragraph, commenter_id: User.all.sample.id)

end


60.times do
  observation = {
    notes: Faker::Hacker.say_something_smart + " " + Faker::Hacker.say_something_smart,
    experiment_id: Experiment.all.sample.id,
    observer_id: User.all.sample.id
  }

  Observation.create(observation)
end

80.times do
  procedure = {
    steps: Faker::Hipster.sentence,
    is_completed: [true,false].sample,
    experiment_id: Experiment.all.sample.id
  }
  Procedure.create(procedure)
end
