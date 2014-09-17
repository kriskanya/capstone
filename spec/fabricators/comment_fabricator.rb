Fabricator(:comment) do
  comment_text { sequence(:comment_text) { |i| "commenttext#{i}" } }
end
