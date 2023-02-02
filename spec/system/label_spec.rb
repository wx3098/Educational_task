require 'rails_helper'

RSpec.describe 'ラベル機能', type: :system do
    context '新規作成' do
        it 'ラベル登録' do
    FactoryBot.create(:label)
    FactoryBot.create(:user)
    visit new_session_path
    fill_in 'session[email]', with: 'test@code.com'    
    fill_in 'session[password]', with: 'testcode'    
    click_on 'Log in'
    click_on 'タスク一覧'
    click_on '新しくタスクを投稿する'
    fill_in 'task[name]', with: '高橋'
    fill_in 'task[detail]', with: 'takahasi@karubi.com'
    fill_in 'task[termination_date]', with: '002023-02-02'
    select '未着手', from: "task[status]"
    select '高', from: "task[priority]"
    # check 'task_label_ids_#{Label.last.id}' 
    check 'ゴン'
    click_on '登録する'
    expect(page).to have_content '高橋'  
    end
  end
    context 'ラベル検索をする場合' do
        it 'ラベル検索ができる' do
        FactoryBot.create(:label)
        FactoryBot.create(:user)
        visit new_session_path
        fill_in 'session[email]', with: 'test@code.com'    
        fill_in 'session[password]', with: 'testcode'    
        click_on 'Log in'
        click_on 'タスク一覧'
        click_on '新しくタスクを投稿する'
        fill_in 'task[name]', with: '高橋'
        fill_in 'task[detail]', with: 'takahasi@karubi.com'
        fill_in 'task[termination_date]', with: '002023-02-02'
        select '未着手', from: "task[status]"
        select '高', from: "task[priority]"
        check 'ゴン'
        click_on '登録する'
        visit tasks_path
        select 'ゴン', from: "task[label_id]"
        click_on 'Search'
        expect(page).to have_content 'ゴン'  
        end        
        end
end