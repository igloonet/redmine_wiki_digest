class WikiDigestMailer < ActionMailer::Base
  def wiki_digest(user, data)
    recipients user.mail
    subject I18n.t(:wiki_digest_subject) + ' ' + Date.today.to_s(:short)
    body :data => data
  end
end