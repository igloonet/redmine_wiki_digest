desc 'sends all pending wiki digests to all users'
task :send_digests => :environment do
  User.all.each do |user|
    digests = WikiDigest.all(:conditions => {:user_id => user.id}, :include => :wiki_content)
    data = {}
    digests.each do |digest|
      data[digest.wiki_content.project] ||= []
      data[digest.wiki_content.project].push digest.wiki_content
      digest.destroy
    end
    
    WikiDigestMailer.deliver_wiki_digest(user, data) unless data.empty?
  end
end