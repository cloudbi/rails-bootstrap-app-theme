module ApplicationHelper
  def navbar_left(menu)
    menu.item 'Navbar', '#navbar', active: true
    menu.item 'Sidebar', '#sidebar'
    menu.item 'Account Mappings', root_path, :active => controller.controller_name == 'accounts'
    menu.item 'Measures', root_path, :active => controller.controller_name == 'measures'
  end

  def navbar_right(menu)
    menu.item 'username@email.com', root_path
    menu.item icon('icon-off'), root_path, :active => controller.controller_name == 'measures'
  end

  def brand(link)
    link.item 'Brand', root_path
  end

  def month_range
    months = (Date.parse('1 Jan 2012')..Date.parse('1 Sep 2012')).collect{|d| d.strftime('%B %Y')}.uniq!
    options_for_select(months)
  end
end
