FactoryBot.define do
  factory :user do
    email {'user@mail.com' }
    password { 'password' }
    name { 'Name' }
  end
end