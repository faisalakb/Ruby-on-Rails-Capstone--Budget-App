FactoryBot.define do
  factory :category do
    name { 'Example Category' }
    icon { 'example_icon.png' }
    association :user, factory: :user
  end
end
