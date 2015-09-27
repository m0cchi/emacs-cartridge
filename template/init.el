(defun handler (con)
  (elnode-http-start con 200 '("Content-Type" . "text/html"))
  (elnode-http-return con
                      (print 
"<html>
  <head>
    <title>emacs-cartridge</title>
  </head>
  <body>Hello, emacs-cartridge</body>
</html")))

(elnode-start 'handler :port +PORT+ :host +HOST+)
