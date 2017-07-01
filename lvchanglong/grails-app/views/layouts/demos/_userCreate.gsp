<g:set var="demoName" value="userCreate"/>

<!-- Button trigger modal -->
<a href="#" data-toggle="modal" data-target="#${demoName}">
    注册用户
</a>

<!-- Modal -->
<div class="modal fade" id="${demoName}" tabindex="-1" role="dialog" aria-labelledby="${demoName}Label">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <g:form controller="user" action="save" class="ajaxForm">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="${demoName}Label">注册用户</h4>
                </div>
                <div class="modal-body">
                    <g:hiddenField name="format" value="text"/>

                    <label for="inputUsername" class="sr-only">账号</label>
                    <input type="text" id="inputUsername" name="username" class="form-control" placeholder="账号" required autofocus style="margin-bottom: 5px;">
                    <label for="inputPassword" class="sr-only">密码</label>
                    <input type="text" id="inputPassword" name="password" class="form-control" placeholder="密码" required style="margin-bottom: 5px;">
                    <label for="inputRealname" class="sr-only">昵称</label>
                    <input type="text" id="inputRealname" name="realname" class="form-control" placeholder="昵称" required>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
                </div>
            </g:form>
        </div>
    </div>
</div>