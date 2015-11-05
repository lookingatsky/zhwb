	{{ stylesheet_link('css/bootstrap/bootstrap.css') }}
	{{ stylesheet_link('css/bootstrap/bootstrap-responsive.css') }}
	{{ stylesheet_link('css/bootstrap/style.css') }}	

	{{ javascript_include('js/bootstrap/jquery.min.js') }}
	{{ javascript_include('js/bootstrap/bootstrap.js') }}
	{{ javascript_include('js/bootstrap/utils.js') }}	
	
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="brand" href="/index">万邦家族财富</a>
            {{ elements.getMenu() }}
        </div>
    </div>
</div>

<div class="container">
    {{ content() }}
    <hr>
    <footer>
        <p>&copy; Company 2012</p>
    </footer>
</div>
