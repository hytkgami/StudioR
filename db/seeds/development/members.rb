# coding: utf-8

names = %w(Taro Jiro Han John Mike Sophy Bill Alex Mary Tom)
0.upto(9) do |idx|
  Member.create(
                name: names[idx],
                tel: "09012345678",
                email: "#{names[idx]}@example.com",
                administrator: (idx == 0),
                password: "password",
                password_confirmation: "password"
               )
end
