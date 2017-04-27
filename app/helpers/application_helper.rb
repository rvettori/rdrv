module ApplicationHelper
  def active_page?(target)
    'active' if controller_name == target
  end
end
