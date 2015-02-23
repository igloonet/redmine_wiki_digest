require_dependency 'wiki_content'

module RedmineWikiDigest
  module Patches
    module WikiContentPatch
      def self.included(base) # :nodoc:
        base.send(:include, InstanceMethods)
      end

      module InstanceMethods
        def after_save(wiki_content)
          digest_recipients = wiki_content.recipients + wiki_content.page.wiki.watcher_recipients + wiki_content.page.watcher_recipients
          digest_recipients = digest_recipients.uniq.map { |e| User.find_by_mail(e) }
          digest_recipients.each do |user|
            WikiDigest.create(:user => user, :wiki_content => wiki_content)
          end
          # not calling super which disables mail delivery
        end
      end
    end
  end
end

unless WikiContent.included_modules.include?(RedmineWikiDigest::Patches::WikiContentPatch)
  WikiContent.send(:include, RedmineWikiDigest::Patches::WikiContentPatch)
end
