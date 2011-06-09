class WikiDigest < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki_content
end