;;; -*- Mode: Lisp ; Base: 10 ; Syntax: ANSI-Common-Lisp -*-

(defsystem :fare-mop
  :description "Utilities using the MOP; notably make informative pretty-printing trivial"
  :long-description "fare-mop is a small collection of utilities using the MOP.
It notably contains a method SIMPLE-PRINT-OBJECT, and
a mixin SIMPLE-PRINT-OBJECT-MIXIN that allow you to trivially define
PRINT-OBJECT methods that print the interesting slots in your objects,
which is great for REPL interaction and debugging."
  :depends-on (:fare-utils :closer-mop)
  :components
  ((:file "package")
   (:file "utilities" :depends-on ("package"))))
