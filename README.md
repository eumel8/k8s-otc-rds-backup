[![Docker Repository on Quay Enterprise](https://mtr.external.otc.telekomcloud.com/repository/eumel8/k8s-otc-rds-backup/status "Docker Repository on Quay Enterprise")](https://mtr.external.otc.telekomcloud.com/repository/eumel8/k8s-otc-rds-backup)


K8S container for OTC RDS service
=================================

Use case: check backups on a selected instance

Local Tests:
------

```
docker pull mtr.external.otc.telekomcloud.com/eumel8/k8s-otc-rds-backup:latest
docker run -e OS_PROJECT_NAME=xxx -e OS_REGION_NAME=xxx -e OS_AUTH_URL=xxx -e OS_IDENTITY_API_VERSION=x -e OS_PASSWORD=xxx -e OS_USERNAME=xxx  -e OS_USER_DOMAIN_NAME=xxx -e RDS_NAME=xxx <image-id>
```

Output should be a list in jason format with the current RDS backups. The file is generated in /ansible-otc/playbooks/backups.json


K8S:
----

```
kubectl create -f deployment.yaml
```

Links:
------

* https://github.com/kubernetes/sample-controller

* https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/

* https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.14/

* https://blog.newrelic.com/engineering/kube-apiserver-manage-inventory/

* https://github.com/sorenmat/k8s-rds
