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
		$.post("/subscribe", {email: $('#email').val(), surprise: $("#surprise").val()},function(data){
			$('#subscribe-button').html(data)
		} );
		$('#subscribe-form').hide();
		$('#subscribe-button').html('Subscribed');
		$('#subscribe-button').prop('disabled',true);
		$('#cancel-button').hide();
	} else {
		$('#subscribe-form').show('slow');
		$('#subscribe-button').html('Send');
		$('#cancel-button').show('slow');
	}
};
