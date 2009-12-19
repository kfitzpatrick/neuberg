# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def member_table (members, table_style)
      render :partial => "table", :locals => {:members => members, :table_style => table_style }
  end
end
