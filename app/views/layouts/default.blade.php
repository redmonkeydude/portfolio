<!doctype html>
<html>
<head>
    <title>{{$title or "default title"}}</title>
</head>
<body>
<div class="container">

    <header class="row">
        @include('includes.header')
    </header>

    <nav class="row">
        @include('includes.nav')
    </nav>


    <div id="main" class="row">

        @yield('content')

    </div>

    <footer class="row">
        @include('includes.footer')
    </footer>

</div>
</body>
</html>