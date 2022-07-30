(defpackage pg
  (:use :cl :cl-who :hunchentoot))
(in-package :pg)

(defvar *h* (make-instance 'easy-acceptor :port 3000))

(define-easy-handler (my-greetings :uri "/hello") (name)
  (setf (hunchentoot:content-type*) "text/html")
  (with-html-output-to-string (*standard-output* nil :prologue t)
    (:html
     (:head (:title "Hunchentoot Hello"))
     (:body
      (:h1 "Form:")
      (:form
       :method :post
       (:input :type :text
               :name "name"
               :value name)
       (:input :type :submit :value "Submit your nanme"))
      (:p "Hello " (str name))))))

(hunchentoot:start *h*)
;; (hunchentoot:stop *h*)
