module.exports = {
  lintOnSave: false,
  publicPath: process.env.NODE_ENV === 'development' ? './' : '././',
  outputDir: 'dist',
  devServer: {
  
    port: 8082, // 指定端口号为 8082
    open: true, // 可选：启动后自动打开浏览器
    overlay: {
      warnings: false,
      errors: true
    }
    
  }
}