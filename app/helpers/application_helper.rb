module ApplicationHelper
    def linebreaksbr(text)
    return text.gsub(/\r\n|\r|\n/, "<br />")
  end
  def isEventPage?()
    controller_name == "events" && action_name == "show"
  end
end
