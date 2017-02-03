FactoryGirl.define do
  factory :post do
    date  Date.today
    rationale "Rationale"
    daily_hours 12.5
    user
  end

  factory :second_post, class: "Post" do
    date  Date.yesterday
    rationale "Some Content"
    daily_hours 8.0
    user
  end

  factory :post_from_other_user, class: "Post" do
    date  Date.yesterday
    rationale "Some Content"
    non_authorizes_user
  end
end