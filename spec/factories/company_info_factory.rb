# frozen_string_literal: true

FactoryBot.define do
  factory :company_info, class: 'CompanyInfo' do
    name { Faker::Company.name }
    description { Faker::Lorem.sentence }
  end
end
