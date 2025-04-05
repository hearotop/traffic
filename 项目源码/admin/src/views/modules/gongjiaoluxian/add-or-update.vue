<template>
	<div class="addEdit-block" :style='{"padding":"30px"}' style="width: 100%;">
		<el-form
			:style='{"minHeight":"100vh","padding":"30px","boxShadow":"0 0px 0px #999","borderRadius":"6px","background":"none"}'
			class="add-update-preview"
			ref="ruleForm"
			:model="ruleForm"
			:rules="rules"
			label-width="80px"
		>
			<template >
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'" label="线路编号" prop="xianlubianhao">
					<el-input v-model="ruleForm.xianlubianhao" placeholder="线路编号" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-else-if="ruleForm.xianlubianhao" label="线路编号" prop="xianlubianhao">
					<el-input v-model="ruleForm.xianlubianhao" placeholder="线路编号" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="线路名称" prop="xianlumingcheng">
					<el-input v-model="ruleForm.xianlumingcheng" placeholder="线路名称" clearable  :readonly="ro.xianlumingcheng"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="线路名称" prop="xianlumingcheng">
					<el-input v-model="ruleForm.xianlumingcheng" placeholder="线路名称" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="upload" v-if="type!='info' && !ro.xianlutupian" label="线路图片" prop="xianlutupian">
					<file-upload
						tip="点击上传线路图片"
						action="file/upload"
						:limit="3"
						:multiple="true"
						:fileUrls="ruleForm.xianlutupian?ruleForm.xianlutupian:''"
						@change="xianlutupianUploadChange"
					></file-upload>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="upload" v-else-if="ruleForm.xianlutupian" label="线路图片" prop="xianlutupian">
					<img v-if="ruleForm.xianlutupian.substring(0,4)=='http'" class="upload-img" style="margin-right:20px;" v-bind:key="index" :src="ruleForm.xianlutupian.split(',')[0]" width="100" height="100">
					<img v-else class="upload-img" style="margin-right:20px;" v-bind:key="index" v-for="(item,index) in ruleForm.xianlutupian.split(',')" :src="$base.url+item" width="100" height="100">
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="票价" prop="piaojia">
					<el-input v-model="ruleForm.piaojia" placeholder="票价" clearable  :readonly="ro.piaojia"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="票价" prop="piaojia">
					<el-input v-model="ruleForm.piaojia" placeholder="票价" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="班次" prop="banci">
					<el-input v-model="ruleForm.banci" placeholder="班次" clearable  :readonly="ro.banci"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="班次" prop="banci">
					<el-input v-model="ruleForm.banci" placeholder="班次" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="发车间隔" prop="fachejiange">
					<el-input v-model="ruleForm.fachejiange" placeholder="发车间隔" clearable  :readonly="ro.fachejiange"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="发车间隔" prop="fachejiange">
					<el-input v-model="ruleForm.fachejiange" placeholder="发车间隔" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="select" v-if="type!='info'"  label="起始点" prop="qishidian">
					<el-select :disabled="ro.qishidian" v-model="ruleForm.qishidian" placeholder="请选择起始点" >
						<el-option
							v-for="(item,index) in qishidianOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="起始点" prop="qishidian">
					<el-input v-model="ruleForm.qishidian"
						placeholder="起始点" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="途径地" prop="tujingdi">
					<el-input v-model="ruleForm.tujingdi" placeholder="途径地" clearable  :readonly="ro.tujingdi"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="途径地" prop="tujingdi">
					<el-input v-model="ruleForm.tujingdi" placeholder="途径地" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="select" v-if="type!='info'"  label="终止点" prop="zhongzhidian">
					<el-select :disabled="ro.zhongzhidian" v-model="ruleForm.zhongzhidian" placeholder="请选择终止点" >
						<el-option
							v-for="(item,index) in zhongzhidianOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="终止点" prop="zhongzhidian">
					<el-input v-model="ruleForm.zhongzhidian"
						placeholder="终止点" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="select" v-if="type!='info'" label="车辆名称" prop="cheliangmingcheng">
					<el-select :disabled="ro.cheliangmingcheng" @change="cheliangmingchengChange" v-model="ruleForm.cheliangmingcheng" placeholder="请选择车辆名称">
						<el-option
							v-for="(item,index) in cheliangmingchengOptions"
							v-bind:key="index"
							:label="item"
							:value="item">
						</el-option>
					</el-select>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-else-if="ruleForm.cheliangmingcheng" label="车辆名称" prop="cheliangmingcheng">
					<el-input v-model="ruleForm.cheliangmingcheng" placeholder="车辆名称" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-if="type!='info'"  label="车牌号" prop="chepaihao">
					<el-input v-model="ruleForm.chepaihao" placeholder="车牌号" clearable  :readonly="ro.chepaihao"></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else class="input" label="车牌号" prop="chepaihao">
					<el-input v-model="ruleForm.chepaihao" placeholder="车牌号" readonly></el-input>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="date" v-if="type!='info'" label="更新时间" prop="gengxinshijian">
					<el-date-picker
						format="yyyy 年 MM 月 dd 日"
						value-format="yyyy-MM-dd"
						v-model="ruleForm.gengxinshijian" 
						type="date"
						:readonly="ro.gengxinshijian"
						placeholder="更新时间"
					></el-date-picker> 
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' class="input" v-else-if="ruleForm.gengxinshijian" label="更新时间" prop="gengxinshijian">
					<el-input v-model="ruleForm.gengxinshijian" placeholder="更新时间" readonly></el-input>
				</el-form-item>
			</template>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-if="type!='info'"  label="路线详情" prop="luxianxiangqing">
					<editor 
						style="min-width: 200px; max-width: 600px;"
						v-model="ruleForm.luxianxiangqing" 
						class="editor" 
						action="file/upload">
					</editor>
				</el-form-item>
				<el-form-item :style='{"margin":"0 0 20px 0"}' v-else-if="ruleForm.luxianxiangqing" label="路线详情" prop="luxianxiangqing">
                    <span :style='{"fontSize":"14px","lineHeight":"40px","color":"#333","fontWeight":"500","display":"inline-block"}' v-html="ruleForm.luxianxiangqing"></span>
                </el-form-item>
			<el-form-item :style='{"padding":"0","margin":"0"}' class="btn">
				<el-button :style='{"border":"0px solid #5e9808","cursor":"pointer","padding":"0 30px","margin":"0 20px 0 0","outline":"none","color":"#333","borderRadius":"4px","background":"url(http://codegen.caihongy.cn/20221207/a9d275fd8e5f4ababbf9129cc1d20492.png) no-repeat center top / 100% 100%,rgba(255,255,255,.8)","width":"auto","lineHeight":"40px","fontSize":"14px","height":"40px"}'  v-if="type!='info'" type="primary" class="btn-success" @click="onSubmit">提交</el-button>
				<el-button :style='{"border":"1px solid #ccc","cursor":"pointer","padding":"0 30px","margin":"0","outline":"none","color":"#333","borderRadius":"4px","background":"url(http://codegen.caihongy.cn/20221207/a9d275fd8e5f4ababbf9129cc1d20492.png) no-repeat center top / 100% 100%,rgba(255,255,255,.8)","width":"auto","lineHeight":"40px","fontSize":"14px","height":"40px"}' v-if="type!='info'" class="btn-close" @click="back()">取消</el-button>
				<el-button :style='{"border":"1px solid #ccc","cursor":"pointer","padding":"0 30px","margin":"0","outline":"none","color":"#333","borderRadius":"4px","background":"url(http://codegen.caihongy.cn/20221207/a9d275fd8e5f4ababbf9129cc1d20492.png) no-repeat center top / 100% 100%,rgba(255,255,255,.8)","width":"auto","lineHeight":"40px","fontSize":"14px","height":"40px"}' v-if="type=='info'" class="btn-close" @click="back()">返回</el-button>
			</el-form-item>
		</el-form>
    

  </div>
