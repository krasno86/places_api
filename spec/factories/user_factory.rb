# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'User' do
    email { 'bla1@gmail.com' }
    password { 'aa123456' }
    password_confirmation { 'aa123456' }
    username { Faker::Movies::StarWars.character }

    factory :authorized_user do
      confirmed_at { 1.day.ago }
    end

    factory :unauthorized_user do
      confirmed_at { nil }
      email { Faker::Internet.email }
    end
  end
end
