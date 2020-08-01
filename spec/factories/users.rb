FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User#{n}" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test01.png')) }
    profile { "hello world" }
  end
end