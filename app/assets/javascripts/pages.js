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
