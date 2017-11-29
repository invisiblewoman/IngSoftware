if(lang == 'ES'){
	var Url_error = "Debes indicar la url o seleccionar el fichero";
	var Both_error = "Puedes introducir una URL o seleccionar un fichero, pero no los dos";
	var Upload_error = "Se ha producido un error al subir la imagen. Compruebe el formato y tamaño";
	var Select_error = "Tiene que seleccionar una imagen ántes de ver la previsualización";
	var Ico_error = "Se ha producido un error al generar el favicon";
	var Ico_download_text = "Descargar Favicon";
	var Img_download_text = "Descargar: ";
	var Gen_favicon_text = "Generando favicon.ico...";
	var Download_image_text = "Descargando Imagen...";
}else if(lang == 'PT'){
	var Url_error = "Deve indicar o endereço ou selecionar o arquivo";
	var Both_error = "Pode introduzir o endereço ou selecionar o arquivo, mas não os dois";
	var Upload_error = "Erro ao subir a imagem. Verifique o formato e tamanho";
	var Select_error = "Tem que selecionar uma imagem antes de previsualizar";
	var Ico_error = "Erro ao gerar o favicon";
	var Ico_download_text = "Baixar favicon";
	var Img_download_text = "Baixar: ";
	var Gen_favicon_text = "Gerando favicon.ico...";
	var Download_image_text = "Baixando imagem...";
}else{
	var Url_error = "You have to enter a URL or select your image";
	var Both_error = "You can enter a URL o select a file, but not both";
	var Upload_error = "An error occurred while uploading the image. Check the format and size";
	var Select_error = "You have to select an image before preview";
	var Ico_error = "An error occurred while generating favicon";
	var Ico_download_text = "Download Favicon";
	var Img_download_text = "Download: ";
	var Gen_favicon_text = "Generating favicon.ico...";
	var Download_image_text = "Downloading Image...";
}


var uploadOK = false;
var imagename = '';

$(document).ready( function() {
	showDefaultImage();
	// Resizable region
	$('#area').Resizable( {
		ratio: 1,
		minWidth: 16,
		minHeight: 16,
		maxWidth: 300,
		maxHeight: 300,
		minTop: 94,
		minLeft: 510,
		maxRight: 510 + 300,
		maxBottom: 94 + 300,
		dragHandle: true,
		handlers: {
			se: '#pointerSE',
			e: '#pointerE',
			ne: '#pointerNE',
			n: '#pointerN',
			nw: '#pointerNW',
			w: '#pointerW',
			sw: '#pointerSW',
			s: '#pointerS'
		},
		onResize: function() {
			$("#area_interior").css( { width: $(this).css('width'), height: $(this).css('height') } );
		}
	});
	
	// Events
	$("#clear_image_button").click( showDefaultImage );
	
	$("A.external_link").click( function() {
		window.open($(this).attr('href'));
		return false;
	});
	
	$("#upload_form").submit( function() {
		// Make sure a URL of file has been specified
		if( $("#file").attr('value') == null && $("#url").attr('value') == null ) {
			alert(Url_error);
			return false;
		}
		// Make sure a URL AND file haven't been specified
		if( $("#file").attr('value') != null && $("#url").attr('value') != null ) {
			alert(Both_error);
			return false;
		}
		$("#prev_container").css( { backgroundImage: 'url(/images/loading_upload.gif)' } );
	});
	
	// Cancel each other out on change
	$("#file").change( function() { $("#url").attr('value', ''); });
	$("#url").change( function() { $("#file").attr('value', ''); });
	
	// Handle file uploads
	$("#uploadFrame").load( function() {
		var data = window.frames['uploadFrame'].document.body.innerHTML
		if( data != '' ) {
			if(data == 'KO'){
				alert(Upload_error);
				showDefaultImage();
				return false;
			}else{
				$("#prev_container").css( { backgroundImage: 'url(/tmp/' + data + ')' } );
				uploadOK = true;
			}
		} else {
			showDefaultImage();
			// Some kind of error probably occurred
		}
		
	});
	
	// Generate the preview
	$("#preview_form").submit( function() {
		if( uploadOK ) {
			generatePreview();
		} else {
			alert(Select_error);
		}
		return false;
	});
});

function generatePreview() {
	var x = parseInt( $("#area").css('left') ) - 510;
	var y = parseInt( $("#area").css('top') ) - 93;
	var width = parseInt( $("#area").css('width') );
	var height = parseInt( $("#area").css('height') );
	$("#preview_container").css( { background: '#8dd9ef url(/images/loading_orange.gif) 10px center no-repeat' } );

	$("#prev_data").attr('value', x + "," + y + "," + width + "," + height);

	var size_index = 0;
	size_index = document.getElementById("size").selectedIndex;

	$.post("/inc/cut.php?"+Math.round(Math.random()*100000), $("#preview_form").serialize(), function(data) {
		if( data != '' ) {
			if(data == 'KO'){
				$("#preview_container").css( { height: '20px' } );
				alert(Ico_error);
				return false;
			}else{
				if(size_index == 0){
					$("#preview_container").css( { height: '38px' } );
				}else if(size_index == 1){
					$("#preview_container").css( { height: '52px' } );
				}else if(size_index == 2){
					$("#preview_container").css( { height: '68px' } );
				}else if(size_index == 3){
						$("#preview_container").css( { height: '84px' } );
				}else if(size_index == 4){
						$("#preview_container").css( { height: '152px' } );
				}

				imagename = data;

				$("#preview_container").css( { background: '#8dd9ef url(/tmp/' + data + ') center 33px no-repeat' } );
				showDownloadLink();

				$("#ico").html('<img src="/tmp/' + data + ' width="16px" height="16px" />');
			}
		}
	});
}
function generateIcon() {
	$("#preview_container").html(Gen_favicon_text);
	setTimeout( showDownloadLink, 1000);
	location.href='/inc/to_ico.php';
}

function downloadImage() {
	$("#preview_container").html(Download_image_text);
	setTimeout( showDownloadLink, 1000);
	location.href='/inc/download_image.php';
}

function showDownloadLink() {

	if(imagename != ''){
		ruta_desc = imagename.split('.');
		ruta_desc = ruta_desc[ruta_desc.length-1];
		ruta_desc2 = ruta_desc.split('?');
		ext = ruta_desc2[0];
	}else{
		ext = '';
	}


	$("#preview_container").html('<a id="download" href="#">' + Ico_download_text + '</a>&nbsp;&nbsp;&nbsp;<a id="downloadimg" href="#">' + Img_download_text + ext + '</a>');

	$("#preview_container").find('A#download').bind('click', function() { generateIcon(); return false; });
	$("#preview_container").find('A#downloadimg').bind('click', function() { downloadImage(); return false; });

/*	$("#preview_container").html('<a id="download" href="#">' + Ico_download_text + '</a>').find('A#download').bind('click', function() { downloadImage(); return false; });
*/
}

function showDefaultImage() {
	$("#prev_container").css( { backgroundImage: 'url(your_logo.png)' } );
}