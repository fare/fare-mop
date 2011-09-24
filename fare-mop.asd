;;; -*- Mode: Lisp ; Base: 10 ; Syntax: ANSI-Common-Lisp -*-

(asdf:defsystem :fare-mop
  :depends-on (:fare-utils :closer-mop)
  :components
  ((:file "package")
   (:file "utilities" :depends-on ("package"))))
