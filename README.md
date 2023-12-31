# Library App

This is a sample app consisting of Ruby on Rails microservices and a React frontend. The backend database is SQLite3 however this would ideally be replaced by DynamoDB in the future. This app is containerized with Docker and deployed with Kubernetes.

## Design
![](./images/lib_app_arch_diagram.drawio.svg)

## This is an example and not for Production!
In a production environment I would have each of these microservices in their own separate repo to enhance scalablility, enforce isolation, provide independent development, and decouple the releases. Also, the DBs would be separated from the cluster, however, for speed and ease of use for demonstration purposes, SQLite3 has been used for DB capability.
