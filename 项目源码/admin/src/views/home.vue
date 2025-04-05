<template>
<div class="content" :style='{"padding":"30px"}'>
	<div class="text" :style='{"padding":"0 0 0 260px","margin":"50px auto","color":"rgb(51, 51, 51)","textAlign":"center","background":"url(http://codegen.caihongy.cn/20221207/e37fb8ae34e442cf956267de4af1a5f4.png) no-repeat center top","fontSize":"32px","lineHeight":"140px","fontWeight":"bold","height":"164px"}'>欢迎使用 {{this.$project.projectName}}


  </div>
  <div class="cardView">
   <HomeChart/>





  </div>
  <HomeProgress/>
  <HomeComment/>

</div>
</template>
<script>
//0
import router from '@/router/router-static'
import HomeChart from '@/components/home/HomeChart.vue'
import HomeComment from '@/components/home/HomeComment.vue'
import HomeCard from '@/components/home/HomeCard.vue'
import HomeProgress from '@/components/home/HomeProgress.vue'
import * as echarts from 'echarts'

export default {
  components: {HomeChart,HomeCard,HomeProgress,HomeComment},

	data() {
		return {

		};
	},
  mounted(){
    this.init();
  },
  methods:{
    init(){
        if(this.$storage.get('Token')){
        this.$http({
            url: `${this.$storage.get('sessionTable')}/session`,
            method: "get"
        }).then(({ data }) => {
            if (data && data.code != 0) {
            router.push({ name: 'login' })
            }
        });
        }else{
            router.push({ name: 'login' })
        }
    },
  }
};
</script>
<style lang="scss" scoped>
    .cardView {
        display: flex;
        flex-wrap: wrap;
        width: 100%;

        .cards {
            display: flex;
            align-items: center;
            width: 100%;
            margin-bottom: 10px;
            justify-content: center;
            .card {
                width: calc(25% - 20px);
                margin: 0 10px;
                ::v-deep.el-card__body{
                    padding: 0;
                }
            }
        }
    }
</style>
