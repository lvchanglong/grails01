<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'element.label', default: 'Element')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-element" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/admin')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="list-element" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>
                        <th>标题</th>
                        <th>类型</th>
                        <th>摘要</th>
                        <th>封面</th>
                        <th>作者</th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${elementList}" var="element">
                        <tr>
                            <td><g:link controller="element" action="show" id="${element.id}">${element.title}</g:link></td>
                            <td>${element.type}</td>
                            <td>${element.summary}</td>
                            <td><g:img uri="${createLink(controller:"service", action: "getCover", id:element.id)}" style="width:50px;height:50px;"/></td>
                            <td>${element.user}</td>
                        </tr>
                    </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${elementCount ?: 0}" />
            </div>
        </div>
    </body>
</html>