# show events in chronologic order
kubectl get events --sort-by=.metadata.creationTimestamp

# get pods in wide format
kubectl get pod -o wide

# show diff between actual and desired state of the cluster
kubectl diff --filename

# apply desired state
kubectl apply --filename

# show status of master node components
kubectl get componentstatuses

