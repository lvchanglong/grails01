package lvchanglong

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ElementController {

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Element.list(params), model:[elementCount: Element.count()]
    }

    def show(Element element) {
        respond element
    }

    def create() {
        respond new Element(params)
    }

    @Transactional
    def save(Element element) {
        if (element == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        Cover cover = new Cover(params)
        element.cover = cover //封面

        if (element.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond element.errors, view:'create'
            return
        }

        element.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'element.label', default: 'Element'), element.id])
                redirect element
            }
            '*' { respond element, [status: CREATED] }
        }
    }

    def edit(Element element) {
        respond element
    }

    @Transactional
    def update(Element element) {
        if (element == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if(!params.bytes.isEmpty()) { //如果图片不为空，修改图片
            element.cover.properties = params
        }

        if (element.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond element.errors, view:'edit'
            return
        }

        element.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'element.label', default: 'Element'), element.id])
                redirect element
            }
            '*'{ respond element, [status: OK] }
        }
    }

    @Transactional
    def delete(Element element) {

        if (element == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        element.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'element.label', default: 'Element'), element.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'element.label', default: 'Element'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
