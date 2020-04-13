# frozen_string_literal: true

CompanyComment.destroy_all
CompanyTable.destroy_all
CompanyInfo.destroy_all
Company.destroy_all
User.destroy_all
Category.destroy_all
City.destroy_all

city = City.create(name: 'Запорожье')
City.create(name: 'Днепр')
City.create(name: 'Харьков')

categories = ['Кафе', 'Кальян', 'Ресторан', 'Пиво на разлив']

categories.each do |category_name|
  category = Category.create(name: category_name)
  (0..4).each do |index|
    user = User.create(email: "#{category_name}#{index}@zzz.zzz", password: 123456, password_confirmation: 123456)

    next unless user.present?

    company = category.companies.create(city_id: city.id, user_id: user.id, active: 1)
    CompanyInfo.create(company_id: company.id,
                       name: "#{category_name} #{index}",
                       description: "Хорошее #{category_name}",
                       address: "Адрес #{category_name}: #{city.name} улица #{index}",
                       count_table: 4,
                       work_time_description: '10.00 - 20.00')

    (0..3).each do |j|
      CompanyTable.create(company_id: company.id,
                          name: "Стол #{company.id}#{j}",
                          reservation: [true, false][rand(2)])
    end

    (0..2).each do |j|
      CompanyComment.create(company_id: company.id,
                            username: "Юзер #{company.id}#{j}",
                            message: "message #{j}")
    end
  end
end
