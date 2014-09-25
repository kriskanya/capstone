# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = Fabricate(:user, name: "Joe Smith")
user2 = Fabricate(:user, name: "John Adams")
user3 = Fabricate(:user, name: "Ben Franklin")
user4 = Fabricate(:user, name: "Gouvernor Morris")
user5 = Fabricate(:user, name: "Sam Adams")
user6 = Fabricate(:user, name: "John Hancock")
user7 = Fabricate(:user, name: "Patrick Henry")
user8 = Fabricate(:user, name: "Henry Clay")

course1 = Fabricate(:course, user_id: user1.id, name: "Designing Cities", url: "https://www.coursera.org/course/designingcities",
description: "Designing Cities is a ten-week course starting in September 2014.  Every week will focus on a different aspect of Designing Cities including: How Today’s City Evolved; The Ideas That Shape Cities; Tools for Designing Cities; Making Cities Sustainable; Cities in the Information Age; Preserving Older Cities; Designing New Cities, Districts and Neighborhoods; The Challenges of Informal Cities and Disadvantaged Neighborhoods; and Visionary Cities.  Materials will be presented by the instructors and guest faculty from PennDesign through a series of five or more modules per week, each typically 10-12 minutes long. The first module each week will be a roundtable discussion among professors Stefan Al, Jonathan Barnett, and Gary Hack introducing the big issues associated with the subject.  Each succeeding module will be a self-contained illustrated presentation of a set of ideas and images. There will be a list of suggested readings for those who wish to follow up on the ideas in each module.  Everyone enrolled in Designing Cities will be expected to complete 3 assignments.  These will be posted on the course site and they will be in the form of peer assessments. There will also be three sessions where we discuss a selection of the assignments that have been submitted. There will be a great deal to be learned from the ideas participants submit, reflecting cities of all sizes and circumstances across the globe.  The course concludes with a discussion by the faculty of the issues raised in the discussion groups and responses to the assignments. We are looking forward to connecting with you and seeing the issues at the forefront in designing your city.",
date: "2014-09-01", cost: 0, instructor: "Gary Hack", institution: "University of Pennsylvania", duration: "10 weeks", level: "Beginner")

comment1 = Fabricate(:comment, user_id: user1.id, course_id: course1.id, comment_text: "This course is awesome---the professor is excellent!")
