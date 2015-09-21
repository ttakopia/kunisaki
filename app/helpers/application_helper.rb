module ApplicationHelper
    def linebreaksbr(text)
    return text.gsub(/\r\n|\r|\n/, "<br />")
  end
end
