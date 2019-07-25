function onClientLoad() {
		    gapi.client.load('youtube', 'v3', onYouTubeApiLoad);
		}
		
function onYouTubeApiLoad() {
    gapi.client.setApiKey('AIzaSyCVzyRgudCBbAMvZSYWO4JaBc05wURt5dY');
    
    setTimeout(
    search($('#keyword').val().trim()),1000);
}
		