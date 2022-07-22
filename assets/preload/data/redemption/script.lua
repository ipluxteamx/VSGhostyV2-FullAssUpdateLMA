function onCreatePost()
    addVCREffect('camGame');
    addVCREffect('camHUD', false);
end

function onEndSong()
	return Function_Continue;
end