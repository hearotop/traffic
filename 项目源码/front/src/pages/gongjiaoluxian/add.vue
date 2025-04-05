<template>
<div :style='{"width":"100%","padding":"40px 7%","margin":"0 auto","position":"relative","background":"url(http://codegen.caihongy.cn/20230202/738791e5d58a4645a4ee25591f67fcca.jpg) no-repeat left top / 600px auto,url(http://codegen.caihongy.cn/20230202/8ab48bc29535492eb17dd1756fd6f963.jpg) no-repeat right bottom / 600px auto"}'>
    <el-form
      class="add-update-preview"
      ref="ruleForm"
      :model="ruleForm"
      :rules="rules"
      label-width="150px"
    >
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"none"}' label="线路编号" prop="xianlubianhao">
              <el-input v-model="ruleForm.xianlubianhao" placeholder="线路编号" readonly></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"none"}' label="线路名称" prop="xianlumingcheng">
            <el-input v-model="ruleForm.xianlumingcheng" 
                placeholder="线路名称" clearable ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"none"}' label="线路图片" v-if="type!='cross' || (type=='cross' && !ro.xianlutupian)" prop="xianlutupian">
            <file-upload
            tip="点击上传线路图片"
            action="file/upload"
            :limit="3"
            :multiple="true"
            :fileUrls="ruleForm.xianlutupian?ruleForm.xianlutupian:''"
            @change="xianlutupianUploadChange"
            ></file-upload>
          </el-form-item>
            <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"none"}' class="upload" v-else label="线路图片" prop="xianlutupian">
                <img v-if="ruleForm.xianlutupian.substring(0,4)=='http'" class="upload-img" style="margin-right:20px;" v-bind:key="index" :src="ruleForm.xianlutupian.split(',')[0]" width="100" height="100">
                <img v-else class="upload-img" style="margin-right:20px;" v-bind:key="index" v-for="(item,index) in ruleForm.xianlutupian.split(',')" :src="baseUrl+item" width="100" height="100">
            </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"none"}' label="票价" prop="piaojia">
            <el-input v-model="ruleForm.piaojia" 
                placeholder="票价" clearable ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"none"}' label="班次" prop="banci">
            <el-input v-model="ruleForm.banci" 
                placeholder="班次" clearable ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"none"}' label="发车间隔" prop="fachejiange">
            <el-input v-model="ruleForm.fachejiange" 
                placeholder="发车间隔" clearable ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"none"}'  label="起始点" prop="qishidian">
            <el-select v-model="ruleForm.qishidian" placeholder="请选择起始点"  >
              <el-option
                  v-for="(item,index) in qishidianOptions"
                  :key="index"
                  :label="item"
                  :value="item">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"none"}' label="途径地" prop="tujingdi">
            <el-input v-model="ruleForm.tujingdi" 
                placeholder="途径地" clearable ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"none"}'  label="终止点" prop="zhongzhidian">
            <el-select v-model="ruleForm.zhongzhidian" placeholder="请选择终止点"  >
              <el-option
                  v-for="(item,index) in zhongzhidianOptions"
                  :key="index"
                  :label="item"
                  :value="item">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"none"}' label="车辆名称" prop="cheliangmingcheng">
            <el-select  @change="cheliangmingchengChange" v-model="ruleForm.cheliangmingcheng" placeholder="请选择车辆名称">
              <el-option
                  v-for="(item,index) in cheliangmingchengOptions"
                  :key="index"
                  :label="item"
                  :value="item">
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"none"}' label="车牌号" prop="chepaihao">
            <el-input v-model="ruleForm.chepaihao" 
                placeholder="车牌号" clearable ></el-input>
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"none"}' label="更新时间" prop="gengxinshijian" >
              <el-date-picker
                  format="yyyy 年 MM 月 dd 日"
                  value-format="yyyy-MM-dd"
                  v-model="ruleForm.gengxinshijian" 
                  type="date"
                  placeholder="更新时间">
              </el-date-picker> 
          </el-form-item>
          <el-form-item :style='{"padding":"10px","margin":"0 0 10px","background":"none"}' label="路线详情" prop="luxianxiangqing">
            <editor 
                :style='{"padding":"0","boxShadow":"0 0 0px rgba(75,223,201,.5)","margin":"0","borderColor":"#ccc","backgroundColor":"#fff","borderRadius":"0","borderWidth":"1px","width":"100%","borderStyle":"solid","height":"auto"}'
                v-model="ruleForm.luxianxiangqing" 
                class="editor" 
                action="file/upload">
            </editor>
          </el-form-item>

      <el-form-item :style='{"padding":"0","textAlign":"left","margin":"0"}'>
        <el-button :style='{"border":"0","cursor":"pointer","padding":"0 15px","margin":"0 10px","color":"rgba(255, 255, 255, 1)","minWidth":"140px","outline":"none","borderRadius":"0","background":"#000","width":"auto","lineHeight":"44px","fontSize":"14px","height":"44px"}'  type="primary" @click="onSubmit">提交</el-button>
        <el-button :style='{"border":"0px solid rgba(64, 158, 255, 1)","cursor":"pointer","padding":"0 15px","margin":"0 10px","color":"#fff","minWidth":"150px","outline":"none","borderRadius":"0","background":"#f50000","width":"auto","lineHeight":"44px","fontSize":"14px","height":"44px"}' @click="back()">返回</el-button>
      </el-form-item>
    </el-form>
