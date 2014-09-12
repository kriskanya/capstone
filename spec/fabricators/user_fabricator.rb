Fabricator(:user) do
  name { sequence(:name) { |i| "user#{i}" } }
  email { sequence(:email) { |i| "user#{i}@example.com" } }
  password { "password" }
end
