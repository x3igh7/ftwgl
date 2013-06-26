require 'spec_helper'

describe Team do  
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:tag) }
  it { should have_many(:memberships) }
  it { should have_many(:users) }

  it "shows the team owners" do
    team = FactoryGirl.create(:team)
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:membership, team: team, role: 'member')
    FactoryGirl.create(:membership, team: team, user: user, role: 'owner', active: true)

    team.owners.should include(user)
  end

  it "creates a new team from an owner and owner is active" do
    user = FactoryGirl.create(:user)

    team = Team.new(name: 'foo', tag: '[bar]')
    team.save_with_owner(user).should be_true
    team.owners.should include(user)
    team.actives.should include(user)
  end

  describe "Name length is 50" do
    it {should have_valid(:name).when('Name')}
    it {should_not have_valid(:name).when('holy crap this is a super long team name that is not valid')}
  end

  describe "Tag length is 8" do
    it {should have_valid(:tag).when('[TAG]')}
    it {should_not have_valid(:tag).when('[THISISALONGTAG]')}
  end

  # it "active? returns true if player is active" do
  #   team = FactoryGirl.create(:team)
  #   user = FactoryGirl.create(:user)
  #   FactoryGirl.create(:membership, team: team, role: 'member', active: true)

  #   is_active?(user,team).should be_true
  # end

end


