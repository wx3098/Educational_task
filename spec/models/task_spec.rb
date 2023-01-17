require 'rails_helper'

RSpec.describe 'タスクモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        task = Task.new(name: '', detail: '失敗テスト')
        expect(task).not_to be_valid
      end
    end
    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        # ここに内容を記載する
        task = Task.create(name: '', detail: '失敗しました')
        expect(task).not_to be_valid
      end
    end
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        # ここに内容を記載する
        @task = Task.new(name: '流川', detail: '見ることが出来ません')
        expect(@task).to be_valid
      end
    end
  end
end
describe 'タスクモデル機能', type: :model do
  describe '検索機能' do
    # 必要に応じて、テストデータの内容を変更して構わない
    let!(:task) { FactoryBot.create(:task, name: 'task', status: "完了" ) }
    let!(:second_task) { FactoryBot.create(:second_task, name: '苺', status: "未着手")}
    context 'scopeメソッドでタイトルのあいまい検索をした場合' do
      it "検索キーワードを含むタスクが絞り込まれる" do
        expect(Task.name_search('task')).to include(task)
        expect(Task.name_search('task')).not_to include(second_task)
        expect(Task.name_search('task').count).to eq 1
      end
    end
    context 'scopeメソッドでステータス検索をした場合' do
      it "ステータスに完全一致するタスクが絞り込まれる" do
        expect(Task.status_search('完了')).to include(task)
        expect(Task.status_search('完了')).not_to include(second_task)
        expect(Task.status_search('完了').count).to eq 1
      end
    end
    context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
      it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
        expect(Task.name_search('task') && Task.status_search('完了')).to include(task)
        expect(Task.name_search('task') && Task.status_search('完了')).not_to include(second_task)
        expect(Task.name_search('task') && Task.status_search('完了').count).to eq 1
      end
    end
  end
end
