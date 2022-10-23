FactoryBot.define do
  factory :project do
    name { "MyString" }
    owner_id { "MyString" }
    state { 1 }
    progress { 1.5 }
  end
end
