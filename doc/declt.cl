;;; declt.cl --- Declt availability checking script

;; Copyright (C) 2011, 2015 Didier Verna

;; Author: Didier Verna <didier@didierverna.net>

;; This file is part of Clon.

;; Permission to use, copy, modify, and distribute this software for any
;; purpose with or without fee is hereby granted, provided that the above
;; copyright notice and this permission notice appear in all copies.

;; THIS SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
;; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
;; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
;; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
;; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
;; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
;; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.


;;; Commentary:

;; Contents management by FCM version 0.1.


;;; Code:

(require "asdf")

(with-open-file (stream "declt.inc" :direction :output :if-exists :supersede)
  (princ "TEXI_REF :=" stream)
  (handler-case
      (progn (asdf:load-system :com.dvlsoft.declt)
	     (princ " reference.texi" stream))
  (asdf:missing-component ()
    (format *error-output* "~
*********************************************************************
* WARNING: ASDF component COM.DVLSOFT.DECLT not found.              *
* The Clon reference manual will not be generated.                  *
*********************************************************************")))
  (terpri stream))

(uiop:quit)


;;; declt.cl ends here
