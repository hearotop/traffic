<template>
  <div>
    <div class="container" :style='{"minHeight":"100vh","width":"100%","alignItems":"center","background":"url(http://gamerdp.hearone.top:9000/anzhuo/back.jpg) no-repeat center bottom / 100% auto","justifyContent":"center","display":"flex"}'>
      <el-form
          ref="loginForm"
          :model="loginForm"
          :style='{
            padding: "20px 0 120px",
            boxShadow: "0 0px 0px rgba(64, 158, 255, .8)",
            margin: "0 auto",
            borderRadius: "0",
            width: "500px",
            position: "relative",
            height: "auto",
            backgroundColor: "rgba(0, 0, 0, 0.4)" // 半透明白色背景
        }'
          :rules="rules"
      >
        <div v-if="false" :style='{"margin":"0 0 10px 0","color":"rgba(64, 158, 255, 1)","textAlign":"center","width":"100%","lineHeight":"44px","fontSize":"20px","textShadow":"4px 4px 2px rgba(64, 158, 255, .5)"}'>USER / LOGIN</div>
        <div v-if="true" :style='{"width":"100%","margin":"4px 0 40px","lineHeight":"44px","fontSize":"18px","color":"#fff","textAlign":"center"}'>智慧公交管理系统</div>
        <el-form-item v-if="loginType==1" class="list-item" :style='{"width":"80%","margin":"0 10% 20px"}' prop="username">
          <div v-if="false" :style='{"width":"64px","lineHeight":"44px","fontSize":"14px","color":"rgba(64, 158, 255, 1)"}'>账号：</div>
          <input :style='{"border":"1px solid #eee","padding":"0 10px","boxShadow":"0 0 0px rgba(64, 158, 255, .5)","color":"#333","width":"100%","fontSize":"14px","height":"40px"}' v-model="loginForm.username" placeholder="请输入账户">
        </el-form-item>
        <el-form-item v-if="loginType==1" class="list-item" :style='{"width":"80%","margin":"0 10% 20px"}' prop="password">
          <div v-if="false" :style='{"width":"64px","lineHeight":"44px","fontSize":"14px","color":"rgba(64, 158, 255, 1)"}'>密码：</div>
          <input :style='{"border":"1px solid #eee","padding":"0 10px","boxShadow":"0 0 0px rgba(64, 158, 255, .5)","color":"#333","width":"100%","fontSize":"14px","height":"40px"}' v-model="loginForm.password" placeholder="请输入密码" type="password">
        </el-form-item>
        <el-form-item v-if="roles.length>1" class="list-type" :style='{"width":"80%","margin":"20px auto"}' prop="role">
          <el-radio v-model="loginForm.tableName" :label="item.tableName" v-for="(item, index) in roles" :key="index" @change.native="getCurrentRow(item)">{{item.roleName}}</el-radio>
        </el-form-item>
        <el-form-item :style='{"width":"100%","position":"relative","display":"flex","justifyContent":"center"}'>
          <el-button
              type="danger"
              v-if="loginType==1"
              :style='{"margin-left":"120px","border":"0","cursor":"pointer","padding":"0 24px","outline":"none","color":"#fff","borderRadius":"0","width":"50%","fontSize":"16px","height":"50px"}'
              @click="submitForm('loginForm')"
          >
            登录
          </el-button>
        </el-form-item>
        <el-form-item>
          <div :style='{"width":"80%","position":"absolute","left":"10%","justifyContent":"space-between","display":"flex","flex-direction":"row"}'>
            <el-button
                type="warning"
                v-if="loginType==1"
                :style='{"border":"0","cursor":"pointer","padding":"0 20px","outline":"none","color":"#fff","borderRadius":"4px","background":"none","fontSize":"16px","height":"44px"}'
                @click="resetForm('loginForm')"
            >
              重置
            </el-button>
            <div>
              <router-link
                  v-for="(item, index) in roles"
                  :key="index"
                  v-if="item.hasFrontRegister=='是'"
                  :style='{"cursor":"pointer","margin":"0 10px 10px 0","fontSize":"16px","textDecoration":"none","color":"#FFF","background":"none"}'
                  :to="{path: '/register', query: {role: item.tableName,pageFlag:'register'}}"
              >
                注册{{item.roleName.replace('注册','')}}
              </router-link>
            </div>
          </div>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

</template>

<script>

