# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { 'MyTitle' }
    content { 'MyText' }
    swap_limit { 2 }
    swap_limit_counter { 0 }
  end

  factory :invalid_post, class: 'Post' do
    title { nil }
    content { nil }
    swap_limit { 2 }
    swap_limit_counter { 0 }
  end
end
