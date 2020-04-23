module.exports = {
  css: {
    loaderOptions: {
      scss: {
        prependData: '@import "@/styles/base/variables.scss";',
      },
    },
  },
  publicPath: process.env.NODE_ENV === 'production'
    ? '/21.04.2020-16.10/'
    : '/',
};
