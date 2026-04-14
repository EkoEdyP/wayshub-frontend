module.exports = {
  apps: [
    {
      name: "wayshub-frontend",
      script: "npm start",
      watch: true,
      env: {
        NODE_ENV: "staging"
      }
    }
  ]
}
