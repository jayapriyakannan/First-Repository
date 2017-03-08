#Screenshots create deirectory and put reports and screenshot

 at_exit do
  ReportBuilder.configure do |config|
    config.json_path = 'reports'
    config.report_path = 'report'
    config.report_types = [:html]
    config.report_tabs = [:overview, :features, :scenarios, :errors]
    config.report_title = 'Test Results'
    config.compress_images = false
  end
  ReportBuilder.build_report
end
 Before do
  page.driver.browser.manage.window.maximize
  @login_page = Login.new
 end
 After do |scenario|
   # if (scenario.failed?)
   Dir.mkdir("images") unless File.directory?("images")
   image_name = "images/#{scenario.__id__}.png"
   save_screenshot(image_name, :full => true)
   embed(image_name, "image/png", "SCREENSHOT")
   # end
 end
 #delete the images files before every test
 unless Dir.glob('images/*').empty?
   FileUtils.rm_rf Dir.glob('images/*')
 end
 #delete the error reports generated for failures
 unless Dir.glob('error_pages/*').empty?
   FileUtils.rm_rf Dir.glob('error_pages/*')
 end
 #create reports directory if not present
 Dir.mkdir("reports") unless File.directory?("reports")
 After do |scenario|
   if (scenario.failed?)
     scenario_name = scenario.name.gsub /[^\w\-]/, ' '
     time = Time.now.strftime("%Y-%m-%d-%H%M")
     filename = time + '_' + scenario_name
     Dir.mkdir("error_pages") unless File.directory?("error_pages")
     save_and_open_page("error_pages/#{filename}")
     # File.open("error_pages/#{filename}.html", 'w') { |f| f.write(page.html) }
   end
 end

 unless Dir.glob('reports/*').empty?
   FileUtils.rm_rf Dir.glob('reports/*')
 end


 #delete the images files before every test
 unless Dir.glob('images/*').empty?
   FileUtils.rm_rf Dir.glob('images/*')
 end
 #delete the error reports generated for failures
 unless Dir.glob('error_pages/*').empty?
   FileUtils.rm_rf Dir.glob('error_pages/*')
 end

 #delete the json reports generated
 unless Dir.glob('reports/*').empty?
   FileUtils.rm_rf Dir.glob('reports/*')
 end

 #delete the junit reports generated
 unless Dir.glob('junit/*').empty?
   FileUtils.rm_rf Dir.glob('junit/*')
 end

 #create reports directory if not present
 Dir.mkdir("reports") unless File.directory?("reports")
