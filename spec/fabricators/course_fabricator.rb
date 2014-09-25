Fabricator(:course) do
  name { sequence(:name) { |i| "course#{i}" } }
  url { sequence(:url) { |i| "http://www.url#{i}.com" } }
  description { sequence(:description) { |i| "description#{i}" } }
  level { "beginner" }
  date { "2014-09-12" }
  cost { "0" }
  instructor { sequence(:instructor) { |i| "instructor#{i}" } }
  institution { sequence(:institution) { |i| "institution#{i}" } }
  duration { "10 weeks" }
end
