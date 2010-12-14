require 'spec_helper'

describe EventsController do
	
  before {login}
  before(:each) do
    @params = {
      :user_id => current_user.id, :title => 'hello', :event_id => 1, :description =>'description', 
        :starttime => mock_datetime, :endtime => mock_datetime, :all_day => false, :event_series_id => nil 
    }
    @invalid_params = {
      :user_id => current_user.id, :title => 'hello', :event_id => 1, :description =>'description', 
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
    it "assigns the requested event as @event" do
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
      before(:each) do
        @valid_mock_event = mock_event(:save => true, :period => "Does not repeat")
        @valid_mock_series = mock_event_series(:save => true, :period => "Monthly")
        Event.stub(:new).and_return(@valid_mock_event)
        EventSeries.stub(:new).and_return(@valid_mock_series)
      end
      
      it "assigns a newly created event as @event" do
         @valid_mock_event.should_receive(:new).with(@params)
         post :create, :event => @params.merge(:save => true, :period => "Does not repeat")
         puts response.header
      end

      it "assigns a newly created event series as @event_series" do
        #debugger
        @valid_mock_series.should_receive(:new)
        post :create, :event => @params.merge(:save => true, :period => "Monthly")
        
      end
    end
    describe "with invalid params" do
         it "assigns a newly created but unsaved event as @event" do
           Event.stub(:new).with(params).and_return(mock_event(:save => false, :period => "Does not repeat"))
            post :create, :event => params

         end
       end
    
  end
  
  
  describe "PUT update" do

      describe "with valid params" do
        before(:each) do
          #Event.stub(:find_by_id).and_return(mock_event(:save => true, :period => "Does not repeat"))
          #EventSeries.stub(:new).and_return(mock_event_series(:save => true, :period => "Monthly"))
          Event.stub!(:find_by_id).and_return(mock_event)
        end
        it "updates the requested non-series event" do
            mock_event.should_receive(:attributes=)
            put :update, :id => "37", :event => @params
        end

        it "assigns the requested event as @event" do

        end

        it "redirects to the event" do

        end
      end

      describe "with invalid params" do
        it "updates the requested event" do

        end

        it "assigns the event as @event" do

        end

        it "re-renders the 'edit' template" do

        end
      end

    end

    describe "DELETE destroy" do
      it "destroys the requested event" do

      end

      it "redirects to the events list" do

      end
    end
  

   
end
