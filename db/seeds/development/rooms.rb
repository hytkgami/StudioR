# coding: utf-8

names = %w(スタジオ1 スタジオ2 スタジオ3 スタジオ4)
1.upto(4) do |n|
  room = Room.create(id: n)
end
