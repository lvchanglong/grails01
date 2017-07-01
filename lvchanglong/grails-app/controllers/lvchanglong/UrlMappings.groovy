package lvchanglong

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "service", action: "index")
        "/admin"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