export default {
	//数据集合
	data() {
		return {
            baseUrl: this.$config.baseUrl,
            loginType: 1,
			roleMenus: [{"backMenu":[{"child":[{"appFrontIcon":"cuIcon-medal","buttons":["新增","查看","修改","删除"],"menu":"用户","menuJump":"列表","tableName":"yonghu"}],"menu":"用户管理"},{"child":[{"appFrontIcon":"cuIcon-skin","buttons":["新增","查看","修改","删除","维护"],"menu":"公交路线","menuJump":"列表","tableName":"gongjiaoluxian"}],"menu":"公交路线管理"},{"child":[{"appFrontIcon":"cuIcon-present","buttons":["新增","查看","修改","删除"],"menu":"公交车信息","menuJump":"列表","tableName":"gongjiaochexinxi"}],"menu":"公交车信息管理"},{"child":[{"appFrontIcon":"cuIcon-newshot","buttons":["新增","查看","修改","删除"],"menu":"站点信息","menuJump":"列表","tableName":"zhandianxinxi"}],"menu":"站点信息管理"},{"child":[{"appFrontIcon":"cuIcon-similar","buttons":["查看","修改","删除"],"menu":"线路维护","menuJump":"列表","tableName":"xianluweihu"}],"menu":"线路维护管理"},{"child":[{"appFrontIcon":"cuIcon-vip","buttons":["查看","修改"],"menu":"系统简介","tableName":"systemintro"},{"appFrontIcon":"cuIcon-time","buttons":["查看","修改"],"menu":"轮播图管理","tableName":"config"},{"appFrontIcon":"cuIcon-news","buttons":["新增","查看","修改","删除"],"menu":"公告信息","tableName":"news"},{"appFrontIcon":"cuIcon-service","buttons":["新增","查看","修改","删除"],"menu":"在线提问","tableName":"chat"},{"appFrontIcon":"cuIcon-album","buttons":["查看","修改"],"menu":"关于我们","tableName":"aboutus"}],"menu":"系统管理"}],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-medal","buttons":["查看"],"menu":"公交路线列表","menuJump":"列表","tableName":"gongjiaoluxian"}],"menu":"公交路线模块"},{"child":[{"appFrontIcon":"cuIcon-newshot","buttons":["查看"],"menu":"公交车信息列表","menuJump":"列表","tableName":"gongjiaochexinxi"}],"menu":"公交车信息模块"},{"child":[{"appFrontIcon":"cuIcon-camera","buttons":["查看"],"menu":"站点信息列表","menuJump":"列表","tableName":"zhandianxinxi"}],"menu":"站点信息模块"},{"child":[{"appFrontIcon":"cuIcon-taxi","buttons":["查看"],"menu":"线路维护列表","menuJump":"列表","tableName":"xianluweihu"}],"menu":"线路维护模块"}],"hasBackLogin":"是","hasBackRegister":"否","hasFrontLogin":"否","hasFrontRegister":"否","roleName":"管理员","tableName":"users"},{"backMenu":[],"frontMenu":[{"child":[{"appFrontIcon":"cuIcon-medal","buttons":["查看"],"menu":"公交路线列表","menuJump":"列表","tableName":"gongjiaoluxian"}],"menu":"公交路线模块"},{"child":[{"appFrontIcon":"cuIcon-newshot","buttons":["查看"],"menu":"公交车信息列表","menuJump":"列表","tableName":"gongjiaochexinxi"}],"menu":"公交车信息模块"},{"child":[{"appFrontIcon":"cuIcon-camera","buttons":["查看"],"menu":"站点信息列表","menuJump":"列表","tableName":"zhandianxinxi"}],"menu":"站点信息模块"},{"child":[{"appFrontIcon":"cuIcon-taxi","buttons":["查看"],"menu":"线路维护列表","menuJump":"列表","tableName":"xianluweihu"}],"menu":"线路维护模块"}],"hasBackLogin":"否","hasBackRegister":"否","hasFrontLogin":"是","hasFrontRegister":"是","roleName":"用户","tableName":"yonghu"}],
			loginForm: {
				username: '',
				password: '',
				tableName: '',
				code: '',
			},
			role: '',
            roles: [],
			rules: {
				username: [
					{ required: true, message: '请输入账户', trigger: 'blur' }
				],
				password: [
					{ required: true, message: '请输入密码', trigger: 'blur' }
				]
			},
			codes: [{
				num: 1,
				color: '#000',
				rotate: '10deg',
				size: '16px'
			}, {
				num: 2,
				color: '#000',
				rotate: '10deg',
				size: '16px'
			}, {
				num: 3,
				color: '#000',
				rotate: '10deg',
				size: '16px'
			}, {
				num: 4,
				color: '#000',
				rotate: '10deg',
				size: '16px'
			}]
		}
	},
	created() {
        for(let item in this.roleMenus) {
            if(this.roleMenus[item].hasFrontLogin=='是') {
                this.roles.push(this.roleMenus[item]);
            }
        }
	},
	mounted() {
	},
    //方法集合
    methods: {
		randomString() {
			var len = 4;
			var chars = [
			  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
			  'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
			  'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
			  'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
			  'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2',
			  '3', '4', '5', '6', '7', '8', '9'
			]
			var colors = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']
			var sizes = ['14', '15', '16', '17', '18']

			var output = []
			for (var i = 0; i < len; i++) {
			  // 随机验证码
			  var key = Math.floor(Math.random() * chars.length)
			  this.codes[i].num = chars[key]
			  // 随机验证码颜色
			  var code = '#'
			  for (var j = 0; j < 6; j++) {
			    var key = Math.floor(Math.random() * colors.length)
			    code += colors[key]
			  }
			  this.codes[i].color = code
			  // 随机验证码方向
			  var rotate = Math.floor(Math.random() * 45)
			  var plus = Math.floor(Math.random() * 2)
			  if (plus == 1) rotate = '-' + rotate
			  this.codes[i].rotate = 'rotate(' + rotate + 'deg)'
			  // 随机验证码字体大小
			  var size = Math.floor(Math.random() * sizes.length)
			  this.codes[i].size = sizes[size] + 'px'
			}
		},
      getCurrentRow(row) {
        this.role = row.roleName;
      },
      submitForm(formName) {
        if (this.roles.length!=1) {
            if (!this.role) {
                this.$message.error("请选择登录用户类型");
                return false;
            }
        } else {
            this.role = this.roles[0].roleName;
            this.loginForm.tableName = this.roles[0].tableName;
        }
        this.$refs[formName].validate((valid) => {
          if (valid) {
            this.$http.get(`${this.loginForm.tableName}/login`, {params: this.loginForm}).then(res => {
              if (res.data.code === 0) {
                localStorage.setItem('Token', res.data.token);
                localStorage.setItem('UserTableName', this.loginForm.tableName);
                localStorage.setItem('username', this.loginForm.username);
                localStorage.setItem('adminName', this.loginForm.username);
                localStorage.setItem('sessionTable', this.loginForm.tableName);
                localStorage.setItem('role', this.role);
                localStorage.setItem('keyPath', this.$config.indexNav.length+2);
                this.$router.push('/index/center');
                this.$message({
                  message: '登录成功',
                  type: 'success',
                  duration: 1500,
                });
              } else {
                this.$message.error(res.data.msg);
              }
            });
          } else {
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs[formName].resetFields();
      }
    }
  }
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.container {
		position: relative;
		background: url(http://codegen.caihongy.cn/20230202/89a55405b6364919af87c1091a9ad346.jpg) no-repeat center bottom / 100% auto;

		.el-form-item {
		  & ::v-deep .el-form-item__content {
		    width: 100%;
		  }
		}

		.list-item ::v-deep .el-input .el-input__inner {
			border: 1px solid #eee;
			padding: 0 10px;
			box-shadow: 0 0 0px rgba(64, 158, 255, .5);
			color: #333;
			width: 100%;
			font-size: 14px;
			height: 40px;
		}

		.list-code ::v-deep .el-input .el-input__inner {
			border: 1px solid #eee;
			padding: 0 10px;
			outline: none;
			color: #333;
			background: #fff;
			display: inline-block;
			vertical-align: middle;
			width: calc(100% - 110px);
			font-size: 14px;
			height: 40px;
		}

		.list-type ::v-deep .el-radio__input .el-radio__inner {
			background: rgba(53, 53, 53, 0);
			border-color: #666666;
		}
		.list-type ::v-deep .el-radio__input.is-checked .el-radio__inner {
			background: #f50000;
			border-color: #f50000;
		}
		.list-type ::v-deep .el-radio__label {
			color: #666666;
			font-size: 14px;
		}
		.list-type ::v-deep .el-radio__input.is-checked+.el-radio__label {
			color: #f50000;
			font-size: 14px;
		}
	}
</style>
