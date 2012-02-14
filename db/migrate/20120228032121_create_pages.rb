# encoding: utf-8
class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.text :content
      t.timestamps
    end

    %W(节目介绍 下期预告 Topjs切换 热点新闻 樱流前线 前集回顾 樱视频 樱乐星 流行樱乐大改版).each do |a|
      Page.create(:name => a)
    end
  end
end
