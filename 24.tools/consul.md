### cluster
```
docker run --name consul1 -d -p 8500:8500 -p 8300:8300 -p 8301:8301 -p 8302:8302 -p 8600:8600 consul:latest agent -server -bootstrap-expect 2 -ui -bind=0.0.0.0 -client=0.0.0.0
8500 http �˿ڣ����� http �ӿں� web ui
8300 server rpc �˿ڣ�ͬһ�������� consul server ֮��ͨ���ö˿�ͨ��
8301 serf lan �˿ڣ�ͬһ�������� consul client ͨ���ö˿�ͨ��
8302 serf wan �˿ڣ���ͬ�������� consul server ͨ���ö˿�ͨ��
8600 dns �˿ڣ����ڷ�����
-bbostrap-expect 2: ��Ⱥ������̨������������ѡ�ټ�Ⱥleader
-ui������ web ����̨
-bind�� �������ڣ�0.0.0.0 ��ʾ�������ڣ������ָ��Ĭ��δ127.0.0.1�����޷�������ͨ��
-client �� ����ĳЩ���ڿ��Է���
docker run --name consul2 -d -p 8501:8500 consul agent -server -ui -bind=0.0.0.0 -client=0.0.0.0 -join 172.17.0.2
docker run --name consul2 -d -p 8502:8500 consul agent -server -ui -bind=0.0.0.0 -client=0.0.0.0 -join 172.17.0.2
```