</template>
<script>
// 数字，邮件，手机，url，身份证校验
import { isNumber,isIntNumer,isEmail,isPhone, isMobile,isURL,checkIdCard } from "@/utils/validate";
export default {
	data() {
		let self = this
		var validateIdCard = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!checkIdCard(value)) {
				callback(new Error("请输入正确的身份证号码"));
			} else {
				callback();
			}
		};
		var validateUrl = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isURL(value)) {
				callback(new Error("请输入正确的URL地址"));
			} else {
				callback();
			}
		};
		var validateMobile = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isMobile(value)) {
				callback(new Error("请输入正确的手机号码"));
			} else {
				callback();
			}
		};
		var validatePhone = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isPhone(value)) {
				callback(new Error("请输入正确的电话号码"));
			} else {
				callback();
			}
		};
		var validateEmail = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isEmail(value)) {
				callback(new Error("请输入正确的邮箱地址"));
			} else {
				callback();
			}
		};
		var validateNumber = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isNumber(value)) {
				callback(new Error("请输入数字"));
			} else {
				callback();
			}
		};
		var validateIntNumber = (rule, value, callback) => {
			if(!value){
				callback();
			} else if (!isIntNumer(value)) {
				callback(new Error("请输入整数"));
			} else {
				callback();
			}
		};
		return {
			id: '',
			type: '',
			
			
			ro:{
				xianlubianhao : false,
				xianlumingcheng : false,
				xianlutupian : false,
				piaojia : false,
				banci : false,
				fachejiange : false,
				qishidian : false,
				tujingdi : false,
				zhongzhidian : false,
				cheliangmingcheng : false,
				chepaihao : false,
				luxianxiangqing : false,
				gengxinshijian : false,
			},
			
			
			ruleForm: {
				xianlubianhao: this.getUUID(),
				xianlumingcheng: '',
				xianlutupian: '',
				piaojia: '',
				banci: '',
				fachejiange: '',
				qishidian: '',
				tujingdi: '',
				zhongzhidian: '',
				cheliangmingcheng: '',
				chepaihao: '',
				luxianxiangqing: '',
				gengxinshijian: '',
			},
		
			qishidianOptions: [],
			zhongzhidianOptions: [],
			cheliangmingchengOptions: [],
			
			rules: {
				xianlubianhao: [
				],
				xianlumingcheng: [
				],
				xianlutupian: [
				],
				piaojia: [
					{ validator: validateNumber, trigger: 'blur' },
				],
				banci: [
				],
				fachejiange: [
				],
				qishidian: [
				],
				tujingdi: [
				],
				zhongzhidian: [
				],
				cheliangmingcheng: [
				],
				chepaihao: [
				],
				luxianxiangqing: [
				],
				gengxinshijian: [
				],
			}
		};
	},
	props: ["parent"],
	computed: {



	},
	created() {
		this.ruleForm.gengxinshijian = this.getCurDate()
	},
	methods: {
		
		// 下载
		download(file){
			window.open(`${file}`)
		},
		// 初始化
		init(id,type) {
			if (id) {
				this.id = id;
				this.type = type;
			}
			if(this.type=='info'||this.type=='else'){
				this.info(id);
			}else if(this.type=='logistics'){
				this.logistics=false;
				this.info(id);
			}else if(this.type=='cross'){
				var obj = this.$storage.getObj('crossObj');
				for (var o in obj){
						if(o=='xianlubianhao'){
							this.ruleForm.xianlubianhao = obj[o];
							this.ro.xianlubianhao = true;
							continue;
						}
						if(o=='xianlumingcheng'){
							this.ruleForm.xianlumingcheng = obj[o];
							this.ro.xianlumingcheng = true;
							continue;
						}
						if(o=='xianlutupian'){
							this.ruleForm.xianlutupian = obj[o];
							this.ro.xianlutupian = true;
							continue;
						}
						if(o=='piaojia'){
							this.ruleForm.piaojia = obj[o];
							this.ro.piaojia = true;
							continue;
						}
						if(o=='banci'){
							this.ruleForm.banci = obj[o];
							this.ro.banci = true;
							continue;
						}
						if(o=='fachejiange'){
							this.ruleForm.fachejiange = obj[o];
							this.ro.fachejiange = true;
							continue;
						}
						if(o=='qishidian'){
							this.ruleForm.qishidian = obj[o];
							this.ro.qishidian = true;
							continue;
						}
						if(o=='tujingdi'){
							this.ruleForm.tujingdi = obj[o];
							this.ro.tujingdi = true;
							continue;
						}
						if(o=='zhongzhidian'){
							this.ruleForm.zhongzhidian = obj[o];
							this.ro.zhongzhidian = true;
							continue;
						}
						if(o=='cheliangmingcheng'){
							this.ruleForm.cheliangmingcheng = obj[o];
							this.ro.cheliangmingcheng = true;
							continue;
						}
						if(o=='chepaihao'){
							this.ruleForm.chepaihao = obj[o];
							this.ro.chepaihao = true;
							continue;
						}
						if(o=='luxianxiangqing'){
							this.ruleForm.luxianxiangqing = obj[o];
							this.ro.luxianxiangqing = true;
							continue;
						}
						if(o=='gengxinshijian'){
							this.ruleForm.gengxinshijian = obj[o];
							this.ro.gengxinshijian = true;
							continue;
						}
				}
				













			}
			
			
			// 获取用户信息
			this.$http({
				url: `${this.$storage.get('sessionTable')}/session`,
				method: "get"
			}).then(({ data }) => {
				if (data && data.code === 0) {
					
					var json = data.data;
				} else {
					this.$message.error(data.msg);
				}
			});
			
            this.$http({
				url: `option/zhandianxinxi/zhandianmingcheng`,
				method: "get"
            }).then(({ data }) => {
				if (data && data.code === 0) {
					this.qishidianOptions = data.data;
				} else {
					this.$message.error(data.msg);
				}
            });
            this.$http({
				url: `option/zhandianxinxi/zhandianmingcheng`,
				method: "get"
            }).then(({ data }) => {
				if (data && data.code === 0) {
					this.zhongzhidianOptions = data.data;
				} else {
					this.$message.error(data.msg);
				}
            });
            this.$http({
				url: `option/gongjiaochexinxi/cheliangmingcheng`,
				method: "get"
            }).then(({ data }) => {
				if (data && data.code === 0) {
					this.cheliangmingchengOptions = data.data;
				} else {
					this.$message.error(data.msg);
				}
            });
			
		},
			// 下二随
			cheliangmingchengChange () {
				this.$http({
					url: `follow/gongjiaochexinxi/cheliangmingcheng?columnValue=`+ this.ruleForm.cheliangmingcheng,
					method: "get"
				}).then(({ data }) => {
					if (data && data.code === 0) {
						if(data.data.chepaihao){
							this.ruleForm.chepaihao = data.data.chepaihao
						}
					} else {
						this.$message.error(data.msg);
					}
				});
			},
    // 多级联动参数

    info(id) {
      this.$http({
        url: `gongjiaoluxian/info/${id}`,
        method: "get"
      }).then(({ data }) => {
        if (data && data.code === 0) {
        this.ruleForm = data.data;
        //解决前台上传图片后台不显示的问题
        let reg=new RegExp('../../../upload','g')//g代表全部
        this.ruleForm.luxianxiangqing = this.ruleForm.luxianxiangqing.replace(reg,'../../../springboot097f4/upload');
        } else {
          this.$message.error(data.msg);
        }
      });
    },


    // 提交
    onSubmit() {






	if(this.ruleForm.xianlutupian!=null) {
		this.ruleForm.xianlutupian = this.ruleForm.xianlutupian.replace(new RegExp(this.$base.url,"g"),"");
	}





















var objcross = this.$storage.getObj('crossObj');

      //更新跨表属性
       var crossuserid;
       var crossrefid;
       var crossoptnum;
       if(this.type=='cross'){
                var statusColumnName = this.$storage.get('statusColumnName');
                var statusColumnValue = this.$storage.get('statusColumnValue');
                if(statusColumnName!='') {
                        var obj = this.$storage.getObj('crossObj');
                       if(statusColumnName && !statusColumnName.startsWith("[")) {
                               for (var o in obj){
                                 if(o==statusColumnName){
                                   obj[o] = statusColumnValue;
                                 }
                               }
                               var table = this.$storage.get('crossTable');
                             this.$http({
                                 url: `${table}/update`,
                                 method: "post",
                                 data: obj
                               }).then(({ data }) => {});
                       } else {
                               crossuserid=this.$storage.get('userid');
                               crossrefid=obj['id'];
                               crossoptnum=this.$storage.get('statusColumnName');
                               crossoptnum=crossoptnum.replace(/\[/,"").replace(/\]/,"");
                        }
                }
        }
       this.$refs["ruleForm"].validate(valid => {
         if (valid) {
		 if(crossrefid && crossuserid) {
			 this.ruleForm.crossuserid = crossuserid;
			 this.ruleForm.crossrefid = crossrefid;
			let params = { 
				page: 1, 
				limit: 10, 
				crossuserid:this.ruleForm.crossuserid,
				crossrefid:this.ruleForm.crossrefid,
			} 
			this.$http({ 
				url: "gongjiaoluxian/page", 
				method: "get", 
				params: params 
			}).then(({ 
				data 
			}) => { 
				if (data && data.code === 0) { 
				       if(data.data.total>=crossoptnum) {
					     this.$message.error(this.$storage.get('tips'));
					       return false;
				       } else {
					 this.$http({
					   url: `gongjiaoluxian/${!this.ruleForm.id ? "save" : "update"}`,
					   method: "post",
					   data: this.ruleForm
					 }).then(({ data }) => {
					   if (data && data.code === 0) {
					     this.$message({
					       message: "操作成功",
					       type: "success",
					       duration: 1500,
					       onClose: () => {
						 this.parent.showFlag = true;
						 this.parent.addOrUpdateFlag = false;
						 this.parent.gongjiaoluxianCrossAddOrUpdateFlag = false;
						 this.parent.search();
						 this.parent.contentStyleChange();
					       }
					     });
					   } else {
					     this.$message.error(data.msg);
					   }
					 });

				       }
				} else { 
				} 
			});
		 } else {
			 this.$http({
			   url: `gongjiaoluxian/${!this.ruleForm.id ? "save" : "update"}`,
			   method: "post",
			   data: this.ruleForm
			 }).then(({ data }) => {
			   if (data && data.code === 0) {
			     this.$message({
			       message: "操作成功",
			       type: "success",
			       duration: 1500,
			       onClose: () => {
				 this.parent.showFlag = true;
				 this.parent.addOrUpdateFlag = false;
				 this.parent.gongjiaoluxianCrossAddOrUpdateFlag = false;
				 this.parent.search();
				 this.parent.contentStyleChange();
			       }
			     });
			   } else {
			     this.$message.error(data.msg);
			   }
			 });
		 }
         }
       });
    },
    // 获取uuid
    getUUID () {
      return new Date().getTime();
    },
    // 返回
    back() {
      this.parent.showFlag = true;
      this.parent.addOrUpdateFlag = false;
      this.parent.gongjiaoluxianCrossAddOrUpdateFlag = false;
      this.parent.contentStyleChange();
    },
    xianlutupianUploadChange(fileUrls) {
	    this.ruleForm.xianlutupian = fileUrls;
    },
  }
};
</script>
<style lang="scss" scoped>
	.amap-wrapper {
		width: 100%;
		height: 500px;
	}
	
	.search-box {
		position: absolute;
	}
	
	.el-date-editor.el-input {
		width: auto;
	}
	
	.add-update-preview .el-form-item ::v-deep .el-form-item__label {
	  	  padding: 0 10px 0 0;
	  	  text-shadow: 0 1px 10px #fff;
	  	  color: #666;
	  	  width: 80px;
	  	  font-size: 14px;
	  	  line-height: 40px;
	  	  text-align: right;
	  	}
	
	.add-update-preview .el-form-item ::v-deep .el-form-item__content {
	  margin-left: 80px;
	}
	
	.add-update-preview .el-input ::v-deep .el-input__inner {
	  	  border: 1px solid #333;
	  	  border-radius: 4px;
	  	  padding: 0 12px;
	  	  box-shadow: 0 0 1px #4b681d;
	  	  outline: none;
	  	  color: #666;
	  	  width: 400px;
	  	  font-size: 14px;
	  	  height: 40px;
	  	}
	
	.add-update-preview .el-select ::v-deep .el-input__inner {
	  	  border: 1px solid #333;
	  	  border-radius: 4px;
	  	  padding: 0 10px;
	  	  box-shadow: 0 0 1px #4b681d;
	  	  outline: none;
	  	  color: #666;
	  	  width: 200px;
	  	  font-size: 14px;
	  	  height: 40px;
	  	}
	
	.add-update-preview .el-date-editor ::v-deep .el-input__inner {
	  	  border: 1px solid #333;
	  	  border-radius: 4px;
	  	  padding: 0 10px 0 30px;
	  	  box-shadow: 0 0 1px #4b681d;
	  	  outline: none;
	  	  color: #666;
	  	  width: 200px;
	  	  font-size: 14px;
	  	  height: 40px;
	  	}
	
	.add-update-preview ::v-deep .el-upload--picture-card {
		background: transparent;
		border: 0;
		border-radius: 0;
		width: auto;
		height: auto;
		line-height: initial;
		vertical-align: middle;
	}
	
	.add-update-preview ::v-deep .upload .upload-img {
	  	  border: 1px solid #333;
	  	  cursor: pointer;
	  	  border-radius: 6px;
	  	  color: #666;
	  	  width: 200px;
	  	  font-size: 32px;
	  	  line-height: 100px;
	  	  text-align: center;
	  	  height: 100px;
	  	}
	
	.add-update-preview ::v-deep .el-upload-list .el-upload-list__item {
	  	  border: 1px solid #333;
	  	  cursor: pointer;
	  	  border-radius: 6px;
	  	  color: #666;
	  	  width: 200px;
	  	  font-size: 32px;
	  	  line-height: 100px;
	  	  text-align: center;
	  	  height: 100px;
	  	}
	
	.add-update-preview ::v-deep .el-upload .el-icon-plus {
	  	  border: 1px solid #333;
	  	  cursor: pointer;
	  	  border-radius: 6px;
	  	  color: #666;
	  	  width: 200px;
	  	  font-size: 32px;
	  	  line-height: 100px;
	  	  text-align: center;
	  	  height: 100px;
	  	}
	
	.add-update-preview .el-textarea ::v-deep .el-textarea__inner {
	  	  border: 1px solid #333;
	  	  border-radius: 4px;
	  	  padding: 12px;
	  	  box-shadow: 0 0 1px #4b681d;
	  	  outline: none;
	  	  color: #666;
	  	  width: 400px;
	  	  font-size: 14px;
	  	  min-height: 120px;
	  	  height: auto;
	  	}
</style>
