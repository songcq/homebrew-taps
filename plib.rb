require "formula"

class Plib < Formula
  homepage "http://plib.sourceforge.net/index.html"
  url "http://plib.sourceforge.net/dist/plib-1.8.5.tar.gz"
  sha1 "c2cf7e3e1e58f7b63dae4bb21e4fa82c3e4d4cfc"

  patch :p1, :DATA

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--disable-sl",
                          "--disable-pw",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "false"
  end
end

__END__
diff --git a/src/pui/puGLUT.h b/src/pui/puGLUT.h
index bd564a0..980035f 100644
--- a/src/pui/puGLUT.h
+++ b/src/pui/puGLUT.h
@@ -32,6 +32,7 @@

 #ifdef UL_MAC_OSX
 # include <GLUT/glut.h>
+# define APIENTRY
 #else
 # ifdef FREEGLUT_IS_PRESENT /* for FreeGLUT like PLIB 1.6.1*/
 #  include <GL/freeglut.h>
 diff --git a/src/ssg/ssgLoadFLT.cxx b/src/ssg/ssgLoadFLT.cxx
index 6990e25..6f9d4d2 100644
--- a/src/ssg/ssgLoadFLT.cxx
+++ b/src/ssg/ssgLoadFLT.cxx
@@ -142,7 +142,7 @@

 typedef unsigned char ubyte;

-#ifdef UL_WIN32
+#if defined(UL_WIN32) || defined(__APPLE__)
 typedef unsigned short ushort;
 typedef unsigned int uint;
 #endif
