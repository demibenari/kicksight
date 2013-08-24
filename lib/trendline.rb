class Trendline
  attr_accessor :y_intercept, :slope


  def initialize(coordinates)
    @coordinates = coordinates
  end

  def calc_trenline

    sum_mul_x_and_y = 0
    sum_of_x = 0
    sum_of_sqr_x = 0
    sum_of_y = 0

    # Calculating the Slope (m) of the Trendline

    @coordinates.each do |(x, y)|
      sum_mul_x_and_y += (x * y)

      sum_of_x += x
      sum_of_y += y

      sum_of_sqr_x += (x*x)
    end

    n = @coordinates.length
    puts 'n = ' + n.to_s

    sum_mul_x_and_y *= n

    a =  sum_mul_x_and_y
    puts 'a = ' + a.to_s

    b = (sum_of_x * sum_of_y)
    puts 'b = ' + b.to_s

    c = sum_of_sqr_x * n
    puts 'c = ' + c.to_s

    d = (sum_of_x * sum_of_x)
    puts 'd = ' + d.to_s

    slope =  (a - b) / (c - d)
    puts 'slope = ' +  slope.to_s

    # Calculating the y-intercept (b) of the Trendline
    e = sum_of_y
    puts 'e = ' + e.to_s

    f = slope * sum_of_x
    puts 'f = ' + f.to_s

    y_intercept = (e - f) / n

    puts y_intercept.to_s

    puts 'Equasion is: y=' + slope.to_s + 'x + ' + y_intercept.to_s

    self.slope = slope
    self.y_intercept = y_intercept
  end
end