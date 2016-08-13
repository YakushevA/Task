docker build -t test-nginx -f TaskTV/Dockerfile1 .
docker build -t test-web-container -f TaskTV/Dockerfile2 .
docker run -it --name test-nginx --env 'VHOST1=docker-alice:8081' --env 'VHOST2=docker-bob:8082' --env 'VHOST3=docker-tom:8083' -p 80:80 test-nginx
docker cp test-nginx:/variable.txt /tmp/.variable
docker run --name alice-web --env 'OUTPUT_STRING=Hello-Alice' -v /tmp/.variable:/tmp/.variable -p 8081:80 test-web-container
docker run --name bob-web --env 'OUTPUT_STRING=Hello-Bob' -v /tmp/.variable:/tmp/.variable -p 8082:80 test-web-container
docker run --name tom-web --env 'OUTPUT_STRING=Hello-Tom' -v /tmp/.variable:/tmp/.variable -p 8083:80 test-web-container
docker ps
curl docker-alice
curl docker-bob
curl docker-tom

