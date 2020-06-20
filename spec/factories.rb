FactoryBot.define do
  factory :tutor do
    name { "leticia" }
    identification { "00000000000" }
    email { "leticia@email.com" }
    phone { "00000000000" }
  end

  factory :animal do
      name { "luna" }
      birth { "2005-01-01" }
      species { "dog" }
      breed { "cocker" }
  end
end
  