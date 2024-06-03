FactoryBot.define do
    factory :user do
      name { Gimei.new.kanji }
      email { "aaa@mail.com" }
    end
end