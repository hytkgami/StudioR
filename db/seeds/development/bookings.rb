# coding: utf-8
0.upto(9) do |n|
  time = rand(11) + 1 # 予約開始時間
  string = SecureRandom.hex(4)
  Booking.create(
                 user_id: rand(10) + 1,
                 day: Date.today,
                 from: time,
                 to: time + rand(6) + 1,
                 room_id: rand(4) + 1,
                 book_id: string
                )
end

