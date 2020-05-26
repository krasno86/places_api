# frozen_string_literal: true

require 'swagger_helper'

describe 'Places API', type: :request, swagger_doc: 'api/swagger_doc.json' do
  let(:city) { create(:city) }
  let(:category) { create(:category) }
  let(:company) { create(:company, city_id: city.id, category_id: category.id) }
  let(:company_info) { create(:company_info, company_id: company.id) }

  path 'v1/companies_by_city' do
    get 'Show companies by city' do
      tags 'Companies'
      parameter name: :city_id, in: :query, type: :integer, required: true
      produces 'application/json'

      response '200', 'companies found' do
        let(:city_id) { city.id }
        examples 'application/json' => {
          id: 1,
          type: 'company',
          attributes: {
            active: true
          },
          relationships: {
            companies: {
              data: [
                {
                  id: '1',
                  type: 'company'
                }
              ]
            }
          },
          included: [
            {
              id: 1,
              type: 'company_info',
              attributes: {
                name: 'Кафе 0',
                description: 'Хорошее Кафе',
                address: 'Адрес Кафе: Запорожье улица 0',
                latitude: nil,
                longitude: nil,
                work_time_description: '10.00 - 20.00'
              },
              relationships: {
                company: {
                  data: {
                    id: '1',
                    type: 'company'
                  }
                }
              }
            }
          ]
        }
        run_test!
      end
    end
  end

  path 'v1/companies_by_category' do
    get 'Show companies by category' do
      tags 'Companies'
      parameter name: :category_id, in: :query, type: :integer, required: true
      produces 'application/json'
      response '200', 'companies found' do
        let(:category_id) { category.id }
        examples 'application/json' => {
          id: 1,
          type: 'company',
          attributes: {
            active: true
          },
          relationships: {
            companies: {
              data: [
                {
                  id: '1',
                  type: 'company'
                }
              ]
            }
          },
          included: [
            {
              id: 1,
              type: 'company_info',
              attributes: {
                name: 'Кафе 0',
                description: 'Хорошее Кафе',
                address: 'Адрес Кафе: Запорожье улица 0',
                latitude: nil,
                longitude: nil,
                work_time_description: '10.00 - 20.00'
              },
              relationships: {
                category: {
                  data: {
                    id: '1',
                    type: 'category'
                  }
                }
              }
            }
          ]
        }
        run_test!
      end
    end
  end

  path 'v1/companies' do
    get 'Show all companies' do
      tags 'Companies'
      produces 'application/json'
      response '200', 'companies found' do
        examples 'application/json' => {
          id: 1,
          type: 'company',
          attributes: {
            active: true
          },
          relationships: {
            company_info: {
              data: [
                {
                  id: '1',
                  type: 'company'
                }
              ]
            }
          }
        }
        run_test!
      end
    end
  end
end
