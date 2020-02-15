module.exports = {
  plugins: {
    'posthtml-inline-svg': {
      cwd: process.cwd() + '/src',
      tag: 'image'
    },
    'posthtml-lorem': {}
  }
}
