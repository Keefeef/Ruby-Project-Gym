require_relative( "../models/member.rb" )
require_relative( "../models/lesson.rb" )
require_relative( "../models/booking.rb" )
require("pry")

member1 = Member.new({
"first_name" => "Frank",
"second_name" => "Reynolds",
"age" => "63"
})

member1.save

member2 = Member.new({
"first_name" => "Charlie",
"second_name" => "Kelly",
"age" => "38"
})

member2.save



lesson1 = Lesson.new({
"title" => "Yoga",
"day_time" => "Thursday 16:00"
})

lesson1.save

lesson2 = Lesson.new({
"title" => "Pilates",
"day_time" => "Tuesday 20:00"
})

lesson2.save


booking1 = Booking.new({
"member_id" => member1.id,
"lesson_id" => lesson1.id
})

booking1.save

booking2 = Booking.new({
"member_id" => member2.id,
"lesson_id" => lesson2.id
})

booking2.save

binding.pry
nil
