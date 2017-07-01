<%@ page import="lvchanglong.User" %>

<g:set var="master" value="${lvchanglong.User.get(session.uid)}"/>

<div class="navbar-wrapper" style="z-index: 9999;">
    <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="${createLink(controller:"service", action:"index")}">吕常龙</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li>
                            <g:form controller="service" action="index" method="GET" style="margin-top:12px;">
                                <g:textField name="q" value="${params.q}" placeholder="请输入关键字"/>
                                <g:submitButton name="submit" value="检索"/>
                            </g:form>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <g:if test="${master}">
                            <li>
                                <g:render template="/layouts/demos/userEdit"/>
                            </li>
                            <li>
                                <g:render template="/layouts/demos/userCreate"/>
                            </li>
                            <li>
                                <a href="#" onclick="jQuery.post('${createLink(controller: 'service', action: 'logout')}', function(){window.location.reload();});">
                                    退出
                                </a>
                            </li>
                        </g:if>
                        <g:else>
                            <li>
                                <g:render template="/layouts/demos/login"/>
                            </li>
                        </g:else>
                    </ul>
                </div>
            </div>
        </nav>

    </div>
</div>