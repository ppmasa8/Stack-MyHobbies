FactoryBot.define do
  factory :game do
    title { "hoge" }
    platform { "ps4" }
    status  { "todo" }

    trait :invalid do
      title nil
      platform nil
      status nil
    end
  end

  factory :ff14, class: Game do
    title { "ff14" }
    platform { "ps4" }
    status  { "todo" }
  end

  factory :ff13, class: Game do
    title { "ff13" }
    platform { "ps3" }
    status  { "todo" }
  end
end