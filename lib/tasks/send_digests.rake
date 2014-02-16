desc 'sends all pending wiki digests to all users'
task :send_digests => :environment do
  User.all.each do |user|
    digests = WikiDigest.all(:conditions => {:user_id => user.id}, :include => :wiki_content,
      :order => 'wiki_contents.version' )
    data = {}
    digests.each do |digest|
      unless digest.wiki_content.nil?
        data[digest.wiki_content.project] ||= {}
        data[digest.wiki_content.project][digest.wiki_content.page] ||= []
        data[digest.wiki_content.project][digest.wiki_content.page].push digest.wiki_content
        digest.destroy
      end
    end
    
    WikiDigestMailer.wiki_digest(user, data).deliver unless data.empty?
  end
end
