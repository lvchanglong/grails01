package lvchanglong

/**
 * 素材
 */
class Element {

    static belongsTo = [user: User]
    static hasOne = [cover: Cover]

    String title //标题
    String type //类型
    String summary //摘要
    String content //内容

    static constraints = {
        title(nullable: false, blank: false)
        type(nullable: true, blank: true)
        summary(nullable: true, blank: true)
        content(nullable: true, blank: true)
        cover(nullable: true, blank: true)
    }

    static mapping = {
        table "element"

        id column: "id"
        title column: "title"
        type column: "type"
        summary column: "summary", sqlType: "text"
        content column: "content", sqlType: "text"
        user column: "user_id"

        sort id: "desc" //asc
    }

    String toString() {
        return title
    }

}
