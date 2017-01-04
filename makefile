#export PKG_CONFIG_PATH=/root/gst-rtsp-server-1.8.0/pkgconfig
#export PKG_CONFIG_PATH=/root/src/gstreamer/gst-rtsp-server/pkgconfig
export PKG_CONFIG_PATH=/home/dmitry/gst-rtsp-server/pkgconfig

#TARGET = rtspdown
#SRCS = rtspdown.c
TARGET = main
SRCS = main.c
OBJS = $(SRCS:.c=.o)

.PHONY: all

all: $(TARGET)

#$(TARGET): $(OBJS)
#	$(CC) -Wall $(OBJS) -o $(TARGET) `pkg-config --cflags --libs gstreamer-1.0 gstreamer-rtsp-server gobject-2.0 json-glib-1.0 glib-2.0 gio-2.0`
#.c.o:
#	$(CC) -c $< -o $@ `pkg-config --cflags --libs gstreamer-1.0 gstreamer-rtsp-server gobject-2.0 json-glib-1.0 glib-2.0 gio-2.0`

$(TARGET): $(OBJS)
	$(CC) -Wall $(OBJS) -o $(TARGET) `pkg-config --cflags --libs json-glib-1.0 glib-2.0 gstreamer-1.0`
.c.o:
	$(CC) -Wall $(OBJS) -o $(TARGET) `pkg-config --cflags --libs json-glib-1.0 glib-2.0 gstreamer-1.0`

