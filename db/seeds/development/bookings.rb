# coding: utf-8

arr = (6..23).to_a # 予約開始時間
0.upto(9) do |n|
  time = arr.sample
  string = SecureRandom.hex(4)
  Booking.create(
                 member: Member.find(rand(10) + 1),
                 day: Date.today,
                 from: time,
                 to: time + 1,
                 room_id: rand(4) + 1,
                 book_id: string,
                 mflag: false
                )
end

