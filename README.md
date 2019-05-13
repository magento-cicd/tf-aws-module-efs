# Terraform Module for AWS Elastic File System (EFS)

## Folders

* **modules**  - Module code.
* **examples** - Examples of module implementation. Also used in tests.
* **tests**    - Location of terratest tests.

## EFS Use Case Examples

### Using EFS with Docker on ECS

You can mount EFS via NFS directly to containers using Docker's local volume driver.

Use the "Amazon Ec2 mount instructions" information from the console to get the values needed for volume configuration in the Task Definition.

Task Definition Example

``` json
...
{
  "volumes": [
    {
      "name": "jenkins_home",
      "host": null,
      "dockerVolumeConfiguration": {
        "autoprovision": null,
        "labels": null,
        "scope": "task",
        "driver": "local",
        "driverOpts": {
          "type": "nfs",
          "device": "fs-1234abcd.efs.eu-west-1.amazonaws.com:/",
          "o": "addr=fs-1234abcd.efs.eu-west-1.amazonaws.com,nfsvers=4.0,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2"
        }
      }
    }
  ]
}
...
```

There’s a kernel bug which hasn’t been fixed in the ECS optimized AMI (tested with 2018.03.g).
This leads to a deadlock when you start multiple tasks with an nfs volume at the same time (e.g. when updating the cluster).

The workaround is to use the nfs version 4.0 instead of 4.1 (updated in snippets above)

For more information see:

* https://www.spinics.net/lists/linux-nfs/msg66321.html
* https://bugzilla.redhat.com/show_bug.cgi?id=1506382