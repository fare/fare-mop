;;; -*- Mode: Lisp ; Base: 10 ; Syntax: ANSI-Common-Lisp -*-

#+xcvb (module nil)

(defpackage #:fare-mop
  (:use #:fare-utils #:uiop #:closer-common-lisp)
  (:export
   #:simple-print-object
   #:simple-print-object-mixin
   #:slots-to-print
   #:collect-slots
   #:remake-object
   ))
