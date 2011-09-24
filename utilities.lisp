#+xcvb (module (:depends-on ("package")))

(in-package :fare-mop)

;;; CLOS magic (depends on closer-mop) (from philip-jose)
(defun collect-slots (object &key (slots t))
  (loop :with class = (class-of object)
        :with slots = (if (eq slots t) (compute-slots class) slots)
        :for slot :in slots
        :for name = (slot-definition-name slot)
        :for iarg = (or (first (slot-definition-initargs slot)) name)
        :nconc (when (slot-boundp object name)
                 `(,iarg ,(slot-value object name)))))

(defun simple-print-object (object stream &key identity (slots t))
  (with-output (stream)
    (print-unreadable-object (object stream :type t :identity identity)
      (write (collect-slots object :slots slots) :stream stream))))

(defgeneric slots-to-print (object)
  (:method ((object t))
    t))

(defclass simple-print-object-mixin (standard-object)
  ())

(defmethod print-object ((object simple-print-object-mixin) stream)
  (simple-print-object object stream :slots (slots-to-print object)))

(defun remake-object (object &rest keys &key &allow-other-keys)
  (loop :with class = (class-of object)
        :with slots = (compute-slots class)
        :for slot :in slots
        :for name = (slot-definition-name slot)
        :for initarg = (first (slot-definition-initargs slot))
        :when (and initarg (slot-boundp object name))
        :nconc `(,initarg ,(slot-value object name)) :into old-keys
        :finally (return (apply #'make-instance class (append keys old-keys)))))

