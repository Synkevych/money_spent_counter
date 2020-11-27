module InvoicesHelper
  def default_title
    Time.now.strftime("%A %d %Y") + " shopping"
  end
end
