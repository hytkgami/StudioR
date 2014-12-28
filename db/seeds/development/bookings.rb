# coding: utf-8
0.upto(9) do |n|
  time = Time.now # 予約開始時間
  string = SecureRandom.hex(4)
  Booking.create(
                 member: Member.find(rand(10) + 1),
                 day: Date.today,
                 from: time.hour,
                 to: time.hour + rand(6) + 1,
                 room_id: rand(4) + 1,
                 book_id: string,
                 mflag: false
                )
end

