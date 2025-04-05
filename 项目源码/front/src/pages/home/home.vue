<template>
<div class="home-preview" :style='{"width":"100%","margin":"0 auto","flexWrap":"wrap","justifyContent":"center","display":"flex"}'>


	<!-- 关于我们 -->
	<div :style='{"padding":"0","boxShadow":"0 0px 0px rgba(255, 255, 255, .3)","margin":"0","flexWrap":"wrap","background":"none","flexDirection":"row-reverse","display":"flex","width":"100%","position":"relative","justifyContent":"space-between","height":"auto"}'>
	  <div :style='{"color":"#000","top":"100px","textAlign":"right","left":"calc(7% + 60px)","width":"auto","lineHeight":"42px","fontSize":"42px","position":"absolute","height":"56px"}'>{{aboutUsDetail.title}}</div>
	  <div :style='{"margin":"0","color":"#555","textAlign":"center","display":"none","width":"auto","lineHeight":"40px","fontSize":"20px"}'>{{aboutUsDetail.subtitle}}</div>
	  <div :style='{"width":"60%","padding":"0","float":"right","display":"block","height":"539px"}'>
	    <img :style='{"width":"100%","margin":"0","objectFit":"cover","flex":1,"display":"block","height":"100%"}' :src="baseUrl + aboutUsDetail.picture1">
	    <img :style='{"margin":"0 10px","objectFit":"cover","flex":1,"display":"none","height":"120px"}' :src="baseUrl + aboutUsDetail.picture2">
	    <img :style='{"margin":"0 10px","objectFit":"cover","flex":1,"display":"none","height":"120px"}' :src="baseUrl + aboutUsDetail.picture3">
	  </div>
	  <div :style='{"padding":"180px 30px 0 calc(7% + 60px)","margin":"0","color":"#000","background":"#FFF","width":"40%","letterSpacing":"1px","lineHeight":"30px","fontSize":"18px","float":"left","height":"539px"}' v-html="aboutUsDetail.content"></div>
	  <div :style='{"background":" no-repeat left bottom","bottom":"0","display":"block","width":"60%","position":"absolute","right":"0","height":"539px","zIndex":"9"}' />
	  <div :style='{"top":"100px","left":"7%","background":" no-repeat","display":"block","width":"38px","position":"absolute","height":"288px"}' />
	  <div :style='{"width":"285px","background":" 0% 0% / cover no-repeat","display":"none","height":"100px"}' />
	  <div :style='{"width":"285px","background":" 0% 0% / cover no-repeat","display":"none","height":"100px"}' />
	</div>


  <!--
<div class="news" :style='{"padding":"0 0 40px","margin":"0","flexWrap":"wrap","background":" no-repeat center top / 100% 100%,#FFFFFF","display":"flex","width":"100%","position":"relative"}'>
<div v-if="true" class="idea newsIdea" :style='{"width":"100%","padding":"0","flexWrap":"wrap","background":"#000","justifyContent":"space-between","display":"flex"}'>
  <div class="box1" :style='{"width":"100%","background":" no-repeat center center","height":"300px"}'></div>
  <div class="box2" :style='{"width":"0","background":"#fff","height":"80px"}'></div>
  <div class="box3" :style='{"width":"0","background":"#fff","height":"80px"}'></div>
  <div class="box4" :style='{"width":"0","background":"#fff","height":"80px"}'></div>
  <div class="box5" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
  <div class="box6" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
  <div class="box7" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
  <div class="box8" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
  <div class="box9" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
  <div class="box10" :style='{"width":"20%","background":"#fff","display":"none","height":"80px"}'></div>
