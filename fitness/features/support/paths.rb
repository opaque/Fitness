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
	when /edit workout schedule page for schedule (\d+) for user (\d+)/
	  '/users/' + $1 + '/workouts/' + $2 +'/edit'
	when /edit profile page for profile (\d+)/ 
	  '/profiles/' + $1 +'/edit'
	when /the calendar page for user (\d+)/
	  '/users/'+ $1 + '/calendar'
	when /the profile page for user (\d+)/
	  '/users/' + $1 + 'show'
	when /the new workout schedule page for user (\d+)/
	  '/users/'+ $1 + '/workouts/new'

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
