moochub
================
[![Build Status](https://travis-ci.org/kriskanya/capstone.svg?branch=master)](https://travis-ci.org/kriskanya/capstone)
[![Code Climate](https://codeclimate.com/github/kriskanya/capstone/badges/gpa.svg)](https://codeclimate.com/github/kriskanya/capstone)
[![Test Coverage](https://codeclimate.com/github/kriskanya/capstone/badges/coverage.svg)](https://codeclimate.com/github/kriskanya/capstone)

moochub is a web application I built using Ruby on Rails in order for users to be able to share their favorite massively open online courses (MOOCs) with others.  
In addition to sharing links to courses they like, they are able to upvote/downvote courses reddit-style as well as comment on them.

This is my final project for a 6-month long course on web application development at Nashville Software School.  Please don't hesitate to contact
me with any questions.

Getting Started
---------------

The live app can be found at: http://moochub.herokuapp.com/

1. Clone this repo.
2. Run bundle.
3. Copy database.yml.example into database.yml
4. 'rake db:create:all'
5. 'rake db:migrate'

Technologies Used:
-----------

- HTML, CSS, & SASS
- Ruby on Rails
- ERB
- jQuery
- RSpec with Capybara Test Suite
- Poltergeist JS Driver
- Twitter Bootstrap
- PostgreSQL Database
- Rails Composer
- acts_as_votable
- will_paginate

Ruby on Rails
-------------

This application requires:

- Ruby 2.1.2
- Rails 4.1.5

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

License
---------------
The MIT License (MIT)

Copyright (c) 2014 Kristian Kanya

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
