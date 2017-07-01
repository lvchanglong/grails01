package lvchanglong

class User {

    static hasMany = [elements: Element]

    String username //账号
    String password //密码
    String realname = "匿名" //昵称
    String role = "普通用户" //角色
    Date dateCreated //创建时间
    Date lastUpdated //更新时间

    static constraints = {
        username(nullable: false, blank: false, unique: true)
        password(nullable: false, blank: false)
        realname(nullable: true, blank: true)
        role(nullable: false, blank: false, inList: ["普通用户", "管理员"])
        elements(nullable: true, blank: true)
    }

    static mapping = {
        table "user"

        id column: "id"
        username column: "username"
        password column: "password"
        realname column: "realname"
        role column: "role"
        dateCreated column: "dateCreated"
        lastUpdated column: "lastUpdated"

        sort id: "desc" //asc
    }

    static void init() {
        def instance = User.first()
        if(!instance) {
            instance = new User([username:"admin", password:"123456", realname:"吕常龙", role:"管理员"])
            instance.save(flush: true) //instance.save flush: true
        }
    }

    String toString() {
        return username
    }

}
