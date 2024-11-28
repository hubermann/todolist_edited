module ApplicationHelper
  def flash_class(type)
    case type.to_sym
    when :notice then "success"
    when :alert then "danger"
    else "info"
    end
  end
end
