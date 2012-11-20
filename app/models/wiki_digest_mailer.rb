class WikiDigestMailer < ActionMailer::Base
  def wiki_digest(user, data)
    @data = data
    mail(:to => user.mail, :subject => I18n.t(:wiki_digest_subject) + ' ' + Date.today.strftime("%d. %m.")) do |format|
      format.text
      format.html
    end
  end
  
end
