# {
#   "season 30": [
#     {
#       "name":      "Beth Smalls",
#       "age":       "26",
#       "hometown":  "Great Falls, Virginia",
#       "occupation": "Nanny/Freelance Journalist",
#       "status":    "Winner"
#     },
#     {
#       "name":       "Becca Tilley",
#       "age":        "27",
#       "hometown":   "Shreveport, Louisiana",
#       "occupation": "Chiropractic Assistant",
#       "status":     "Eliminated Week 8"
#     }
#   ],
#   "season 29": [
#     {
#       "name":      "Ashley Yeats",
#       "age":       "24",
#       "hometown":  "Denver, Colorado",
#       "occupation": "Dental Assitant",
#       "status":    "Winner"
#     },
#     {
#       "name":       "Sam Grover",
#       "age":        "29",
#       "hometown":   "New York, New York",
#       "occupation": "Entertainer",
#       "status":     "Eliminated Week 6"
#     }
#   ]
# }

require 'pry'


def get_first_name_of_season_winner(data, season)
full_name = ""
  data.each do |season_num, people_array|
    if season_num == season
    people_array.each do |contestant_hash|
        if contestant_hash["status"] == "Winner"
        full_name = contestant_hash["name"]
        end
      end
    end
  end
 full_name.split.first
end


def get_contestant_name(data, occupation)
  name = ""
  data.each do |season_num, people_array|
    people_array.each do |contestant_hash|
      if contestant_hash["occupation"] == occupation
        name = contestant_hash["name"]
      end
    end
  end
  name
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |season_num, people_array|
    people_array.each do |contestant_hash|
      if contestant_hash["hometown"] == hometown
        counter += 1
      end
    end
  end
  counter
end


def get_occupation(data, hometown)
  job = []
  data.each do |season_num, people_array|
    people_array.each do |contestant_hash|
      if contestant_hash["hometown"] == hometown
        job << contestant_hash["occupation"]
      end
    end
  end
  job.first
end

def get_average_age_for_season(data, season)
ages = []
  data.each do |season_num, people_array|
    if season_num == season
      people_array.each do |contestant_hash|
        if contestant_hash["age"]
          ages << contestant_hash["age"].to_i
        end
      end
    end
  end
  total = ages.inject(0) do |result, element|
    result + element
  end
    (total / ages.size.to_f).round
end


# age.inject(0) do |result, element|
#   result + element / age.length

# [1, 2, 3, 4].inject(0) { |result, element| result + element } # => 10
