# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :upload do
    path "MyString"
    name "MyString"
    size 1
    content_type "MyString"
    file "MyString"
    user_id 1
  end
end
