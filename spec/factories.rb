FactoryGirl.define do
  
  factory :team do
    sequence(:name) {|n| "foo#{n}"}
    tag '[bar]'
  end

  factory :membership do
    team
    user
    role 'member'
    active false
  end

  factory :tournament do
    name "FTW Team Survivor"
    description "Season 1"
    rules "Don't cheat"
  end

  factory :tournament_team do
    team
    tournament
  end

  factory :match do
    home_team_id 1
    away_team_id 2
    tournament_id 1
    week_num 1
    match_date Time.now
  end
end
