require 'spec_helper'

describe EventsController do
	
  before {login}
  before(:each) do
    @params = {
      :user_id => current_user.id, :title => 'hello',  :description =>'description', 
        :starttime => mock_datetime, :endtime => mock_datetime, :all_day => false, :event_series_id => nil 
    }
    @invalid_params = {
      :user_id => current_user.id, :title =>nil, :description =>'description', 
        :starttime => mock_datetime, :endtime => mock_datetime, :all_day => false, :event_series_id => nil
    }
  end
  def mock_event(stubs={})
    @mock_event ||= mock_model(Event, @params.merge(stubs)) # make the user_id default at 1
  end
  
  def mock_datetime(stubs={})
    @mock_datetime ||= mock_model(DateTime, :iso8601 => Time.now)
  end
  
  def mock_event_series(stubs={})
    @mock_event_series ||= mock_model(EventSeries, @params.merge(stubs))
  end


  describe "GET show" do
    it "makes an html call" do
      Event.stub(:find).and_return([mock_event])
      get :show
      response.content_type.should == "text/html"
    end
  end

  describe "GET new" do
    it "assigns a new event as @event" do
      Event.stub(:new).and_return(mock_event)
      get :new
      assigns[:event].should equal(mock_event)
    end
  end

  describe "GET edit" do
    it "assigns the requested event as @event" do
      Event.stub(:find).and_return(mock_event)
      get :edit, :id => "37"
      assigns[:event].should equal(mock_event)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      #before(:each) do
        #@valid_mock_event = mock_event(:save => true, :period => "Does not repeat")
        #@valid_mock_series = mock_event_series(:save => true, :period => "Monthly")
        #Event.stub(:new).and_return(@valid_mock_event)
        #EventSeries.stub(:new).and_return(@valid_mock_series)
      #end
      
      it "assigns a newly created event as @event" do
		@params[:period] = "Does not repeat"
        Event.stub(:new).and_return(mock_event) 
        post :create, :event => @params
        assigns[:event].should equal(mock_event)
      end

      it "assigns a newly created event series as @event_series if recurring" do
        #@params[:period]="Monthly"
		EventSeries.stub(:new).and_return(mock_event_series)
        post :create, :event => @params.merge(:period => "Monthly")
        assigns[:event_series].should equal(mock_event_series)
      end
    end
    describe "with invalid params" do
        it "assigns a newly created but unsaved event as @event" do
          Event.stub(:new).and_return(mock_event(:save => false ))
          post :create, :event => @invalid_params.merge(:period => "Does not repeat")
		  assigns[:event].should equal(mock_event)
        end
		 
		it "assigns a newly created but unsaved event as @event_series for recurring events" do
          EventSeries.stub(:new).and_return(mock_event_series)
		  post :create, :event => @invalid_params.merge(:period => "Monthly")
		  assigns[:event_series].should equal(mock_event_series)
		end
       end
    
  end
  
  
  describe "PUT update" do

      describe "with valid params" do
        before(:each) do
          #Event.stub(:find_by_id).and_return(mock_event(:save => true, :period => "Does not repeat"))
          #EventSeries.stub(:new).and_return(mock_event_series(:save => true, :period => "Monthly"))
          Event.stub!(:find_by_id).with("1").and_return(mock_event)
		  
        end
        it "updates the requested non-series event" do
			mock_event.should_receive(:attributes=)
			@params[:commit_button] = "Update only this occurence"
			mock_event.stub(:attributes=).with(@params.merge(:id => "1")).and_return(@params)
            put :update, :id => "1", :event => @params.merge(:id => "1")
			
        end
		
		it "updates all events in the series when requested and assign to @events" do
			mock_event.stub(:event_series).and_return(mock_event_series)
			mock_event_series.stub(:events).and_return([mock_event])
			@params[:commit_button] = "Update All Occurrences"
			@params[:id] = "1"
            put :update, :id => "1", :event => @params
			assigns[:events].should ==([mock_event])
			#assigns[:params].should ==(@params)
		end
		
        it "assigns the requested event as @event" do
			mock_event.stub(:event_series).and_return(mock_event_series)
			mock_event_series.stub(:events).and_return(mock_event)
			mock_event.stub(:find).and_return([mock_event])
			mock_datetime.stub(:to_formatted_s).and_return("string")
			@params[:commit_button] = "Update All Following Occurrences"
            put :update, :id => "1", :event => @params.merge(:id => "1")
			assigns[:events].should ==([mock_event])
			#assigns[:params].should ==(@params.merge(:id => "1"))
        end

      end

      describe "with invalid params" do
        it "updates the requested non-series event but does not save it" do
			Event.stub!(:find_by_id).with("1").and_return(mock_event)
			mock_event.should_receive(:attributes=)
			@params[:commit_button] = "Update only this occurence"
			mock_event.stub(:attributes=).with(@params.merge(:id => "1")).and_return(@params)
            put :update, :id => "1", :event => @params.merge(:id => "1")
			
        end
		
		
      end

    end

    describe "DELETE destroy" do
	before(:each) do
		Event.stub!(:find_by_id).with("1").and_return(mock_event)
		mock_event.stub(:event_series).and_return(mock_event_series)
	end
	
      it "destroys the requested event_series if delete_all is 'true'" do
		mock_event_series.should_receive(:destroy)
		delete :destroy, :id => "1", :delete_all => 'true'
      end
	  
	  it "destroys the requested events in the future if delete_all is set to 'future'" do
		mock_event_series.stub(:events).and_return(mock_event)
		mock_event.stub(:find).and_return([mock_event])
		mock_datetime.stub(:to_formatted_s).and_return("string")
		mock_event.should_receive(:delete)
		delete :destroy, :id=>"1", :delete_all => 'future'
	  end
	  
	  it "destroys the requested event if only one instance requested" do
		mock_event.should_receive(:destroy)
		delete :destroy, :id => "1", :delete_all => 'false'
	  end

      it "renders update to page" do
		page = double('page')
		#controller.stub(:render)
		controller.stub(:render).with(:update).and_yield(page)
		page.should_receive(:<<)
      end
    end
  

   
end
