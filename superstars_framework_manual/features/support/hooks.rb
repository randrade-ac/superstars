#hooks
Before do
  if ENV['BROWSER']
     @browser = Watir::Browser.new ENV['BROWSER'].to_sym
   else
    @browser = Watir::Browser.new :firefox
  end
  # @browser.maximize
end

After do |scenario|

  if (scenario.failed?)
    filename = "results/#{@current_page.class}-#{Time.now}.png"
    @current_page.save_screenshot(filename)
    embed(filename, "image/png","SCREENSHOT")
  end
  @browser.quit
end







