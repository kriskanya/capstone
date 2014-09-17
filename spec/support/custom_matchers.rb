# This is what creates the have_error method, which allows you check the errors next
# to different input fields in the html

RSpec::Matchers.define :have_error do |text, options|
  match do |page|
    field = options[:on]
    selector = ".//div[contains(@class,'error') and ./label[contains(text(),'#{field}')] and .//*[contains(text(),\"#{text}\")]]"
    page.should have_xpath(selector)
  end
end
