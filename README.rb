#!/usr/bin/env ruby

# run this file on the command line to generate a csv like this:
# $ ./README.rb

require './plans'

File.write("plans.csv", Plans.to_csv)
