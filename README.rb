#!/usr/bin/env ruby

# run this file on the command line to generate a csv like this:
# $ ./README.rb
#
# You can find the data in spreadsheet form at:
# https://docs.google.com/spreadsheets/d/1r9aB9lklK7FgjMkHknpUJs2BUL8T6OLdDKNQvg8vyWQ/edit?usp=sharing
#
# Some info for you:
# You need access to the Choice Plus network to use insurance outside of tri-state area. I think only Freedom and
# Liberty have Choice Plus access. This page has more info (click on "Medical - Oxford"):
# https://www.uhc.com/employer/health-plans/new-york
#
# There is also a lot of helpful info here:
# https://www.healthcare.gov/choose-a-plan/your-total-costs/

require './plans'

File.write("plans.csv", Plans.to_csv)
