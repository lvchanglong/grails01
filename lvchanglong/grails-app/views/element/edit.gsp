<%@ page import="lvchanglong.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'element.label', default: 'Element')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-element" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
        <div id="edit-element" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.element}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.element}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:uploadForm action="update" id="${element.id}">
                <g:hiddenField name="version" value="${this.element?.version}" />
                <fieldset class="form">
                    <div class="fieldcontain required">
                        <label for="title">标题
                            <span class="required-indicator">*</span>
                        </label><input type="text" name="title" value="${this.element.title}" required="" id="title">
                    </div>
                    <div class="fieldcontain">
                        <label for="type">类型</label><g:select from="${["巨幕", "简介"]}" name="type" value="${this.element.type}"/>
                    </div>
                    <div class="fieldcontain">
                        <label for="summary">摘要</label><g:textArea name="summary" value="${this.element.summary}"/>
                    </div>
                    <div class="fieldcontain">
                        <label for="content">内容</label><g:textArea name="content" value="${this.element.content}"/>
                    </div>
                    <div class="fieldcontain">
                        <label for="cover">原封
                            <span class="required-indicator">*</span>
                        </label><g:img uri="${createLink(controller:"service", action: "getCover", id:element.id)}" style="width:50px;height:50px;"/>
                    </div>
                    <div class="fieldcontain">
                        <label for="cover">新封
                            <span class="required-indicator">*</span>
                        </label><input type="file" name="bytes" id="cover" style="display:inline-block;"/>
                    </div>
                    <div class="fieldcontain required">
                        <label for="user">作者
                            <span class="required-indicator">*</span>
                        </label>
                        <g:select from="${lvchanglong.User.list()}" name="user" optionKey="id" optionValue="username" value="${element.user?.id}"/>
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:uploadForm>
        </div>
    </body>
</html>
