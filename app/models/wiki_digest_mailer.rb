class WikiDigestMailer < ActionMailer::Base
  def wiki_digest(user, data)
    recipients user.mail
    I18n.locale = user.language.blank? ? 'en' : user.language 
    subject I18n.t(:wiki_digest_subject) + ' ' + Date.today.to_s(:short)
    body :data => data
    render_multipart('wiki_digest', body)
  end
  
  private
  
  def render_multipart(method_name, body)
    if Setting.plain_text_mail?
      content_type "text/plain"
      body render(:file => "#{method_name}.text.plain.rhtml", :body => body, :layout => 'mailer.text.plain.erb')
    else
      content_type "multipart/alternative"
      part :content_type => "text/plain", :body => render(:file => "#{method_name}.text.plain.rhtml", :body => body, :layout => 'mailer.text.plain.erb')
      part :content_type => "text/html", :body => render_message("#{method_name}.text.html.rhtml", body)
    end
  end
end