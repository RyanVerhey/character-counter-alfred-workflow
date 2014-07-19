# Written by Ryan Verhey as a simple alfred_helper
# ryanverhey.com

module Alfred
  class Workflow
    def initialize
      @items = []
    end

    def add_item(*items)
      items.each { |item| @items << item }
    end

    alias :<< :add_item

    def to_s
      xml = "<items>"
      @items.each do |item|
        xml += item.to_s
      end
      xml += "</items>"
    end
  end

  class Item
    @@properties = [:title, :subtitle, :arg, :uid, :icon, :icon_type, :autocomplete, :valid, :type]
    @@properties.each do |prop|
      attr_accessor prop
    end

    def initialize(attributes = {})
      attributes.each do |key, value|
        self.send("#{key}=", attributes.fetch(key,nil)) if @@properties.member? key
      end
    end

    def to_s
      xml = "<item valid='#{self.valid ? self.valid : "yes"}'"
      xml += " uid='#{self.uid}'" if self.uid
      xml += " arg='#{self.arg}'" if self.arg
      xml += " type='#{self.type}'" if self.type
      xml += ">"
      xml += "<title>#{self.title}</title>" if self.title
      xml += "<subtitle>#{self.subtitle}</subtitle>" if self.subtitle
      xml += "<icon#{(" type='" + self.icon_type + "'") if self.icon_type}>#{self.icon}</icon>" if self.icon
      xml += "</item>"
    end
  end
end
