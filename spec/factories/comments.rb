# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    comment_text "MyString"
    user nil
    course nil
  end
end
