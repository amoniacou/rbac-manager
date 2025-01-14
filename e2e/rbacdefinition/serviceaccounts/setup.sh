kubectl create clusterrole test-rbac-manager --verb="create" --resource=deployment

cat <<EOF | kubectl create -f -
apiVersion: rbacmanager.reactiveops.io/v1beta1
kind: RBACDefinition
metadata:
  name: rbac-manager-definition-1
rbacBindings:
  - name: admins
    subjects:
      - kind: ServiceAccount
        name: test-rbac-manager
        namespace: rbac-manager
        imagePullSecrets:
          - robot-secret
    clusterRoleBindings:
      - clusterRole: test-rbac-manager
EOF