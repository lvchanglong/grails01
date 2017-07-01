package lvchanglong

/**
 * 封面
 */
class Cover {

    static belongsTo = [element: Element]

    byte[] bytes //二进制数据

    static constraints = {
        bytes(nullable: true, blank: true)
    }

    static mapping = {
        table "cover"

        id column: "id"
        bytes column: "bytes", sqlType: "longblob"

        element column: "element_id"
    }

}
