#include <cstdlib>
#include <iostream>
#include <algorithm>

#include <X11/extensions/Xinerama.h>
#include <X11/extensions/XTest.h>

using std::cout;
using std::endl;

int main(int argc, char *argv[]) {
  bool success=false;
  Display *d=XOpenDisplay(NULL);
  if (d) {
    int dummy1, dummy2, dummy3;
    if (XineramaQueryExtension(d, &dummy1, &dummy2)) {
      if (XineramaIsActive(d)) {
        int heads=0;
        XineramaScreenInfo *p=XineramaQueryScreens(d, &heads);
        if (heads>0) {
          if (XQueryExtension(d,XTestExtensionName,&dummy1,&dummy2,&dummy3)) {
            int root_x, root_y;
            int previous_x, previous_y;
            int win_x, win_y;
            unsigned int mask;
            Window root, child;
            XQueryPointer(d, RootWindow(d, 0),&root,&child,&root_x,&root_y,
                          &win_x,&win_y,&mask);
            for (int x=0; x<heads; ++x) {
//              cout << "Head " << x+1 << " of " << heads << ": " <<
//                p[x].width << "x" << p[x].height << " at " <<
//                p[x].x_org << "," << p[x].y_org << endl;
//                xlist[x]=p[x].x_org;
              if ( win_x >= p[x].x_org &&
                   win_x < p[x].x_org+p[x].width &&
                   win_y >= p[x].y_org &&
                   win_y < p[x].y_org+p[x].height ) {
                cout << p[x].width << "x" << p[x].height << endl;
                break;
              }
            }
            success=true;
          } else cout << "XTEST extension not available" << endl;
        } else cout << "XineramaQueryScreens says there aren't any" << endl;
        XFree(p);
      } else cout << "Xinerama not active" << endl;
    } else cout << "No Xinerama extension" << endl;
    
    XCloseDisplay(d);
  } else cout << "Can't open display" << endl;

  return (success ? EXIT_SUCCESS : EXIT_FAILURE);
}

