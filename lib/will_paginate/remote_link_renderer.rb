require 'will_paginate/view_helpers/action_view'

class RemoteLinkRenderer < BootstrapLinkRenderer
  protected

  def link(text, target, attributes = {})
    attributes["data-remote"] = true
    super
  end
end
