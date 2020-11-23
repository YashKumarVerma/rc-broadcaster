module.exports = (req, res) => {
  const { Storage } = require("@google-cloud/storage");
  console.log("location of js:", __dirname);
  console.log("location of executioner", process.cwd());
  async function worker() {
    const storage = new Storage();
    const bucketName = "reverse-coding-2020.appspot.com";
    const files = await storage.bucket(bucketName).getFiles();
    const dataStorage = [];
    for (let i = 0; i < files.length; i++) {
      const url = await storage
        .bucket(bucketName)
        .file(files[i].name)
        .getSignedUrl({
          version: "v2", // defaults to 'v2' if missing.
          action: "read",
          expires: Date.now() + 1000 * 60 * 60 * 48, // one hour
        });
      dataStorage.push({
        id: files[i].name,
        url,
      });
    }

    return dataStorage;
  }

  worker()
    .then((data) => {
      res.json({
        error: false,
        payload: data,
      });
    })
    .catch((err) => {
      console.error(err);
      res.json({
        error: true,
        payload: false,
      });
    });
};