</div>-->
	
	<div class="title" :style='{"width":"100%","margin":"100px auto","lineHeight":"56px","textAlign":"center","background":"uno-repeat center bottom"}'>
		<span :style='{"color":"#202020","fontSize":"32px","fontWeight":"bold"}'>公告信息</span>
	</div>

	<!-- 样式十 -->
	<div v-if="newsList.length" class="list list10 index-pv1" :style='{"padding":"40px 7%","flexWrap":"wrap","background":"none","flexDirection":"row-reverse","display":"flex","width":"100%","justifyContent":"space-between","height":"auto"}'>
	  <div v-if="newsList.length>0" @click="toDetail('newsDetail', newsList[0])" :style='{"width":"48%","margin":"0","position":"relative","background":"none","height":"auto"}' class="new10-list-item animation-box">
	    <img :style='{"width":"100%","padding":"4px 10px","objectFit":"cover","background":" no-repeat center top / 100% 100%","display":"block","height":"290px"}' :src="baseUrl + newsList[0].picture" alt="">
		<div :style='{"padding":"0 20px","margin":"20px 0 0 100px","whiteSpace":"nowrap","overflow":"hidden","color":"#FFF","background":"#fff","width":"calc(100% - 100px)","fontSize":"16px","lineHeight":"40px","textOverflow":"ellipsis","fontWeight":"500"}' class="new9-list-item-title line1">{{newsList[0].title}}</div>
		<div :style='{"color":"#fff","left":"0","textAlign":"center","background":"#ffffff","bottom":"0","width":"100px","fontSize":"14px","lineHeight":"100px","position":"absolute","height":"100px"}' class="new9-list-item-time">{{newsList[0].addtime.split(' ')[0]}}</div>
	    <div :style='{"padding":"0 20px","margin":"0 0 0 100px","overflow":"hidden","color":"#555","background":"#fff","width":"calc(100% - 100px)","fontSize":"14px","lineHeight":"30px","textIndent":"2em","height":"60px"}' class="new9-list-item-descript line2">{{newsList[0].introduction}}</div>
		<div :style='{"padding":"0 10px","margin":"0 10px 10px","color":"#999","background":"#fff","display":"none","fontSize":"12px","lineHeight":"24px"}' class="new9-list-item-identification">新闻动态</div>
	  </div>
	  <div v-if="newsList.length>1" :style='{"margin":"0","background":"none","flexDirection":"column","display":"block","width":"48%","position":"relative","justifyContent":"space-between","height":"400px"}'>
	    <div v-for="(item,index) in newsList" v-if="index<4 && index>0" :key="index" @click="toDetail('newsDetail', item)" :style='{"width":"100%","padding":"0 0 0 120px","margin":"0 0 55px","position":"relative","background":"#fff","height":"100px"}' class="new10-list-item animation-box">
	        <div :style='{"padding":"10px 0 0","whiteSpace":"nowrap","overflow":"hidden","color":"#333","width":"calc(100% - 20px)","fontSize":"16px","lineHeight":"1","textOverflow":"ellipsis","fontWeight":"500"}' class="new9-list-item-title line1">{{ item.title }}</div>
	        <div :style='{"color":"#fff","top":"0","left":"0","textAlign":"center","background":"#000000","width":"100px","fontSize":"14px","lineHeight":"100px","position":"absolute","height":"100px"}' class="new9-list-item-time">{{ item.addtime.split(' ')[0] }}</div>
			<div :style='{"padding":"0 20px 0 0","margin":"5px 0 0","overflow":"hidden","color":"#555","width":"100%","fontSize":"14px","lineHeight":"30px","textIndent":"2em","height":"60px"}' class="new9-list-item-descript line2">{{ item.introduction }}</div>
			<div :style='{"padding":"0 10px","fontSize":"12px","lineHeight":"24px","color":"#000","background":"#fff","display":"none"}' class="new9-list-item-identification">新闻动态</div>
	    </div>
	  </div>
	</div>
	
	<div @click="moreBtn('news')" :style='{"border":"0","padding":"0 12px 0 20px","margin":"0 auto","textAlign":"center","background":" no-repeat center top / 100% 100%","display":"inline-block","width":"auto","lineHeight":"50px","minWidth":"150px","height":"50px"}'>
		<span :style='{"color":"#000","fontSize":"15px"}'>查看更多</span>
		<i v-if="true" :style='{"color":"#eee","fontSize":"15px"}' class="el-icon-d-arrow-right"></i>
	</div>
