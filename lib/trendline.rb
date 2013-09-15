class Trendline
  attr_accessor :y_intercept, :slope, :max_x, :max_y

  def initialize(coordinates)
    @coordinates = coordinates
  end

  def calc_trenline
    sum_mul_x_and_y = 0.0
    sum_of_x = 0.0
    sum_of_sqr_x = 0.0
    sum_of_y = 0.0
    a =0.0, b= 0.0, c = 0.0, d = 0.0, e = 0.0, f = 0.0
    calc_slope = 0.0
    calc_y_intercept = 0.0

    # Calculating the Slope (m) of the Trendline
    @coordinates.each do |(x, y)|
      sum_mul_x_and_y += (x * y)

      sum_of_x += x
      sum_of_y += y

      sum_of_sqr_x += (x*x)
    end

    n = @coordinates.length

    sum_mul_x_and_y *= n

    a =  sum_mul_x_and_y
    b = sum_of_x * sum_of_y
    c = sum_of_sqr_x * n
    d = sum_of_x * sum_of_x
    calc_slope +=  ((a-b).to_f/(c-d).to_f)

    #puts 'n = ' + n.to_s
    #puts 'a = ' + a.to_s
    #puts 'b = ' + b.to_s
    #puts 'c = ' + c.to_s
    #puts 'd = ' + d.to_s
    #puts 'slope = ' +  calc_slope.to_s

    # Calculating the y-intercept (b) of the Trendline
    e = sum_of_y
    f = calc_slope * sum_of_x

    calc_y_intercept += ((e-f).to_f/n)

    #puts 'e = ' + e.to_s
    #puts 'f = ' + to_s
    #puts calc_y_intercept.to_s

    puts 'Equasion is: y=' + calc_slope.to_s + 'x + ' + calc_y_intercept.to_s

    self.slope = calc_slope
    self.y_intercept = calc_y_intercept
    self.max_x = @coordinates[n -1][0]
    self.max_y = (self.max_x * self.slope) + self.y_intercept
  end
end