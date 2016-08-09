FactoryGirl.define do
  factory :task do
    title "MyString"
    body "MyText"
    is_done false
    user nil
  end
end
