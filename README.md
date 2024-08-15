# gitlabci-singularity-build
Simple Gitlab CI example to build singularity images  (Go + Singularity (Apptainer) are required)

## Steps

1) Create and active a gitlab-runner in your local node (refer to Gitlab). Do **NOT** use Docker. Use Shell.
2) Add gitlab-runner and root to `/etc/subuid`  and `/etc/subgid` (Required to use singularity build with --fakeroot)
3) Upload this repository to your own Gitlab project
4) In `.gitlab-ci.yml`, modify the `tags` name (choose the tag of your Gitlab runner).
