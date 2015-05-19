package com.library.controller

import com.library.domain.Borrower
import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BorrowerController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Borrower.list(params), model:[borrowerInstanceCount: Borrower.count()]
    }

    def show(Borrower borrowerInstance) {
        respond borrowerInstance
    }

    def create() {
        respond new Borrower(params)
    }

    @Transactional
    def save(Borrower borrowerInstance) {
        if (borrowerInstance == null) {
            notFound()
            return
        }

        if (borrowerInstance.hasErrors()) {
            respond borrowerInstance.errors, view:'create'
            return
        }

        borrowerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'borrower.label', default: 'Borrower'), borrowerInstance.id])
                redirect borrowerInstance
            }
            '*' { respond borrowerInstance, [status: CREATED] }
        }
    }

    def edit(Borrower borrowerInstance) {
        respond borrowerInstance
    }

    @Transactional
    def update(Borrower borrowerInstance) {
        if (borrowerInstance == null) {
            notFound()
            return
        }

        if (borrowerInstance.hasErrors()) {
            respond borrowerInstance.errors, view:'edit'
            return
        }

        borrowerInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Borrower.label', default: 'Borrower'), borrowerInstance.id])
                redirect borrowerInstance
            }
            '*'{ respond borrowerInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Borrower borrowerInstance) {

        if (borrowerInstance == null) {
            notFound()
            return
        }

        borrowerInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Borrower.label', default: 'Borrower'), borrowerInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'borrower.label', default: 'Borrower'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def getBorrowers(){
        def borrowersList = [borrower : Borrower.list()]
        render(borrowersList as JSON)
    }
}
