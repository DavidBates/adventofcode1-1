def turn_left cur_direction
  case cur_direction
    when 0
      return 270
    when 90
      return 0
    when 180
      return 90
    when 270
      return 180
  end
end
def turn_right cur_direction
  case cur_direction
    when 0
      return 90
    when 90
      return 180
    when 180
      return 270
    when 270
      return 0
  end
end
def print_city(ary=[])
  prev_point = [0,0,0]
  direction = 0
  z_index = 0
  ary.each do |step|
    dir_parts = step[0], step[1..1000]
    if dir_parts[0] == "R"
      direction = turn_right(direction)
    else
      direction = turn_left(direction)
    end
    y = dir_parts[1].to_i * (Math.cos(direction * (Math::PI / 180))).round(0)
    x = dir_parts[1].to_i * (Math.sin(direction * (Math::PI / 180))).round(0)
    if x == 0
      x = prev_point[0]
      y = prev_point[1] + y
    else
      x = prev_point[0] + x
      y = prev_point[1]
    end
    Sketchup.active_model.entities.add_line(prev_point, [x,y,z_index])
    prev_point = [x,y,z_index]
    # Take out this next line to be able to finish challenge 2 for today visually!
    z_index += 1

  end
  # This next line will draw a line to the last point from the start point in 3D
  Sketchup.active_model.entities.add_line(prev_point, [0,0,100])
  puts prev_point[0].to_s + ": " + prev_point[1].to_s
end