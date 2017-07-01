<!doctype html>
<html>
<head>
    <meta name="layout" content="lvchanglong"/>
    <asset:stylesheet src="carousel.css"/>
    <style>
        .pagination {
            border-top: 0;
            margin: 0.8em 1em 0.3em;
            padding: 0.3em 0.2em;
            text-align: center;
            -moz-box-shadow: 0 0 3px 1px #AAAAAA;
            -webkit-box-shadow: 0 0 3px 1px #AAAAAA;
            box-shadow: 0 0 3px 1px #AAAAAA;
            background-color: #EFEFEF;
        }

        .pagination a,
        .pagination .currentStep {
            color: #666666;
            display: inline-block;
            margin: 0 0.1em;
            padding: 0.25em 0.7em;
            text-decoration: none;
            -moz-border-radius: 0.3em;
            -webkit-border-radius: 0.3em;
            border-radius: 0.3em;
        }

        .pagination a:hover, .pagination a:focus,
        .pagination .currentStep {
            background-color: #999999;
            color: #ffffff;
            outline: none;
            text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.8);
        }

        .no-borderradius .pagination a:hover, .no-borderradius .pagination a:focus,
        .no-borderradius .pagination .currentStep {
            background-color: transparent;
            color: #444444;
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <g:if test="${slides}">
                <g:each in="${slides}" status="i" var="slide">
                    <li data-target="#myCarousel" data-slide-to="${i}" class="${i==0?"active":""}"></li>
                </g:each>
            </g:if>
            <g:else>
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </g:else>
        </ol>
        <div class="carousel-inner" role="listbox">
            <g:if test="${slides}">
                <g:each in="${slides}" status="i" var="slide">
                    <div class="item ${i==0?"active":""}">
                        <g:img uri="${createLink(controller:"service", action: "getCover", id:slide.id)}"/>
                        <div class="container">
                            <div class="carousel-caption">
                                <h1>${slide.title}</h1>
                                <p>${slide.summary}</p>
                                <p><a class="btn btn-lg btn-primary" href="${createLink(controller: "service", action: "show", id: slide.id)}" target="_blank" role="button">给我更多</a></p>
                            </div>
                        </div>
                    </div>
                </g:each>
            </g:if>
            <g:else>
                <div class="item active">
                    <img class="first-slide" src="${assetPath(src:"angry/1.jpg")}" alt="First slide">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>《愤怒的小鸟》动画版</h1>
                            <p>益智动作射击游戏《愤怒的小鸟》动画版，为了报复偷走鸟蛋的肥猪们，鸟儿以自己的身体为武器，仿佛炮弹一样去攻击肥猪们的堡垒。</p>
                            <p><a class="btn btn-lg btn-primary" href="#" role="button">给我更多</a></p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img class="second-slide" src="${assetPath(src:"angry/2.jpg")}" alt="Second slide">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>《愤怒的小鸟：星战版》</h1>
                            <p>将以著名科幻电影《星球大战》为背景，比如死星、猛犸机械人都会成为游戏场景。各种小鸟和捣蛋猪都能与电影中的角色对上号，黑武士造型的小猪相当搞怪。</p>
                            <p><a class="btn btn-lg btn-primary" href="#" role="button">给我更多</a></p>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img class="third-slide" src="${assetPath(src:"angry/3.jpg")}" alt="Third slide">
                    <div class="container">
                        <div class="carousel-caption">
                            <h1>《愤怒的小鸟》电影版</h1>
                            <p>一群不会飞的小鸟，挤在一座热带小岛上，和睦宁静。游戏中的几个经典形象成了影片的主角，分别是易怒的胖红（杰森·苏戴奇斯 Jason Sudeikis 配音），飞镖黄（乔什·加德 Josh Gad 配音）和炸弹黑（丹尼·麦克布耐德 Danny McBride 配音） 。当神秘的绿猪莱纳德（比尔·哈德尔 Bill Hader 配音）登陆岛屿时，小鸟们平静的生活被打破了。</p>
                            <p><a class="btn btn-lg btn-primary" href="#" role="button">给我更多</a></p>
                        </div>
                    </div>
                </div>
            </g:else>
        </div>
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div><!-- /.carousel -->

    <!-- Marketing messaging and featurettes
        ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

        <!-- Three columns of text below the carousel -->
        <div class="row">
            <g:if test="${infos}">
                <g:each in="${infos}" status="i" var="info">
                    <div class="col-lg-4">
                        <div style="min-height:500px;padding:5px;border:1px solid gray;">
                            <g:img uri="${createLink(controller:"service", action: "getCover", id:info.id)}"  class="img-circle" width="140" height="140"/>
                            <h2>${info.title}</h2>
                            <p>${info.summary}</p>
                            <p><a class="btn btn-default" href="${createLink(controller: "service", action: "show", id: info.id)}" target="_blank" role="button">查看详情 &raquo;</a></p>
                        </div>
                    </div><!-- /.col-lg-4 -->
                </g:each>
                <div class="col-lg-12">
                    <div class="pagination" style="margin:0 auto;display:block;">
                        <g:paginate total="${infoCount ?: 0}" params="[q:params.q]"/>
                    </div>
                </div>
            </g:if>
            <g:else>
                <div class="col-lg-4">
                    <img class="img-circle" src="${assetPath(src:"angry/11.png")}" alt="Generic placeholder image" width="140" height="140">
                    <h2>怒鸟红</h2>
                    <p>勇敢、正直的鸟，遇到好奇的事情，就喜欢找小伙伴来看，愤怒的时候激发潜能，变得很不科学。</p>
                    <p><a class="btn btn-default" href="#" role="button">查看详情 &raquo;</a></p>
                </div><!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <img class="img-circle" src="${assetPath(src:"angry/12.png")}" alt="Generic placeholder image" width="140" height="140">
                    <h2>飞镖黄</h2>
                    <p>体育很好，速度很快，也比较乐观。</p>
                    <p><a class="btn btn-default" href="#" role="button">查看详情 &raquo;</a></p>
                </div><!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <img class="img-circle" src="${assetPath(src:"angry/13.png")}" alt="Generic placeholder image" width="140" height="140">
                    <h2>炸弹黑</h2>
                    <p>爱吃冰激凌，生气时很容易爆炸，每次都被认为是拿回鸟蛋的勇士，尽管拿回鸟蛋的是飞镖黄。</p>
                    <p><a class="btn btn-default" href="#" role="button">查看详情 &raquo;</a></p>
                </div><!-- /.col-lg-4 -->
            </g:else>
        </div><!-- /.row -->

        <hr class="featurette-divider">

    </div><!-- /.container -->

</body>
</html>
