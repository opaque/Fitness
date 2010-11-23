module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
	when /register page/
	  '/users/new'
	when /landing page/
	  '/'
	when /login page/
	  '/login'
	when /the graph page/
	  '/graph'
	when /the calendar page/
	  '/events'
	when /the new event page/
	  '/events/new'
	when /new exercise page for event (\d+)/
	  '/events/' + $1 + '/workout_sessions/new'
	when /edit workout page for workout session (\d+) of event (\d+)/
	  '/events/' + $1 + '/workout_sessions/' + $1 + '/edit'
	when /edit workout history page for workout session (\d+)/
	  '/workout_sessions/' + $1 + '/workout_history/edit'
	when /edit profile page for profile (\d+)/ 
	  '/profiles/' + $1 +'/edit'

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
