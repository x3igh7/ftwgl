#admincp_spec.rb

describe "Admin CP" do
  let!(:tournament1) {FactoryGirl.create(:tournament)}
  let!(:tournament2) {FactoryGirl.create(:tournament)}

  context "Tournament Management" do


    it "lists all active tournaments" do
      visit admin_root_path
      expect(page).to have_content(tournament1)
      expect(page).to have_content(tournament2)
    end

    it "has an option for editting tournament info" do
    end

    it "has an option for editting tournament rules" do
    end

    it "has an option for managing participating tournament teams" do
    end

    it "has an option to view all tournament matches" do
    end

    it "has an option to set rankings" do
    end

    it "has an option to create schedule" do
    end

  end
end
