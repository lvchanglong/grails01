<!doctype html>
<html>
<head>
    <meta name="layout" content="lvchanglong"/>
    <asset:stylesheet src="carousel.css"/>
</head>
<body>

    <div class="container marketing" style="margin-top:30px;">
        <div class="row">
            <div class="col-lg-12">
                <div style="min-height:500px;padding:5px;border:1px solid gray;">
                    <g:img uri="${createLink(controller:"service", action: "getCover", id:element.id)}"  class="img-thumbnail" width="140" height="140"/>
                    <h2>${element.title}</h2>
                    <p>${element.content}</p>
                </div>
            </div>
        </div>
        <hr class="featurette-divider">
    </div>

    <content tag="header">

    </content>

</body>
</html>
