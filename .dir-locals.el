;; Set some emacs options to follow the mongo style: http://www.mongodb.org/about/contributors/kernel-code-style/
;; You should also install google-c-style (available in the ELPA or from http://google-styleguide.googlecode.com/svn/trunk/google-c-style.el)
(
 (nil . ((c-file-style . "Google")
         (c-basic-offset . 4)
         (indent-tabs-mode . nil)
         (fill-column . 100)))
 (c-mode . ((eval . (setq ac-clang-flags
                          (let* ((cppdefs  '(("_SCONS"                        . "1")
                                             ("MONGO_EXPOSE_MACROS"           . "1")
                                             ("SUPPORT_UTF8"                  . "1")
                                             ("_FILE_OFFSET_BITS"             . "64")
                                             ("_DEBUG"                        . "1")
                                             ("BOOST_ALL_NO_LIB"              . "1")
                                             ("MONGO_HAVE_HEADER_UNISTD_H"    . "1")
                                             ("MONGO_HAVE_EXECINFO_BACKTRACE" . "1")
                                             ))
                                 (project-root (expand-file-name (locate-dominating-file buffer-file-name ".dir-locals.el")))
                                 (includes '("/"
                                             "/mongo"
                                             "/third_party/pcre-8.30"
                                             "/third_party/boost"
                                             ))
                                 (cflags   '("-pthread"
                                             "-Wall"
                                             "-Wsign-compare"
                                             "-Wno-unknown-pragmas"
                                             "-Winvalid-pch"
                                             "-Werror"
                                             ))
                                 (cxxflags '("-Wnon-virtual-dtor"
                                             "-Woverloaded-virtual"
                                             ))
                                 (cppflags (append (mapcar (lambda (x)
                                                             (concat "-D" (car x) "=" (cdr x)))
                                                           cppdefs)
                                                   (mapcar (lambda (x)
                                                             (concat "-I" project-root "src" x))
                                                           includes))))
                            (append cppflags cflags))))))
 (c++-mode . ((eval . (setq ac-clang-flags
                            (let* ((cppdefs  '(("_SCONS"                        . "1")
                                               ("MONGO_EXPOSE_MACROS"           . "1")
                                               ("SUPPORT_UTF8"                  . "1")
                                               ("_FILE_OFFSET_BITS"             . "64")
                                               ("_DEBUG"                        . "1")
                                               ("BOOST_ALL_NO_LIB"              . "1")
                                               ("MONGO_HAVE_HEADER_UNISTD_H"    . "1")
                                               ("MONGO_HAVE_EXECINFO_BACKTRACE" . "1")
                                               ))
                                   (project-root (expand-file-name (locate-dominating-file buffer-file-name ".dir-locals.el")))
                                   (includes '("/"
                                               "/mongo"
                                               "/third_party/pcre-8.30"
                                               "/third_party/boost"
                                               ))
                                   (cflags   '("-pthread"
                                               "-Wall"
                                               "-Wsign-compare"
                                               "-Wno-unknown-pragmas"
                                               "-Winvalid-pch"
                                               "-Werror"
                                               ))
                                   (cxxflags '("-Wnon-virtual-dtor"
                                               "-Woverloaded-virtual"
                                               ))
                                   (cppflags (append (mapcar (lambda (x)
                                                               (concat "-D" (car x) "=" (cdr x)))
                                                             cppdefs)
                                                     (mapcar (lambda (x)
                                                               (concat "-I" project-root "src" x))
                                                             includes))))
                              (append cppflags cflags cxxflags)))))))