</div>




	<!-- 系统简介 -->
<!--	<div :style='{"padding":"0","boxShadow":"0 0px 0px rgba(255, 255, 255, .3)","margin":"0","flexWrap":"wrap","background":"none","display":"flex","width":"100%","position":"relative","height":"auto"}'>
	  <div :style='{"padding":"0 20px 0 40px","color":"#d7272a","top":"100px","textAlign":"center","background":"url(http://codegen.caihongy.cn/20230201/b467a6a74e1148f0bfbff828c9463e48.png) no-repeat left bottom,#fff","width":"auto","lineHeight":"59px","fontSize":"32px","position":"absolute","right":"7%","height":"59px","zIndex":"999"}'>{{systemIntroductionDetail.title}}</div>
	  <div :style='{"margin":"0","color":"#fff","textAlign":"left","display":"none","width":"100%","lineHeight":"24px","fontSize":"16px"}'>{{systemIntroductionDetail.subtitle}}</div>
	  <div :style='{"width":"60%","padding":"0","flexWrap":"wrap","justifyContent":"space-between","display":"flex","height":"539px"}'>
	    <img :style='{"width":"100%","margin":"0","objectFit":"cover","flex":1,"display":"block","height":"100%"}' :src="baseUrl + systemIntroductionDetail.picture1">
	    <img :style='{"margin":"0 10px","objectFit":"cover","flex":1,"display":"none","height":"120px"}' :src="baseUrl + systemIntroductionDetail.picture2">
	    <img :style='{"margin":"0 10px","objectFit":"cover","flex":1,"display":"none","height":"120px"}' :src="baseUrl + systemIntroductionDetail.picture3">
	  </div>
	  <div :style='{"padding":"180px 7% 0 40px","margin":"0","overflow":"hidden","color":"#fff","background":"#d7272a","width":"40%","lineHeight":"2","fontSize":"18px","position":"relative","textIndent":"2em","height":"539px"}' v-html="systemIntroductionDetail.content"></div>
	  <div :style='{"top":"0","left":"0","background":"url(http://codegen.caihongy.cn/20230201/8018c9bb444643529eebedb9dabba923.png)  no-repeat right top / auto 100%","display":"block","width":"60%","position":"absolute","height":"539px"}' />
	  <div :style='{"width":"240px","background":"url(\"http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg\") 0% 0% / cover no-repeat","display":"none","height":"240px"}' />
	  <div :style='{"width":"285px","background":"url(\"http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg\") 0% 0% / cover no-repeat","display":"none","height":"100px"}' />
	  <div :style='{"width":"285px","background":"url(\"http://codegen.caihongy.cn/20201114/7856ba26477849ea828f481fa2773a95.jpg\") 0% 0% / cover no-repeat","display":"none","height":"100px"}' />
	</div>-->
