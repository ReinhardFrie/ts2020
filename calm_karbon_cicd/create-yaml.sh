$ cd ~/hello-kubernetes/
$ cat << EOF > hello-kubernetes-svc.yaml
apiVersion: v1
kind: Service
metadata:
  name: hello-kubernetes
spec:
  type: LoadBalancer
  ports:
  - port: 80
    targetPort: 8080
  selector:
    app: hello-kubernetes
EOF
$ cat << EOF > hello-kubernetes-dep.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello-kubernetes
spec:
  replicas: 3
  selector:
    matchLabels:
      app: hello-kubernetes
  template:
    metadata:
      labels:
        app: hello-kubernetes
    spec:
      containers:
      - name: hello-kubernetes
        image: ${DOCKER_USER}/hello-kubernetes:\${GIT_COMMIT}
        ports:
        - containerPort: 8080
EOF
$ kubectl apply -f hello-kubernetes-svc.yaml
