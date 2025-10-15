require 'cgi'

module Jekyll
  module ImageAttributes
    IMAGE_REGEX = /!\[(?<inside>[^\]]*)\]\((?<url>[^)]+)\)/.freeze

    def self.process(markdown)
      return markdown if markdown.nil? || markdown.empty?

      markdown.gsub(IMAGE_REGEX) do
        match_str = Regexp.last_match[0]
        inside = Regexp.last_match[:inside] || ""
        url = (Regexp.last_match[:url] || "").strip

        # Only transform when custom pipe attributes are present
        unless inside.include?('|')
          next match_str
        end

        tokens = inside.split('|').map { |t| t.strip }.reject(&:empty?)
        alt_base = tokens.shift || ""

        attrs = {}
        tokens.each do |tok|
          if tok.include?("=")
            key, value = tok.split('=', 2)
            key = key.strip.downcase
            value = value.strip
            if (value.start_with?('"') && value.end_with?('"')) || (value.start_with?("'") && value.end_with?("'"))
              value = value[1..-2]
            end
            attrs[key] = value
          end
        end

        # Determine caption: prefer explicit caption attr; else use the pre-pipe text
        caption = if attrs['caption'] && !attrs['caption'].empty?
                    attrs['caption']
                  else
                    alt_base
                  end

        # Determine alt: prefer explicit alt attr; else use pre-pipe; else fallback to caption
        alt = if attrs['alt'] && !attrs['alt'].empty?
                attrs['alt']
              elsif alt_base && !alt_base.empty?
                alt_base
              else
                caption.to_s
              end
        align = attrs['align']
        width = attrs['width']
        height = attrs['height']
        extra_class = attrs['class']
        element_id = attrs['id']

        safe_alt = CGI.escapeHTML(alt.to_s)
        safe_caption = caption.nil? ? nil : CGI.escapeHTML(caption.to_s)

        class_names = ['figure', 'mobile-full']
        class_names << "align-#{align}" if align && %w[left center right].include?(align)
        if extra_class && !extra_class.empty?
          sanitized_classes = extra_class.split(/\s+/).map { |c| c.gsub(/[^a-zA-Z0-9\-_]/, '') }.reject(&:empty?)
          class_names.concat(sanitized_classes)
        end
        class_attr = class_names.join(' ')

        style_rules = []
        style_rules << "width: #{width}" if width && !width.empty?
        style_rules << "height: #{height}" if height && !height.empty?
        style_attr = style_rules.empty? ? '' : " style=\"#{CGI.escapeHTML(style_rules.join('; '))}\""

        id_attr = ''
        if element_id && !element_id.empty?
          safe_id = element_id.gsub(/[^a-zA-Z0-9\-_:.]/, '')
          id_attr = " id=\"#{safe_id}\""
        end

        figure_open = "<figure class=\"#{class_attr}\"#{id_attr}>"
        img_tag = "<img src=\"#{url}\" alt=\"#{safe_alt}\"#{style_attr} />"
        figcaption_tag = safe_caption && !safe_caption.empty? ? "<figcaption>#{safe_caption}</figcaption>" : ''
        figure_close = '</figure>'

        "#{figure_open}#{img_tag}#{figcaption_tag}#{figure_close}"
      end
    end
  end

  Jekyll::Hooks.register :pages, :pre_render do |page, _payload|
    if page.respond_to?(:content) && page.content
      page.content = ImageAttributes.process(page.content)
    end
  end

  Jekyll::Hooks.register :documents, :pre_render do |doc, _payload|
    if doc.respond_to?(:content) && doc.content
      doc.content = ImageAttributes.process(doc.content)
    end
  end
end


