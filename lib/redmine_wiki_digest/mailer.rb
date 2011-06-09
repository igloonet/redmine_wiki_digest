class Mailer < ActionMailer::Base

  alias_method :wiki_content_added_without_digest, :wiki_content_added
  def wiki_content_added(wiki_content)
    # TODO dle nastavení uživatele, musela by se funkce zkopirovat, takhle to urpavujeme pro vsecky
    if true
      digest_recipients = wiki_content.recipients + wiki_content.page.wiki.watcher_recipients + wiki_content.page.watcher_recipients
      digest_recipients = digest_recipients.uniq.map { |e| User.find_by_mail(e) }
      digest_recipients.each do |user|
        WikiDigest.create(:user => user, :wiki_content => wiki_content)
      end
      recipients []
      body ''
    else
      wiki_content_added_without_digest(wiki_content)
    end
  end
  
  alias_method :wiki_content_updated_without_digest, :wiki_content_updated
  def wiki_content_updated(wiki_content)
    # TODO dle nastavení uživatele, musela by se funkce zkopirovat, takhle to urpavujeme pro vsecky
    if true
      digest_recipients = wiki_content.recipients + wiki_content.page.wiki.watcher_recipients + wiki_content.page.watcher_recipients
      digest_recipients = digest_recipients.uniq.map { |e| User.find_by_mail(e) }
      digest_recipients.each do |user|
        WikiDigest.create(:user => user, :wiki_content => wiki_content)
      end
      recipients []
      body ''
    else
      wiki_content_updated_without_digest(wiki_content)
    end
  end
end
