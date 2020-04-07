# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'User' do
    email { 'bla1@gmail.com' }
    password { 'aa123456' }
    password_confirmation { 'aa123456' }
    full_name { 'FIO' }
  end
end
