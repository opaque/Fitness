// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function moveEvent(event, dayDelta, minuteDelta, allDay){
    jQuery.ajax({
        data: 'id=' + event.id + '&title=' + event.title + '&day_delta=' + dayDelta + '&minute_delta=' + minuteDelta + '&all_day=' + allDay,
        dataType: 'script',
        type: 'post',
        url: "/events/move"
    });
}

function resizeEvent(event, dayDelta, minuteDelta){
    jQuery.ajax({
        data: 'id=' + event.id + '&title=' + event.title + '&day_delta=' + dayDelta + '&minute_delta=' + minuteDelta,
        dataType: 'script',
        type: 'post',
        url: "/events/resize"
    });
}

function promptDialog(eventID){
	prompt_dialog = $('#prompt_dialog')
	prompt_dialog.dialog({
		title: 'Delete Event Series?',
		minWidth:500,
		width:500,
		position:'center',
		close: function(ev, ui){
            prompt_dialog.dialog('destroy');
			$('#prompt').html("");
        },
		open: function(ev, ui){
			$('#prompt').html("&nbsp; <a href = 'javascript:void(0);' onclick ='deleteEvent(" + eventID + ", " + false + ");prompt_dialog.dialog(\"destroy\"); '>Delete Only This Occurrence</a>");
	        $('#prompt').append("&nbsp;&nbsp; <a href = 'javascript:void(0);' onclick ='deleteEvent(" + eventID + ", " + true + ");prompt_dialog.dialog(\"destroy\");'>Delete All In Series</a>");
	        $('#prompt').append("&nbsp;&nbsp; <a href = 'javascript:void(0);' onclick ='deleteEvent(" + eventID + ", \"future\");prompt_dialog.dialog(\"destroy\");'>Delete All Future Events</a>");
		}
	});
}

function showEventDetails(event){
    //$('#event_desc').html(event.description);
    $('#edit_event').html("<a href = 'javascript:void(0);' onclick ='editEvent(" + event.id + ")'>Edit</a>");
	
	//testing new javascript popup page
	$('#add_session').html("<a href ='javascript:void(0);' onclick='addSession(" + event.id + ")'>View Workout Session</a>");
	//
	
    if (event.recurring) {
        title = event.title + " (Recurring)";
		$('#delete_event').html("<a href = 'javascript:void(0);' onclick ='promptDialog(" + event.id + ")'> Delete </a>")
        
    }
    else {
        title = event.title;
        $('#delete_event').html("<a href = 'javascript:void(0);' onclick ='deleteEvent(" + event.id + ", " + false + ")'>Delete</a>");
    }

    $('#desc_dialog').dialog({
        title: title,
        modal: true,
        width: 700,
		minWidth: 700,
		minHeight: 500,		
		position: ['top', 'center'],
        close: function(event, ui){
            $('#desc_dialog').dialog('destroy').remove();
			$('#prompt_dialog').dialog('destroy');
			//insert back in the dialog divs to prevent caching
			$('<div id = "desc_dialog" style ="display:none;">'+ 
			'<div id="tabs"><ul><li><span id = "edit_event"></span></li><li>'+
			'<span id = "add_session"></span></li><li><span id = "delete_event">' + 
			'</span></li></ul></div><div id = "event_desc"></div><br/><br/></div>').insertAfter('#wrapcalendar');
			$( "#tabs" ).tabs();
        },
		open: function(ev, ui){
			editEvent(event.id)
		}
        
    });
    
}



function addSession(event_id){
	jQuery.ajax({
		//data: event_id,
		dataType: 'script',
		type: 'get',
		url: "/events/new_session/" + event_id
	});
}

function editEvent(event_id){
    jQuery.ajax({
        //data: 'id=' + event_id,
        dataType: 'script',
        type: 'get',
        url: "/events/"+event_id+"/edit"
    });
}

function deleteEvent(event_id, delete_all){
	if (confirm("Are you sure about this?")) {
    jQuery.ajax({
        data: 'id=' + event_id + '&delete_all='+delete_all,
        dataType: 'script',
        type: 'post',
        url: "/events/destroy"
    });
}
}

function showPeriodAndFrequency(value){

    switch (value) {
        case 'Daily':
            $('#period').html('day');
            $('#frequency').show();
            break;
        case 'Weekly':
            $('#period').html('week');
            $('#frequency').show();
            break;
        case 'Monthly':
            $('#period').html('month');
            $('#frequency').show();
            break;
        case 'Yearly':
            $('#period').html('year');
            $('#frequency').show();
            break;
            
        default:
            $('#frequency').hide();
    }
    
    
    
    
}
