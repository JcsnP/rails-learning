Task.destroy_all

pp "********** task seed **********"
5.times do |i|
  Task.create!(title: "Title #{i}", description: "This is description of task #{i}", completed: i % 2 == 0 ? true : false)
end
