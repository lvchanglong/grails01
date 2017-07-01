<!doctype html>
<html lang="zh-CN" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="lvchanglong"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/messenger/1.5.0/css/messenger.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/messenger/1.5.0/css/messenger-theme-future.min.css" rel="stylesheet">
    <asset:stylesheet src="application.css"/>

    <script type="text/javascript" src="http://player.youku.com/jsapi"></script>

    <g:layoutHead/>
</head>
<body>

    <g:pageProperty name="page.header" default="${render(template: "/layouts/header")}"/>
    <g:layoutBody/>
    <g:pageProperty name="page.footer" default="${render(template: "/layouts/footer")}"/>

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>
    <script src="https://cdn.bootcss.com/jquery.form/3.51/jquery.form.min.js"></script>
    <script src="https://cdn.bootcss.com/messenger/1.5.0/js/messenger.min.js"></script>
    <script src="https://cdn.bootcss.com/messenger/1.5.0/js/messenger-theme-future.min.js"></script>

</body>
</html>
