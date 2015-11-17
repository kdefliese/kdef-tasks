# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# try running again
def random_time
  Time.at(rand * Time.now.to_i)
end

seed_people = [
  {name: "Katherine"},
  {name: "Jared"},
  {name: "Maxwell"},
  {name: "Mom"}
]

seed_people.each do |seed|
  Person.create(seed)
end


tasks = [
  { name: "The First Task", description: "", completed: random_time, person_id: 1 },
  { name: "Go to Brunch", description: "", person_id: 1 },
  { name: "Go to Lunch", description: "", completed: random_time, person_id: 1 },
  { name: "Go to Second Lunch", description: "", person_id: 2 },
  { name: "Play Video Games", description: "", completed: random_time, person_id: 3 },
  { name: "High Five Somebody You Don't Know", description: "", completed: random_time, person_id: 1 },
  { name: "Plant Flowers", description: "", completed: random_time, person_id: 4 },
  { name: "Call Mom", description: "", person_id: 3 },
  { name: "She worries, you know.", description: "", person_id: 2 },
  { name: "Nap.", description: "", completed: random_time, person_id: 4 }
]

tasks.each do |task|
  Task.create task
end
