# frozen_string_literal: true

FactoryBot.define do
  factory :keyword do
    key { 'MyText' }
    link { 'https://www.google.com' }
  end

  factory :invalid_keyword, class: 'Keyword' do
    key { nil }
    link { nil }
  end
end
