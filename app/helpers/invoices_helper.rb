module InvoicesHelper
  # This is not the best way to query the database, but for testing purposes it will do
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title, { sort: column,
                     direction: direction,
                     page: @current_page }, { remote: true }
  end

  def default_title
    Time.now.strftime("%A %d %Y") + " shopping"
  end

  def count_month_spend
    @current_user_invoices.invoices_for_year
                          .current_month
                          .sum(:amount)
  end
  
  def count_showed_spend
    @invoices.reduce(0) { | sum, invoice | sum + invoice.amount }
  end
  
  def count_year_spend
    @current_user_invoices.invoices_for_year.sum(:amount)
  end

end
