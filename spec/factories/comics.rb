FactoryBot.define do
  factory :comic do
    year { "1999" }
    title { "NARUTO" }
    abstract {"少年漫画です"}
    status  { "todo" }

    trait :invalid do
      year nil
      title nil
      abstruct nil
      status nil
    end
  end

  factory :naruto, class: Comic do
    year { "1999" }
    title { "NARUTO" }
    abstract {"少年漫画です"}
    status  { "todo" }
  end

  factory :onepiece, class: Comic do
    year { "1997" }
    title { "ONEPIECE" }
    abstract {"海賊のあれです"}
    status  { "todo" }
  end
end