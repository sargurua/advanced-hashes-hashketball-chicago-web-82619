require "pry"
# Write your code here!
def game_hash
 hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Kemba Walker" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(name)
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player_name, player_keys|
      if player_name == name
        return player_keys[:points]
      end
    end
  end
  return nil
end

def shoe_size(name)
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player_name, player_keys|
      if player_name == name
        return player_keys[:shoe]
      end
    end
  end
  return nil
end

def team_colors(name)
  game_hash.each do |team, team_hash|
    if team_hash[:team_name] == name
      return team_hash[:colors]
    end
  end
end

def team_names
  arr = []
  game_hash.each do |team, team_hash|
    arr.push(team_hash[:team_name])
  end
  return arr
end

def player_numbers(name)
  arr =[]
  game_hash.each do |team, team_hash|
    if team_hash[:team_name] == name
      team_hash[:players].each do |player_name, player_attributes|
        arr.push(player_attributes[:number])
      end
    end
  end
  return arr
end

def player_stats(name)
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player_name, player_attributes|
      if player_name == name
        return player_attributes
      end
    end
  end
end

def big_shoe_rebounds
  temp = {:shoe => 0}
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player_name, player_attributes|
      if player_attributes[:shoe] > temp[:shoe]
        temp = player_attributes
      end
    end
  end
  return temp[:rebounds]
end

def most_points_scored
  temp = {:points => 0, :name => ""}
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player_name, player_attributes|
      if player_attributes[:points] > temp[:points]
        temp = player_attributes
        temp[:name] = player_name
      end
    end
  end
  return temp[:name]
end

def winning_team
  temp = {:h_points => 0, :a_points => 0, :h_name => "", :a_name => ""}
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player_name, player_attributes|
      if team.to_s == "home"
        temp[:h_points] += player_attributes[:points]
        temp[:h_name] = team_hash[:team_name]
      else
        temp[:a_points] += player_attributes[:points]
        temp[:a_name] = team_hash[:team_name]
      end
    end
  end
  return (temp[:h_points] > temp[:a_points] ? temp[:h_name] : temp[:a_name])
end

def player_with_longest_name
  temp = {:name => ""}
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player_name, player_attributes|
      if player_name.length > temp[:name].length
        temp[:name] = player_name
      end
    end
  end
  return temp[:name]
end

def long_name_steals_a_ton?
  temp = {:steals => 0, :name => ""}
  game_hash.each do |team, team_hash|
    team_hash[:players].each do |player_name, player_attributes|
      if player_attributes[:steals] > temp[:steals]
        temp[:name] = player_name
        temp[:steals] = player_attributes[:steals]
      end
    end
  end
  return (temp[:name] == player_with_longest_name ? true : false)
end
