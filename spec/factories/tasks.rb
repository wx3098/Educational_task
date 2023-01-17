FactoryBot.define do
  factory :task do
    name{ '菅良' }
    detail{ 'test' }
    termination_date{ '2023-01-12' }
  end

  factory :second_task, class:Task do
    name{ '向井' }
    detail{ 'sample' }
    termination_date{ '2022-02-22' }
  end
  
  factory :three_task, class:Task do
    name{ '尾形' }
    detail{ 'sample' }
    termination_date{ '2022-02-22' }
  end
end
