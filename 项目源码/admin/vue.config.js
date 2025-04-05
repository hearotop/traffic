// vue.config.js
const path = require('path');
var webpack = require('webpack');

function resolve(dir) {
    return path.join(__dirname, dir);
}

function publicPath() {
    if (process.env.NODE_ENV === 'production') {
        return '././';
    } else {
        return '/';
    }
}

module.exports = {
    // 设置公共路径
    publicPath: publicPath(),

    // 国际化配置 使用其它语言，默认情况下中文语言包依旧是被引入的
    configureWebpack: {
        resolve: {
            alias: {
                '@': resolve('src')
            }
        },
        plugins: [
            new webpack.HotModuleReplacementPlugin(),
        ],
    },

    // 关闭 ESLint 校验
    lintOnSave: false,

    devServer: {
        host: '0.0.0.0', // 指定使用一个 host，默认是 localhost
        port: 8081, // 指定端口
        hot: true, // 开启热更新
        https: false, // 是否开启 HTTPS 模式
        proxy: { // 请求代理服务器
            '/springboot097f4': { // 带上 api 前缀的
                target: 'http://gamerdp.hearone.top:8080/springboot097f4', // 代理目标地址
                changeOrigin: true,
                secure: false,
                pathRewrite: { // 在发出请求后将 /springboot097f4 替换为 '' 空值
                    '^/springboot097f4': ''
                }
            }
        }
    },

    chainWebpack(config) {
        config.module
            .rule('svg')
            .exclude.add(resolve('src/icons'))
            .end();

        config.module
            .rule('icons')
            .test(/\.svg$/)
            .include.add(resolve('src/icons'))
            .end()
            .use('svg-sprite-loader')
            .loader('svg-sprite-loader')
            .options({
                symbolId: 'icon-[name]'
            })
            .end();
    }
};