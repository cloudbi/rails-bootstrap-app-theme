module ApplicationHelper
  def navbar_left(menu)
    menu.item 'Home', posts_path
    menu.item 'Dashboard', posts_path, :active => controller.controller_name == 'departments'
    menu.item 'Account Mappings', posts_path, :active => controller.controller_name == 'accounts'
    menu.item 'Measures', posts_path, :active => controller.controller_name == 'measures'
  end

  def navbar_right(menu)
    menu.item 'Home', posts_path
    menu.item 'Dashboard', posts_path, :active => controller.controller_name == 'departments'
    menu.item 'Account Mappings', posts_path, :active => controller.controller_name == 'accounts'
    menu.item icon('icon-off'), posts_path, :active => controller.controller_name == 'measures'
  end

  def brand(link)
    link.item 'Project XXXX', posts_path
  end

  def month_range
    months = (Date.parse('1 Jan 2012')..Date.parse('1 Sep 2012')).collect{|d| d.strftime('%B %Y')}.uniq!
    options_for_select(months)
  end
end
