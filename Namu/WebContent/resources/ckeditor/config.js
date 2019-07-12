/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here.
	// For complete reference see:
	// https://ckeditor.com/docs/ckeditor4/latest/api/CKEDITOR_config.html

	// The toolbar groups arrangement, optimized for two toolbar rows.
	config.toolbarGroups = [
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		{ name: 'forms', groups: [ 'forms' ] },
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'about', groups: [ 'about' ] }
	];
	config.removeButtons = 'Underline,Subscript,Superscript,PasteFromWord,Styles,Format,spellchecker';
	//config
	config.extraPlugins = 'youtube,font,justify,colorbutton,panelbutton,image2,tableresize';//이미지 사이징 추가예정
	
	config.removePlugins = 'easyimage, cloudservices';
	// Remove some buttons provided by the standard plugins, which are
	// not needed in the Standard(s) toolbar.
	// Set the most common block elements.
	config.format_tags = 'p;h1;h2;h3;pre';
	// Simplify the dialog windows.
	config.removeDialogTabs = 'image:advanced;link:advanced';
	config.defaultLanguage = 'ko';
	
//	config.imageResize.maxWidth = 900;
//	config.imageResize.maxHeight = 600;
	
	//youtube
	config.youtube_width = '640';
	config.youtube_height = '480';
	config.youtube_related = true;
	config.youtube_older = false;
	config.youtube_privacy = false;
	//font
	config.font_names = '굴림;궁서;돋움;맑은 고딕;바탕;' + CKEDITOR.config.font_names;
	config.font_defaultLabel = '굴림';
	config.fontSize_defaultLabel = '12px';
	config.fontSize_sizes = '8/8px;9/9px;10/10px;11/11px;12/12px;14/14px;16/16px;18/18px;20/20px;22/22px;24/24px;26/26px;28/28px;36/36px;48/48px;';
	//image
	
	//locationMap
};
