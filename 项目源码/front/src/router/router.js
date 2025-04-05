import VueRouter from 'vue-router'

//引入组件
import Index from '../pages'
import Home from '../pages/home/home'
import Login from '../pages/login/login'
import Register from '../pages/register/register'
import Center from '../pages/center/center'
import Storeup from '../pages/storeup/list'
import News from '../pages/news/news-list'
import NewsDetail from '../pages/news/news-detail'
import yonghuList from '../pages/yonghu/list'
import yonghuDetail from '../pages/yonghu/detail'
import yonghuAdd from '../pages/yonghu/add'
import gongjiaoluxianList from '../pages/gongjiaoluxian/list'
import gongjiaoluxianDetail from '../pages/gongjiaoluxian/detail'
import gongjiaoluxianAdd from '../pages/gongjiaoluxian/add'
import gongjiaochexinxiList from '../pages/gongjiaochexinxi/list'
import gongjiaochexinxiDetail from '../pages/gongjiaochexinxi/detail'
import gongjiaochexinxiAdd from '../pages/gongjiaochexinxi/add'
import zhandianxinxiList from '../pages/zhandianxinxi/list'
import zhandianxinxiDetail from '../pages/zhandianxinxi/detail'
import zhandianxinxiAdd from '../pages/zhandianxinxi/add'
import xianluweihuList from '../pages/xianluweihu/list'
import xianluweihuDetail from '../pages/xianluweihu/detail'
import xianluweihuAdd from '../pages/xianluweihu/add'
import systemintroList from '../pages/systemintro/list'
import systemintroDetail from '../pages/systemintro/detail'
import systemintroAdd from '../pages/systemintro/add'

const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
	return originalPush.call(this, location).catch(err => err)
}

//配置路由
export default new VueRouter({
	routes:[
		{
      path: '/',
      redirect: '/index/home'
    },
		{
			path: '/index',
			component: Index,
			children:[
				{
					path: 'home',
					component: Home
				},
				{
					path: 'center',
					component: Center,
				},
				{
					path: 'storeup',
					component: Storeup
				},
				{
					path: 'news',
					component: News
				},
				{
					path: 'newsDetail',
					component: NewsDetail
				},
				{
					path: 'yonghu',
					component: yonghuList
				},
				{
					path: 'yonghuDetail',
					component: yonghuDetail
				},
				{
					path: 'yonghuAdd',
					component: yonghuAdd
				},
				{
					path: 'gongjiaoluxian',
					component: gongjiaoluxianList
				},
				{
					path: 'gongjiaoluxianDetail',
					component: gongjiaoluxianDetail
				},
				{
					path: 'gongjiaoluxianAdd',
					component: gongjiaoluxianAdd
				},
				{
					path: 'gongjiaochexinxi',
					component: gongjiaochexinxiList
				},
				{
					path: 'gongjiaochexinxiDetail',
					component: gongjiaochexinxiDetail
				},
				{
					path: 'gongjiaochexinxiAdd',
					component: gongjiaochexinxiAdd
				},
				{
					path: 'zhandianxinxi',
					component: zhandianxinxiList
				},
				{
					path: 'zhandianxinxiDetail',
					component: zhandianxinxiDetail
				},
				{
					path: 'zhandianxinxiAdd',
					component: zhandianxinxiAdd
				},
				{
					path: 'xianluweihu',
					component: xianluweihuList
				},
				{
					path: 'xianluweihuDetail',
					component: xianluweihuDetail
				},
				{
					path: 'xianluweihuAdd',
					component: xianluweihuAdd
				},
				{
					path: 'systemintro',
					component: systemintroList
				},
				{
					path: 'systemintroDetail',
					component: systemintroDetail
				},
				{
					path: 'systemintroAdd',
					component: systemintroAdd
				},
			]
		},
		{
			path: '/login',
			component: Login
		},
		{
			path: '/register',
			component: Register
		},
	]
})
