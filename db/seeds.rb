# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if ENV['courier_rates']
  CourierRate.create([
                       { name: 'Lalamove',
                         within_metro_manila: 100,
                         outside_metro_manila: nil,
                         delivery_option: 'on-demand' },
                       { name: 'Grab',
                         within_metro_manila: 120,
                         outside_metro_manila: nil,
                         delivery_option: 'on-demand' },
                       { name: 'J&T Express',
                         within_metro_manila: 80,
                         outside_metro_manila: 100,
                         delivery_option: 'next-day' },
                       { name: 'LBC',
                         within_metro_manila: 100,
                         outside_metro_manila: 120,
                         delivery_option: 'next-day' }
                     ])
end

if ENV['countries']
  csv_dir = Rails.root.join('lib', 'seeds', 'countries.csv')
  sql = "COPY countries (id, name, iso3, iso2, phone_code, currency, currency_symbol) FROM '#{csv_dir}' HEADER CSV"
  ActiveRecord::Base.connection.execute(sql)
end

if ENV['provinces']
  csv_dir = Rails.root.join('lib', 'seeds', 'provinces.csv')
  sql = "COPY provinces (id, name, country_id) FROM '#{csv_dir}' HEADER CSV"
  ActiveRecord::Base.connection.execute(sql)
end

if ENV['cities']
  csv_dir = Rails.root.join('lib', 'seeds', 'cities.csv')
  sql = "COPY cities (id, name, province_id) FROM '#{csv_dir}' HEADER CSV"
  ActiveRecord::Base.connection.execute(sql)
end
