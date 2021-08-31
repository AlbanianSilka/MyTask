# frozen_string_literal: true

FactoryBot.define do
  factory :keyword do
    key { 'MyText' }
    link { 'https://www.google.com' }
  end
end
