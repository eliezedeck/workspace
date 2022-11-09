## Using a service account for `gcloud`

This is best set in the `.gitpod.yml` file so that the whole session is authenticated.

```shell
SA_EMAIL=service-account-email@....gserviceaccount.com
SA_JSON=path-to-service-account.json

gcloud auth activate-service-account "$SA_EMAIL" --key-file="$SA_JSON"
gcloud config set project <project-name>
```