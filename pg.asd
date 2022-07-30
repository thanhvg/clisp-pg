(defsystem "pg"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on (#:hunchentoot #:cl-who)
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "pg/tests"))))

(defsystem "pg/tests"
  :author ""
  :license ""
  :depends-on ("pg"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for pg"
  :perform (test-op (op c) (symbol-call :rove :run c)))
