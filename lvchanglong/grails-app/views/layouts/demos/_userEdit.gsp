<%@ page import="lvchanglong.User" %>

<g:set var="demoName" value="userEdit"/>
<g:set var="master" value="${lvchanglong.User.get(session.uid)}"/>

<!-- Button trigger modal -->
<a href="#" data-toggle="modal" data-target="#${demoName}">
    ${master.realname}（${master.username}）
</a>

<!-- Modal -->
<div class="modal fade" id="${demoName}" tabindex="-1" role="dialog" aria-labelledby="${demoName}Label">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <g:form controller="user" action="update" class="ajaxForm">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="${demoName}Label">信息修改</h4>
                </div>
                <div class="modal-body">
                    <g:hiddenField name="_method" value="PUT"/>
                    <g:hiddenField name="format" value="text"/>
                    <g:hiddenField name="id" value="${master.id}"/>

                    <label for="inputRealname" class="sr-only">昵称</label>
                    <input type="text" id="inputRealname" name="realname" value="${master.realname}" class="form-control" placeholder="昵称" required autofocus style="margin-bottom: 5px;">
                    <label for="inputPassword" class="sr-only">密码</label>
                    <input type="text" id="inputPassword" name="password" value="${master.password}" class="form-control" placeholder="密码" required>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-lg btn-primary btn-block" type="submit">保存</button>
                </div>
            </g:form>
        </div>
    </div>
</div>