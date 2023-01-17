require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  # describe '新規作成機能' do
  #   context 'タスクを新規作成した場合' do
  #     it '作成したタスクが表示される' do
  #       visit new_task_path
  #       fill_in "task[name]",	with: "桜木"
  #       fill_in "task[detail]", with: "テストです！"
  #       click_on "commit"
  #       expect(page).to have_content '桜木' 
  #   end
  # end
  describe '新規作成機能' do
        before do
        FactoryBot.create(:task, name: '菅良', termination_date: "2022-11-18")
        FactoryBot.create(:second_task, name: '向井', termination_date: "2022-11-17")
        FactoryBot.create(:three_task, name: '尾形', termination_date: "2022-11-16")
        end
    context 'タスクを新規作成した場合' do
      it '終了期限が近いタスクが上に表示される' do
        visit tasks_path
        click_on '検索'
        task_list = all('.task_list')
        expect(task_list[0]).to have_content '尾形' 
        expect(task_list[1]).to have_content '向井' 
        expect(task_list[2]).to have_content '菅良' 
       end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task, name: '箕輪')
        visit tasks_path
        expect(page).to have_content '箕輪'  
       end
    end
  end
  describe '詳細表示機能' do
     context '任意のタスク詳細画面に遷移した場合' do
       it '該当タスクの内容が表示される' do
        @task = FactoryBot.create(:task, name: '赤木', detail: 'スラムダンク')
        visit task_path(@task.id)
        expect(page).to have_content '詳細'
       end
     end
  end
  # context 'タスクが作成日時の降順に並んでいる場合' do
  #   it '新しいタスクが一番上に表示される' do
  #    FactoryBot.create(:task)
  #    FactoryBot.create(:second_task)
  #    visit tasks_path
  #    task_list = all('.task_list')
  #    expect(task_list[0]).to have_content 'sample'
  #    expect(task_list[1]).to have_content 'test'
  #  end
  # end
end
describe 'タスク管理機能', type: :system do
  describe '検索機能' do
    before do
      # 必要に応じて、テストデータの内容を変更して構わない
      FactoryBot.create(:task, name: "task", status: '未着手')
      FactoryBot.create(:task, name: "sample", status: '完了')
    end

    context 'タイトルであいまい検索をした場合' do
      it "検索キーワードを含むタスクで絞り込まれる" do
        visit tasks_path
        # タスクの検索欄に検索ワードを入力する (例: task)
        fill_in 'task_name', with: 'task'
        # 検索ボタンを押す
        click_on '検索'
        expect(page).to have_content 'task'
      end
    end
    context 'ステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        visit tasks_path
        select '未着手', from: 'task_status' 
        click_on '検索'
        expect(page).to have_content '未着手'
        # ここに実装する
        # プルダウンを選択する「select」について調べてみること
      end
    end
    context 'タイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
       visit tasks_path
       fill_in 'task[name]', with: 'task'
       select '未着手', from: 'task_status'
       click_on '検索'
       expect(page).to have_content '未着手'
      end
    end
  end
end