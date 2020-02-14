module.exports = {
  plugins: {
    'posthtml-inline-svg': {
      cwd: process.env.TEMPLATE + '/src',
      tag: 'image'
    }
  }
}
