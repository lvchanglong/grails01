package lvchanglong

class BootStrap {

    def init = { servletContext ->
        User.init()
    }
    def destroy = {
    }
}