</div>
</template>
<script>
  export default {
    //数据集合
    data() {
      return {
        baseUrl: '',
        aboutUsDetail: {},
        systemIntroductionDetail: {},
        newsList: [],

      }
    },
    created() {
      this.baseUrl = this.$config.baseUrl;
      this.getNewsList();
      this.getAboutUs();
      this.getSystemIntroduction();
      this.getList();
    },
    //方法集合
    methods: {
      preHttp(str) {
          return str && str.substr(0,4)=='http';
      },
      getAboutUs() {
          this.$http.get('aboutus/detail/1', {}).then(res => {
            if(res.data.code == 0) {
              this.aboutUsDetail = res.data.data;
            }
          })
      },
      getSystemIntroduction() {
          this.$http.get('systemintro/detail/1', {}).then(res => {
            if(res.data.code == 0) {
              this.systemIntroductionDetail = res.data.data;
            }
          })
      },
		getNewsList() {
			this.$http.get('news/list', {params: {
				page: 1,
				limit: 6,
			order: 'desc'}}).then(res => {
				if (res.data.code == 0) {
					this.newsList = res.data.data.list;
					
					
				}
			});
		},
		getList() {
          let autoSortUrl = "";
			
		},
		toDetail(path, item) {
			this.$router.push({path: '/index/' + path, query: {detailObj: JSON.stringify(item)}});
		},
		moreBtn(path) {
			this.$router.push({path: '/index/' + path});
		}
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.home-preview {
	
		.recommend {
			.list3 .swiper-button-prev {
				left: 10px;
				right: auto;
			}
			
			.list3 .swiper-button-prev::after {
				color: #d7272a;
			}
			
			.list3 .swiper-button-next {
				left: auto;
				right: 10px;
			}
			
			.list3 .swiper-button-next::after {
				color: #d7272a;
			}
			
			.list5 .swiper-button-prev {
				left: 10px;
				right: auto;
			}
			
			.list5 .swiper-button-prev::after {
				color: rgb(64, 158, 255);
        }
        
        .list5 .swiper-button-next {
				left: auto;
				right: 10px;
			}
			
			.list5 .swiper-button-next::after {
				color: rgb(64, 158, 255);
			}
			
			.list5 {
				.swiper-slide-prev {
					position: relative;
					z-index: 3;
				}
		
				.swiper-slide-next {
					position: relative;
					z-index: 3;
				}
		
				.swiper-slide-active {
					position: relative;
					z-index: 5;
				}
			}
			
			.index-pv1 .animation-box {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				z-index: initial;
			}
			
			.index-pv1 .animation-box:hover {
				transform: translate3d(0px, -10px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
				z-index: 1;
			}
			
			.index-pv1 .animation-box img {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			}
			
			.index-pv1 .animation-box img:hover {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
			}
		}
		
		.news {
			.list3 .swiper-button-prev {
				left: 10px;
				right: auto;
			}
			
			.list3 .swiper-button-prev::after {
				color: rgb(64, 158, 255);
			}
			
			.list3 .swiper-button-next {
				left: auto;
				right: 10px;
			}
			
			.list3 .swiper-button-next::after {
				color: rgb(64, 158, 255);
			}
			
			.list6 .swiper-button-prev {
				left: 10px;
				right: auto;
			}
			
			.list6 .swiper-button-prev::after {
				color: rgb(64, 158, 255);
			}
			
			.list6 .swiper-button-next {
				left: auto;
				right: 10px;
			}
			
			.list6 .swiper-button-next::after {
				color: rgb(64, 158, 255);
			}
			
			.index-pv1 .animation-box {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				z-index: initial;
			}
			
			.index-pv1 .animation-box:hover {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
				z-index: 1;
			}
			
			.index-pv1 .animation-box img {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			}
			
			.index-pv1 .animation-box img:hover {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
			}
		}
	
		.lists {
			.list3 .swiper-button-prev {
				left: 10px;
				right: auto;
			}
			
			.list3 .swiper-button-prev::after {
				color: rgb(64, 158, 255);
			}
			
			.list3 .swiper-button-next {
				left: auto;
				right: 10px;
        }
        
        .list3 .swiper-button-next::after {
				color: rgb(64, 158, 255);
			}
			
			.list5 .swiper-button-prev {
				left: 10px;
				right: auto;
			}
			
			.list5 .swiper-button-prev::after {
				color: rgb(64, 158, 255);
			}
			
			.list5 .swiper-button-next {
            left: auto;
            right: 10px;
			}
			
			.list5 .swiper-button-next::after {
				color: rgb(64, 158, 255);
			}
			
			.list5 {
				.swiper-slide-prev {
					position: relative;
					z-index: 3;
				}
		
				.swiper-slide-next {
					position: relative;
					z-index: 3;
				}
		
				.swiper-slide-active {
					position: relative;
					z-index: 5;
				}
			}
			
			.index-pv1 .animation-box {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				z-index: initial;
			}
			
			.index-pv1 .animation-box:hover {
				transform: translate3d(0px, 10px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
				z-index: 1;
			}
			
			.index-pv1 .animation-box img {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			}
			
			.index-pv1 .animation-box img:hover {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
			}
		}
	}
</style>
