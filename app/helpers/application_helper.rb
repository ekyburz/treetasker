module ApplicationHelper
  def possessive_form(name)
    name.end_with?('s') ? "#{name}'" : "#{name}'s"
  end
end
