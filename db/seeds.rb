require_relative( "../models/member.rb" )
require_relative( "../models/lesson.rb" )
require_relative( "../models/booking.rb" )
require("pry")

Booking.delete_all
Lesson.delete_all
Member.delete_all

member1 = Member.new({
  "first_name" => "Frank",
  "second_name" => "Reynolds",
  "age" => "63",
  "status" => "Premium"
  })

  member1.save

  member2 = Member.new({
    "first_name" => "Charlie",
    "second_name" => "Kelly",
    "age" => "38",
    "status" => "Standard"
    })

    member2.save

    member3 = Member.new({
      "first_name" => "Dennis",
      "second_name" => "Reynolds",
      "age" => "42",
      "status" => "Premium"
      })

      member3.save

      member4 = Member.new({
        "first_name" => "Dee",
        "second_name" => "Reynolds",
        "age" => "42",
        "status" => "Premium"
        })

        member4.save

        member5 = Member.new({
          "first_name" => "Ronald",
          "second_name" => "Macdonald",
          "age" => "37",
          "status" => "Standard"
          })

          member5.save





          lesson1 = Lesson.new({
            "title" => "Yoga",
            "day_time" => "Thursday 16:00",
            "capacity" => "6"
            })

            lesson1.save

            lesson2 = Lesson.new({
              "title" => "Pilates",
              "day_time" => "Tuesday 20:00",
              "capacity" => "5"
              })

              lesson2.save

              lesson3 = Lesson.new({
                "title" => "Crossfit",
                "day_time" => "Monday 17:00",
                "capacity" => "7"
                })

                lesson3.save

                lesson4 = Lesson.new({
                  "title" => "Drinking",
                  "day_time" => "Monday 09:00",
                  "capacity" => "7"
                  })

                  lesson4.save

                  lesson5 = Lesson.new({
                    "title" => "Cycling",
                    "day_time" => "Monday 17:00",
                    "capacity" => "8"
                    })

                    lesson5.save

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

                        booking3 = Booking.new({
                          "member_id" => member3.id,
                          "lesson_id" => lesson3.id
                          })

                          booking3.save

                          binding.pry
                          nil
