# coding: utf-8

names = %w(スタジオ1 スタジオ2 スタジオ3 スタジオ4)
0.upto(3) do |n|
  Room.create(id: n+1,
             )
end
