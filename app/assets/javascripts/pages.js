function hide_edit_tools(x){
	$(x).first().find('.edit-tools').removeClass('visible');
};

function show_edit_tools(x){
	$(x).first().find('.edit-tools').addClass('visible');
};

function toggle_section(div_content,caret_span){
	$(div_content).toggle('slow');
	$(caret_span).find('i').toggleClass('fa-caret-right');
	$(caret_span).find('i').toggleClass('fa-caret-down');
};

function click_subscribe_button(){
	if ($('#subscribe-form').is(':visible')){
		$.post("/subscribe", {email: $('#email').val(), when: $("#when").val()},function(data){
			$('#subscribe-button').html(data)
		} );
		$('#subscribe-form').hide('slow');
		$('#subscribe-button').prop('disabled',true);
		$('#cancel-button').hide();
	} else {
		$('#subscribe-form').show('slow');
		$('#subscribe-button').html('Send');
		$('#cancel-button').show('slow');
	}
};

function trigger_img_popover(x, action){
	$(x).next("div").children().first().popover(action)
};

function ajax_preview_description(model_name){
	$.ajax({
		url: "/helpers/html_renderer",
		data: {
			content: $('#' + model_name + '_description').val()
		},
		method: 'POST',
		datatype: 'html'
	}).done(function(html,status){
		$('#preview').html(html);
	}); 
}
