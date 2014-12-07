module HttpMailer
  class MandrillMessage
    attr_accessor :to, :to_name, :from, :from_name, :subject, :text, :html
    attr_reader :structure

    TO_STRUCT = {
      email: nil,
      name: nil
    }

    VARS_STRUCT = {
      name: nil,
      content: nil
    }

    MERGE_VARS_STRUCT = {
      rcpt: nil,
      vars:[]
    }

    RECIPIENT_METADATA = {
      rcpt: nil,
      values: []
    }

    ATTACHMENTS = {
      type: nil,
      name: nil,
      content: nil
    }

    IMAGES = {
      type: nil,
      name: nil,
      content: nil
    }

    JSON_MESSAGE_STRUCT = {
      html: nil,
      text: nil,
      subject: nil,
      from_email: nil,
      from_name: nil,
      to: [],
      headers: {},
      important: nil,
      track_opens: nil,
      track_clicks: nil,
      auto_text: nil,
      auto_html: nil,
      inline_css: nil,
      url_strip_qs: nil,
      preserve_recipients: nil,
      view_content_link: nil,
      bcc_address: nil,
      tracking_domain: nil,
      signing_domain: nil,
      return_path_domain: nil,
      merge: nil,
      merge_language: nil,
      global_merge_vars: [],
      merge_vars: [],
      tags: [],
      subaccount: nil,
      google_analytics_domains: [],
      google_analytics_campaign: nil,
      metadata: [],
      recipient_metadata: [],
      attachments: [],
      images: []
    }

    def initialize(to, from, subject, text=nil, html=nil, to_name=nil, from_name=nil)
      @to = to
      @from = from
      @subject = subject
      @text = text
      @html = html
      @to_name = to_name
      @from_name = from_name
      @structure = JSON_MESSAGE_STRUCT.dup
      build_message
    end

    def to_h
      self.structure.to_h
    end

    def to_json
      self.structure.to_json
    end

    private
    def build_message
      to_struct = TO_STRUCT.dup
      to_struct[:email] = self.to
      to_struct[:name] = self.to_name if self.to_name

      self.structure[:from_email] = self.from
      self.structure[:from_name] = self.from_name if self.from_name

      self.structure[:subject] = self.subject
      self.structure[:text] = self.text if self.text
      self.structure[:html] = self.html if self.html
      self.structure[:to] << to_struct
    end
  end
end