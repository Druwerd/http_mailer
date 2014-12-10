module HttpMailer
  class MandrillMessage
    attr_accessor :to, :to_name, :from, :from_name, :subject, :text, :html
    attr_reader :structure

    def initialize(from, to, subject, text=nil, html=nil, from_name=nil, to_name=nil)
      @to = to
      @from = from
      @subject = subject
      @text = text
      @html = html
      @to_name = to_name
      @from_name = from_name
      @structure = json_message_struct
      build_message
    end

    def to_h
      self.structure.to_h
    end

    private
    def build_message
      to_struct = json_to_struct
      to_struct[:email] = self.to
      to_struct[:name] = self.to_name if self.to_name

      self.structure[:from_email] = self.from
      self.structure[:from_name] = self.from_name if self.from_name

      self.structure[:subject] = self.subject
      self.structure[:text] = self.text if self.text
      self.structure[:html] = self.html if self.html
      self.structure[:to] << to_struct
    end

    def json_message_struct
      {
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
    end

    def json_to_struct
      {
        email: nil,
        name: nil
      }
    end
  end
end