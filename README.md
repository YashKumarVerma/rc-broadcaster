# RC Broadcaster

Serverless function to invoke firebase calls and generate links for question files.

Deployed on: [rc-broadcaster.vercel.app](https://rc-broadcaster.vercel.app/api/app.js)

## Why Serverless function ?
This serverless function is written as an attempt to avoid adding firebase as a dependency to heimdall and task-runner. Now the only thing that the micro-services need to do is fetch json from a web endpoint and download the binaries.