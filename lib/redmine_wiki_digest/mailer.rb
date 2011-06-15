class Mailer < ActionMailer::Base

  def wiki_content_added(wiki_content)
    digest_recipients = wiki_content.recipients + wiki_content.page.wiki.watcher_recipients + wiki_content.page.watcher_recipients
    digest_recipients = digest_recipients.uniq.map { |e| User.find_by_mail(e) }
    digest_recipients.each do |user|
      WikiDigest.create(:user => user, :wiki_content => wiki_content)
    end
    recipients []
    bcc []
    cc []
    body ''
  end
  
  def wiki_content_updated(wiki_content)
    digest_recipients = wiki_content.recipients + wiki_content.page.wiki.watcher_recipients + wiki_content.page.watcher_recipients
    digest_recipients = digest_recipients.uniq.map { |e| User.find_by_mail(e) }
    digest_recipients.each do |user|
      WikiDigest.create(:user => user, :wiki_content => wiki_content)
    end
    recipients []
    bcc []
    cc []
    body ''
  end
end
