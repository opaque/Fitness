And /^I should see (\d+) image$/ do |num_of_images|
   html = Nokogiri::HTML(response.body)
   tags = html.xpath('//img')
   tags.length.to_s().should eql(num_of_images)
end



