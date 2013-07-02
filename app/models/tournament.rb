class Tournament < ActiveRecord::Base
  attr_accessible :description, :name, :rules

  validates_presence_of :name

  has_many :tournament_teams
  has_many :teams, through: :tournament_teams
end

def current_tourny(tournament)
  self.where("tournament_id = '?'", tournament.id)
end

def ranking
  order("total_points DESC", "total_diff DESC")
end
# shevling this for later... might use it with scheduling
# def rank
#   prev_teams = []
#   teams = self.order("total_points DESC", "total_diff DESC")
#   teams.each_with_index do |team, x|
#     prev_teams << team
#     #checks to see if have the same points and diff
#     #if they do, they have the same rank
#     if prev_teams.last.total_points == team.total_points && prev_teams.last.total_diff == team.total_diff
#       team.rank = prev_teams.last.rank
#     else
#       team.rank = x + 1
#     end
#   end
#   teams
# end
