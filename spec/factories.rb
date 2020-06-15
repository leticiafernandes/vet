FactoryBot.define do
    factory :animal do
        name { "luna" }
        birth { Date.new }
        species { "dog" }
        breed { "cocker" }
    end
end
  