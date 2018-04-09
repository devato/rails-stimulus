FactoryBot.define do
  factory :project do
    name          { FFaker::Company.name  }
    organization  { create(:organization) }
    supported_language { create(:supported_language) }
  end

end
