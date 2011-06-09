require 'redmine'

Redmine::Plugin.register :redmine_wiki_digest do
  name 'Redmine Wiki Digest plugin'
  author 'Ares'
  description 'This is a plugin for Redmine which changes wiki email sending to daily digest'
  version '0.0.1'
  url 'https://github.com/igloonet/redmine_wiki_digest'
  author_url 'http://www.igloonet.cz'
  
  require_dependency 'app/models/mailer'
  require_dependency 'redmine_wiki_digest/mailer'
end
