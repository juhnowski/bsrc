#include <string.h>
#include <stdio.h>
#include <gst/gst.h>

#include <gst/rtsp-server/rtsp-server.h>

#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>

#include <stdlib.h>
#include <glib-object.h>
#include <json-glib/json-glib.h>

int tarantool_port = 5557;

JsonParser *tarantool_gstserver_query(char *request);

int main(int argc, char* argv[])
{
	
	FILE *fo;
	const int sizeStr = 16;
	const char *filename = "regconfig";
	fo = fopen(filename, "rb");
	char str[sizeStr][20];
	int i = 0;
	int len = 0;
	while( !feof(fo) && (i < sizeStr) )
	{
		fgets(str[i], 20, fo);
		if( strlen(str[i]) < 2  )
		{
			break;
		}
		len = strlen(str[i]) - 1;
		str[i][len] = '\0';
		//printf(" str[%d][0] = %d %s\n", i, str[i][0], str[i]);
		i++;
	}
	int cnt = i;
	//gchar *request = g_strdup_printf("{\"cmd\":\"getport\",\"stream\":\"%s\"}", argv[2]);
	int j = 0;
	for(;j < cnt; j++)
	{
		//gchar *request = g_strdup_printf("{\"cmd\":\"getport\",\"stream\":\"%s\"}", "/0060003D6B/1/main");
		gchar *request = g_strdup_printf("{\"cmd\":\"setport\",\"stream\":\"%s\",\"port\":\"%d\"}", str[j],9000+j*2);
                printf("<boris---> %s\n",request);
		JsonParser *response =  tarantool_gstserver_query(request);
	}
}

JsonParser *tarantool_gstserver_query(char *request)
{
  int sock;
  struct sockaddr_in addr;
  char response[1024];

  JsonParser *parser;
  GError *error;

  sock = socket(AF_INET, SOCK_STREAM, 0);
  if (sock < 0) {
    GST_ERROR("Create socket error");
    return 0;
  }

  addr.sin_family = AF_INET;
  addr.sin_port = htons(tarantool_port);
  addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);

  if(connect(sock, (struct sockaddr *)&addr, sizeof(addr)) < 0)
  {
    GST_ERROR("Tarantool connect error");
    return 0;
  }

  g_print("SEND: %s\n",request);

  int len = send(sock, request, strlen(request)+1, 0);
  g_print("Sended: %d\n", len);
  len = recv(sock, response, 1024, 0);
  g_print("Received: %d\n", len);

  close(sock);

  g_print("RECEIVED: %s\n",response);

  parser = json_parser_new ();
  error = NULL;
  json_parser_load_from_data (parser, response, strlen(response), &error);
  if (error)
    {
      g_print ("Unable to parse `%s': %s\n", response, error->message);
      g_error_free (error);
      g_object_unref (parser);
      return 0;
    }

  return parser;
}
