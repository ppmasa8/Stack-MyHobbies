FactoryBot.define do
  factory :movie do
    year { "1995" }
    title { "耳をすませば" }
    abstract {"ジブリの映画です"}
    status  { "todo" }

    trait :invalid do
      year nil
      title nil
      abstruct nil
      status nil
    end
  end

  factory :ghibli, class: Movie do
    year { "1995" }
    title { "耳をすませば" }
    abstract {"ジブリの映画です"}
    status  { "todo" }
  end

  factory :bttf, class: Movie do
    year { "1985" }
    title { "back to the future" }
    abstract {"例のあれです"}
    status  { "todo" }
  end
end