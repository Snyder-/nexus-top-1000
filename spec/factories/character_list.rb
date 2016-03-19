FactoryGirl.define do
  factory :character_list do
    skip_create

    path :ALL

    initialize_with { new(attributes) }
  end
end
