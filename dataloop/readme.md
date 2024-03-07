## Prepare the backup Storage

```
kubectl create secret generic -n demo gcs-secret \
  --from-literal=RESTIC_PASSWORD=12345 \
  --from-literal=GOOGLE_PROJECT_ID=appscode-testing \
  --from-file=./GOOGLE_SERVICE_ACCOUNT_JSON_KEY
```

`kubectl apply -f encrypt-secret.yaml`
`kubectl apply -f retention-policy.yaml`
`kubectl apply -f backupstorage.yaml`

Wait for the backup storage to be ready

## Apply DB & take backup

`kubectl apply -f source-db.yaml`
insert some data on `test` & `testdb` database.

`kubectl apply -f backupconfiguration.yaml`
This will take logical-backup from testdb(check .spec.sessions.addon) in every 3 minutes, & the whole db will be backed up every 5 minutes.

This is connecting point for all the components -> 
Those we have created : MongoDB, BackupStorage, RetentionPolicy, entrypt-secret
Those will be created : Repository, Snapshot
Those have been created on helm installation : Function, Addon


## Restore

`kubectl get snapshot.storage.kubestash.com -n demo`
Find out the snapshot you want to restore from

