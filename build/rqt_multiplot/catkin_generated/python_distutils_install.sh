#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/skpro19/catkin_ws/src/rqt_multiplot_plugin"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/skpro19/catkin_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/skpro19/catkin_ws/install/lib/python2.7/dist-packages:/home/skpro19/catkin_ws/build/rqt_multiplot/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/skpro19/catkin_ws/build/rqt_multiplot" \
    "/usr/bin/python2" \
    "/home/skpro19/catkin_ws/src/rqt_multiplot_plugin/setup.py" \
    egg_info --egg-base /home/skpro19/catkin_ws/build/rqt_multiplot \
    build --build-base "/home/skpro19/catkin_ws/build/rqt_multiplot" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/skpro19/catkin_ws/install" --install-scripts="/home/skpro19/catkin_ws/install/bin"
