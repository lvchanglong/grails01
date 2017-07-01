<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'element.label', default: 'Element')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-element" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="show-element" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <ol class="property-list element">

                <li class="fieldcontain">
                    <span id="title-label" class="property-label">标题</span>
                    <div class="property-value" aria-labelledby="title-label">${element.title}</div>
                </li>

                <li class="fieldcontain">
                    <span id="type-label" class="property-label">类型</span>
                    <div class="property-value" aria-labelledby="type-label">${element.type}</div>
                </li>

                <li class="fieldcontain">
                    <span id="summary-label" class="property-label">摘要</span>
                    <div class="property-value" aria-labelledby="summary-label">${element.summary}</div>
                </li>

                <li class="fieldcontain">
                    <span id="content-label" class="property-label">内容</span>
                    <div class="property-value" aria-labelledby="content-label">${element.content}</div>
                </li>

                <li class="fieldcontain">
                    <span id="cover-label" class="property-label">封面</span>
                    <div class="property-value" aria-labelledby="cover-label"><g:img uri="${createLink(controller:"service", action: "getCover", id:element.id)}" style="width:50px;height:50px;"/></div>
                </li>

                <li class="fieldcontain">
                    <span id="user-label" class="property-label">作者</span>
                    <div class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${element.user.id}">${element.user}</g:link></div>
                </li>

            </ol>
            <g:form resource="${this.element}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.element}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
