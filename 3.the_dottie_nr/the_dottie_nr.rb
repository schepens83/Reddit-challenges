#!/usr/bin/env ruby

x = 345
100.times { x = Math.cos(x) }
puts x
#puts (1..100).inject { |sum, n| sum + Math.cosh(n) }  