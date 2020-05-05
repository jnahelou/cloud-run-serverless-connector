# Play with cloudrun serverless connector
## Architecture
A simple nginx proxy\_pass that redirect traffic to internal URLs using Google Cloud Serverless Connector and Cloud DNS

### Requirements
- [x] GCP project
- [x] Serverless connector [https://cloud.google.com/vpc/docs/configure-serverless-vpc-access](https://cloud.google.com/vpc/docs/configure-serverless-vpc-access)
- [x] Cloud DNS zone configured to reply with internal DNS (hosted private zone, peering or forwarding)

### Inspired by :
- https://github.com/bamnet/cloud-run-fun
- http://www.nginx-discovery.com/2011/05/day-51-proxypass-and-resolver.html


## How to deploy
```
$ export GCP_PROJECT="<set project_id here>"
$ export GCP_REGION="<set GCP region here>"
$ docker build -t gcr.io/$GCP_PROJECT/test_connector:latest .
$ docker push -t gcr.io/$GCP_PROJECT/test_connector:latest
$ gcloud alpha run deploy --vpc-connector=<name of connector> --image=gcr.io/$GCP_PROJECT/test_connector:latest test-connector --platform managed --project $GCP_PROJECT --region $GCP_REGION
```

## How to use it
```
$ curl -H "Authorization: Bearer $(gcloud auth print-identity-token)" https://test-connector-xxxxxx-ew.a.run.app/crawl/myapp.mydomain.internal/
```
