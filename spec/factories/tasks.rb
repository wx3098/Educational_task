FactoryBot.define do
  factory :task do
    name{ 'test' }
    detail{ 'test' }
    termination_date{ '2023-01-12' }
  end

  factory :second_task, class:Task do
    name{ 'sample' }
    detail{ 'sample' }
    termination_date{ '2022-02-22' }
  end
end
