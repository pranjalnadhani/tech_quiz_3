module ApplicationHelper
  # assigns the required class to different types of flash alerts
  def flash_class(level)
    case level
      when :notice then "info"
      when :error then "error"
      when :alert then "warning"
    end
  end
  # assigns the required heading to different types of flash alerts
  def flash_heading(level)
    case level
      when :notice then "Congratulations!"
      when :error then "Oh snap!"
      when :alert then "Oops! Something's stopping you..."
    end
  end
  # assigns the required explanation to different types of flash alerts
  def flash_explanation(level)
    case level
      when :notice then "The following task(s) were successfully done:"
      when :error then "The following error(s) were encountered while processing your request:"
      when :alert then "Make sure of certain things and please try again."
    end
  end
end
