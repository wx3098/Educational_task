FactoryBot.define do
  factory :task do
    name{ 'test' }
    detail{ 'test' }
  end

  factory :second_task, class:Task do
    name{ 'sample' }
    detail{ 'sample' }
  end
end
