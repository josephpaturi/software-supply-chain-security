# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

apiVersion: v1
kind: Service
metadata:
  name: joseph-demo-service
spec:
  selector:
    app: joseph-demo
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
  type: LoadBalancer
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: joseph-demo
  labels:
    app: joseph-demo
spec:
  replicas: 1
  selector:
    matchLabels:
      app: joseph-demo
  template:
    metadata:
      labels:
        app: joseph-demo
      annotations:
#        alpha.image-policy.k8s.io/break-glass: "true"
    spec:
      containers:
      - name: joseph-demo
        image: gcr.io/GOOGLE_CLOUD_PROJECT/joseph-demo:latest
        ports:
        - containerPort: 8080