# frozen_string_literal: true

class Company < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :city
  has_one :company_info, dependent: :destroy
  has_many :company_comments, dependent: :destroy
  has_many :company_images, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_many :company_tables, dependent: :destroy
end
