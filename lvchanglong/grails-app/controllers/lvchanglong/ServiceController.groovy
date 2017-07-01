package lvchanglong

import static org.springframework.http.HttpStatus.*

class ServiceController {

    def index(String q, Integer max) {
        def trimText = q?q.trim():"" //检索内容去除前后空格
        params.max = Math.min(max?:3, 100)//max值默认是3，最大为100
        def slides = Element.findAllByType("巨幕")
        def query = Element.where {
            type == "简介" && ((title ==~ "%${trimText}%") || (content ==~ "%${trimText}%"))
        }
        def infos = query.list(params) //params.offset params.max
        def infoCount = query.count()
        [slides: slides, infos: infos, infoCount:infoCount]
    }

    /**
     * 查看详情
     * @param id
     * @return
     */
    def show(String id) {
        def element = Element.get(id)
        [element:element]
    }

    /**
     * 用户登录
     * @param username
     * @param password
     * @return
     */
    def login(String username, String password) {
        if(username && password) {
            def user = User.findByUsernameAndPassword(username, password)
            if(user) {
                session.uid = user.id
                session.setMaxInactiveInterval(43200) //登录失效时间12小时
                render status: OK, text: '登录成功，初始化...'
            } else {
                render status: UNAUTHORIZED, text: '认证失败'
            }
            return
        }
        render status: BAD_REQUEST, text: '参数异常'
    }

    /**
     * 退出登录
     * @return
     */
    def logout() {
        session.invalidate()
        render status: OK, text: '操作成功'
    }

    /**
     * 获取封面图片
     * @param id
     * @return
     */
    def getCover(String id) {
        try {
            def cover = Cover.get(id)
            def out = response.getOutputStream()
            out << cover.bytes
            out.flush()
            out.close()
        } catch (Exception e) {

        }
    }

}
