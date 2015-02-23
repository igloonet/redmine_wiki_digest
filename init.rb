# encoding: UTF-8
require 'redmine'

Redmine::Plugin.register :redmine_wiki_digest do
  name 'Redmine Wiki Digest plugin'
  author 'Marek Hulán'
  description 'This is a plugin for Redmine which changes wiki email sending to daily digest (work only in production!)'
  version '0.0.2'
  url 'https://github.com/igloonet/redmine_wiki_digest'
  author_url 'http://www.igloonet.cz'

  Rails.configuration.to_prepare do
    require 'redmine_wiki_digest/patches/wiki_content_patch'
  end
end
