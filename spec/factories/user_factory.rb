# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'User' do
    email { 'bla1@gmail.com' }
    password { 'aa123456' }
    username { 'FIO' }
  end
end