</div>
</template>

<script>
  export default {
    data() {
      return {
        id: '',
        baseUrl: '',
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
        type: '',
        userTableName: localStorage.getItem('UserTableName'),
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
            { validator: this.$validate.isNumber, trigger: 'blur' },
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
        },
      };
    },
    computed: {



    },
    created() {
	  //this.bg();
      let type = this.$route.query.type ? this.$route.query.type : '';
      this.init(type);
      this.baseUrl = this.$config.baseUrl;
      this.ruleForm.gengxinshijian = this.getCurDate()
    },
    methods: {
      getMakeZero(s) {
          return s < 10 ? '0' + s : s;
      },
      // 下载
      download(file){
        window.open(`${file}`)
      },
      // 初始化
      init(type) {
        this.type = type;
        if(type=='cross'){
          var obj = JSON.parse(localStorage.getItem('crossObj'));
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
              this.ruleForm.xianlutupian = obj[o].split(",")[0];
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
        this.$http.get(this.userTableName + '/session', {emulateJSON: true}).then(res => {
          if (res.data.code == 0) {
            var json = res.data.data;
          }
        });
        this.$http.get('option/zhandianxinxi/zhandianmingcheng', {emulateJSON: true}).then(res => {
          if (res.data.code == 0) {
            this.qishidianOptions = res.data.data;
          }
        });
        this.$http.get('option/zhandianxinxi/zhandianmingcheng', {emulateJSON: true}).then(res => {
          if (res.data.code == 0) {
            this.zhongzhidianOptions = res.data.data;
          }
        });
        this.$http.get('option/gongjiaochexinxi/cheliangmingcheng', {emulateJSON: true}).then(res => {
          if (res.data.code == 0) {
            this.cheliangmingchengOptions = res.data.data;
          }
        });
      },
      // 下二随
      cheliangmingchengChange () {
        this.$http.get('follow/gongjiaochexinxi/cheliangmingcheng?columnValue=' + this.ruleForm.cheliangmingcheng, {emulateJSON: true}).then(res => {
          if (res.data.code == 0) {
            if(res.data.data.chepaihao){
              this.ruleForm.chepaihao = res.data.data.chepaihao
            }
          }
        });
      },

    // 多级联动参数
      // 多级联动参数
      info(id) {
        this.$http.get('gongjiaoluxian/detail/${id}', {emulateJSON: true}).then(res => {
          if (res.data.code == 0) {
            this.ruleForm = res.data.data;
          }
        });
      },
      // 提交
      onSubmit() {

        //更新跨表属性
        var crossuserid;
        var crossrefid;
        var crossoptnum;
        this.$refs["ruleForm"].validate(valid => {
          if(valid) {
            if(this.type=='cross'){
                 var statusColumnName = localStorage.getItem('statusColumnName');
                 var statusColumnValue = localStorage.getItem('statusColumnValue');
                 if(statusColumnName && statusColumnName!='') {
                     var obj = JSON.parse(localStorage.getItem('crossObj'));
                     if(!statusColumnName.startsWith("[")) {
                         for (var o in obj){
                             if(o==statusColumnName){
                                 obj[o] = statusColumnValue;
                             }
                         }
                         var table = localStorage.getItem('crossTable');
                         this.$http.post(table+'/update', obj).then(res => {});
                     } else {
                            crossuserid=Number(localStorage.getItem('userid'));
                            crossrefid=obj['id'];
                            crossoptnum=localStorage.getItem('statusColumnName');
                            crossoptnum=crossoptnum.replace(/\[/,"").replace(/\]/,"");
                     }
                 }
            }
            if(crossrefid && crossuserid) {
                 this.ruleForm.crossuserid=crossuserid;
                 this.ruleForm.crossrefid=crossrefid;
                 var params = {
                     page: 1,
                     limit: 10,
                     crossuserid:crossuserid,
                     crossrefid:crossrefid,
                 }
                 this.$http.get('gongjiaoluxian/list', {
                  params: params
                 }).then(res => {
                     if(res.data.data.total>=crossoptnum) {
                         this.$message({
                          message: localStorage.getItem('tips'),
                          type: 'success',
                          duration: 1500,
                         });
                          return false;
                     } else {
                         // 跨表计算


                          this.$http.post('gongjiaoluxian/add', this.ruleForm).then(res => {
                              if (res.data.code == 0) {
                                  this.$message({
                                      message: '操作成功',
                                      type: 'success',
                                      duration: 1500,
                                      onClose: () => {
                                          this.$router.go(-1);
                                      }
                                  });
                              } else {
                                  this.$message({
                                      message: res.data.msg,
                                      type: 'error',
                                      duration: 1500
                                  });
                              }
                          });
                     }
                 });
             } else {


                  this.$http.post('gongjiaoluxian/add', this.ruleForm).then(res => {
                     if (res.data.code == 0) {
                          this.$message({
                              message: '操作成功',
                              type: 'success',
                              duration: 1500,
                              onClose: () => {
                                  this.$router.go(-1);
                              }
                          });
                      } else {
                          this.$message({
                              message: res.data.msg,
                              type: 'error',
                              duration: 1500
                          });
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
        this.$router.go(-1);
      },
      xianlutupianUploadChange(fileUrls) {
          this.ruleForm.xianlutupian = fileUrls.replace(new RegExp(this.$config.baseUrl,"g"),"");;
      },
    }
  };
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.el-date-editor.el-input {
		width: auto;
	}
	
	.add-update-preview .el-form-item ::v-deep .el-form-item__label {
	  padding: 0 15px;
	  color: #333;
	  font-weight: 500;
	  width: 150px;
	  font-size: 15px;
	  line-height: 40px;
	  text-align: right;
	}
	
	.add-update-preview .el-form-item ::v-deep .el-form-item__content {
	  margin-left: 150px;
	}
	
	.add-update-preview .el-input ::v-deep .el-input__inner {
	  border: 1px solid #ccc;
	  border-radius: 0;
	  padding: 0 10px;
	  box-shadow: 0 0 0px rgba(64, 158, 255, .5);
	  outline: none;
	  color: #333;
	  width: 400px;
	  font-size: 14px;
	  height: 40px;
	}
	
	.add-update-preview .el-select ::v-deep .el-input__inner {
	  border: 1px solid #ccc;
	  border-radius: 0;
	  padding: 0 10px;
	  box-shadow: 0 0 0px rgba(64, 158, 255, .5);
	  outline: none;
	  color: #333;
	  width: 200px;
	  font-size: 14px;
	  height: 40px;
	}
	
	.add-update-preview .el-date-editor ::v-deep .el-input__inner {
	  border: 1px solid #ccc;
	  border-radius: 0;
	  padding: 0 10px 0 30px;
	  box-shadow: 0 0 0px rgba(64, 158, 255, .5);
	  outline: none;
	  color: #333;
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
	  border: 1px dashed #e99595;
	  cursor: pointer;
	  border-radius: 6px;
	  color: #e99595;
	  width: 100px;
	  font-size: 32px;
	  line-height: 100px;
	  text-align: center;
	  height: 100px;
	}
	
	.add-update-preview ::v-deep .el-upload-list .el-upload-list__item {
	  border: 1px dashed #e99595;
	  cursor: pointer;
	  border-radius: 6px;
	  color: #e99595;
	  width: 100px;
	  font-size: 32px;
	  line-height: 100px;
	  text-align: center;
	  height: 100px;
	}
	
	.add-update-preview ::v-deep .el-upload .el-icon-plus {
	  border: 1px dashed #e99595;
	  cursor: pointer;
	  border-radius: 6px;
	  color: #e99595;
	  width: 100px;
	  font-size: 32px;
	  line-height: 100px;
	  text-align: center;
	  height: 100px;
	}
	
	.add-update-preview .el-textarea ::v-deep .el-textarea__inner {
	  border: 1px solid #ccc;
	  border-radius: 0;
	  padding: 12px;
	  box-shadow: 0 0 0px rgba(64, 158, 255, .5);
	  outline: none;
	  color: #333;
	  width: 400px;
	  font-size: 14px;
	  height: 120px;
	}
</style>
