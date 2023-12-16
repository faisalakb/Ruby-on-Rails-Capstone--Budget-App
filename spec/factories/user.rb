FactoryBot.define do
  factory :user do
    email { 'user@example.com' }
    password { 'password' }
    name { 'Example User' }
  end
end
