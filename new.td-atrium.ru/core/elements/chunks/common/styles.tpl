{$_modx->runSnippet('MinifyX',[
        'minifyCss' => 1,
	'minifyJs' => 0,
	'registerCss' =>'default',
	'cssSources' => '
		/assets/templates/bootstrap-theme.min.css,
		/assets/templates/jquery.bxslider/jquery.bxslider.css,
		/assets/templates/style.css,
		/assets/templates/media.css,
		/assets/templates/css/jquery-ui.min.css'
])}
<link rel="stylesheet" href="/assets/templates/bootstrap.min.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">