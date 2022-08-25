FactoryBot.define do
  factory :lecture do
    title { "Palestra Padrão" }
    duration { 60 }
    lecturer { "Palestrante Padrão" }
    start_at { "09:00".to_time }
  end
end
