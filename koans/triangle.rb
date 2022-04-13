# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  raise TriangleError, 'A triangle cannot have zero length sides.' if a.zero? || b.zero? || c.zero?
  raise TriangleError, 'A triangle cannot have negative length sides.' if a.negative? || b.negative? || c.negative?

  check_first_inequality_theorem(a, b, c)

  matches = 0
  matches += 1 if a == b
  matches += 1 if b == c
  matches += 1 if a == c

  case matches
  when 3
    :equilateral
  when 1
    :isosceles
  else
    :scalene
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end

private

def check_first_inequality_theorem(a, b, c)
  raise TriangleError, 'Failed first inequality theorem.' if a >= b + c
  raise TriangleError, 'Failed first inequality theorem.' if b >= a + c
  raise TriangleError, 'Failed first inequality theorem.' if c >= a + b
end
