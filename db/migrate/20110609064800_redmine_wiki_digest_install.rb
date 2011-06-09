class RedmineWikiDigestInstall < ActiveRecord::Migration
  def self.up
    create_table :wiki_digests do |t|
      t.timestamps
      t.integer :user_id
      t.integer :wiki_content_id
    end
  end
  
  def self.down
    drop_table :wiki_digests
  end
end