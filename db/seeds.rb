# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Label.create([
    { name: 'ゴン'},
    { name: 'キルア'},
    { name: 'クラピカ'},
    { name: 'レオリオ'},
    { name: 'カイト'},
    { name: 'ヒソカ'},
    { name: 'クロロ'},
    { name: 'マチ'},
    { name: 'パクノダ'},
    { name: 'ノブナガ'},
])



# User.create!(name: "管理者",
#              email: "admin1@seed.com",
#              password: "987654",
#              password_confirmation: "987654",
#              admin: true)

# User.create!(name: "管理者2",
#              email: "test2@seed.com",
#              password: "654321",
#              password_confirmation: "654321",
#              admin: true)

# User.create!(name: "管理者3",
#              email: "test33@seed.com",
#              password: "654323",
#              password_confirmation: "654323",
#              admin: true)

# User.create!(name: "管理者4",
#              email: "test4@seed.com",
#              password: "654324",
#              password_confirmation: "654324",
#              admin: true)

# User.create!(name: "管理者5",
#              email: "test5@seed.com",
#              password: "654325",
#              password_confirmation: "654325",
#              admin: true)

# User.create!(name: "管理者6",
#              email: "test6@seed.com",
#              password: "654326",
#              password_confirmation: "654326",
#              admin: true)

# User.create!(name: "管理者7",
#              email: "test7@seed.com",
#              password: "654327",
#              password_confirmation: "654327",
#              admin: true)

# User.create!(name: "管理者8",
#              email: "test8@seed.com",
#              password: "654328",
#              password_confirmation: "654328",
#              admin: true)

# User.create!(name: "管理者9",
#              email: "test9@seed.com",
#              password: "654329",
#              password_confirmation: "654329",
#              admin: true)

# User.create!(name: "管理者10",
#              email: "test10@seed.com",
#              password: "6543210",
#              password_confirmation: "6543210",
#              admin: true)


    # Task.create(
    #     name: "フリークス1",
    #     detail: "ネテロ会長1",
    #     termination_date: "2023=0201",
    #     user_id: 2)

  10.times do |i|
    Task.create!(
        name: "フリークス1",
        detail: "ネテロ会長1",
        termination_date: "2023-01-01",
        user: User.order("RANDOM()").first
    )
    end

    # Task.create!(
    #     name: "フリークス1",
    #     detail: "ネテロ会長1",
    #     termination_date: "2023-02-21",
    #     user_id: 4)

    # Task.create!(
    #     name: "フリークス1",
    #     detail: "ネテロ会長1",
    #     termination_date: "2023-01-01",
    #     user_id: 5)

    # Task.create!(
    #     name: "フリークス1",
    #     detail: "ネテロ会長1",
    #     termination_date: "2023-02-21",
    #     user_id: 6)

    # Task.create!(
    #     name: "フリークス1",
    #     detail: "ネテロ会長1",
    #     termination_date: "2023-02-11",
    #     user_id: 7)

    # Task.create!(
    #     name: "フリークス1",
    #     detail: "ネテロ会長1",
    #     termination_date: "2023-02-04",
    #     user_id: 8)

    # Task.create!(
    #     name: "フリークス1",
    #     detail: "ネテロ会長1",
    #     termination_date: "002023-0205",
    #     user_id: 9)

    # Task.create!(
    #     name: "フリークス1",
    #     detail: "ネテロ会長1",
    #     termination_date: "2023=02=06",
    #     user_id: 10)

    # Task.create!(
    #     name: "フリークス1",
    #     detail: "ネテロ会長1",
    #     termination_date: "2023=02-07",
    #     user_id: 11)
    