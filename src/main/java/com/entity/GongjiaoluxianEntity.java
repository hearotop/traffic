package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;


/**
 * 公交路线
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2023-03-18 15:01:59
 */
@TableName("gongjiaoluxian")
public class GongjiaoluxianEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public GongjiaoluxianEntity() {
		
	}
	
	public GongjiaoluxianEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 主键id
	 */
	@TableId
	private Long id;
	/**
	 * 线路编号
	 */
					
	private String xianlubianhao;
	
	/**
	 * 线路名称
	 */
					
	private String xianlumingcheng;
	
	/**
	 * 线路图片
	 */
					
	private String xianlutupian;
	
	/**
	 * 票价
	 */
					
	private Float piaojia;
	
	/**
	 * 班次
	 */
					
	private String banci;
	
	/**
	 * 发车间隔
	 */
					
	private String fachejiange;
	
	/**
	 * 起始点
	 */
					
	private String qishidian;
	
	/**
	 * 途径地
	 */
					
	private String tujingdi;
	
	/**
	 * 终止点
	 */
					
	private String zhongzhidian;
	
	/**
	 * 车辆名称
	 */
					
	private String cheliangmingcheng;
	
	/**
	 * 车牌号
	 */
					
	private String chepaihao;
	
	/**
	 * 路线详情
	 */
					
	private String luxianxiangqing;
	
	/**
	 * 更新时间
	 */
				
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd")
	@DateTimeFormat 		
	private Date gengxinshijian;
	
	
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 设置：线路编号
	 */
	public void setXianlubianhao(String xianlubianhao) {
		this.xianlubianhao = xianlubianhao;
	}
	/**
	 * 获取：线路编号
	 */
	public String getXianlubianhao() {
		return xianlubianhao;
	}
	/**
	 * 设置：线路名称
	 */
	public void setXianlumingcheng(String xianlumingcheng) {
		this.xianlumingcheng = xianlumingcheng;
	}
	/**
	 * 获取：线路名称
	 */
	public String getXianlumingcheng() {
		return xianlumingcheng;
	}
	/**
	 * 设置：线路图片
	 */
	public void setXianlutupian(String xianlutupian) {
		this.xianlutupian = xianlutupian;
	}
	/**
	 * 获取：线路图片
	 */
	public String getXianlutupian() {
		return xianlutupian;
	}
	/**
	 * 设置：票价
	 */
	public void setPiaojia(Float piaojia) {
		this.piaojia = piaojia;
	}
	/**
	 * 获取：票价
	 */
	public Float getPiaojia() {
		return piaojia;
	}
	/**
	 * 设置：班次
	 */
	public void setBanci(String banci) {
		this.banci = banci;
	}
	/**
	 * 获取：班次
	 */
	public String getBanci() {
		return banci;
	}
	/**
	 * 设置：发车间隔
	 */
	public void setFachejiange(String fachejiange) {
		this.fachejiange = fachejiange;
	}
	/**
	 * 获取：发车间隔
	 */
	public String getFachejiange() {
		return fachejiange;
	}
	/**
	 * 设置：起始点
	 */
	public void setQishidian(String qishidian) {
		this.qishidian = qishidian;
	}
	/**
	 * 获取：起始点
	 */
	public String getQishidian() {
		return qishidian;
	}
	/**
	 * 设置：途径地
	 */
	public void setTujingdi(String tujingdi) {
		this.tujingdi = tujingdi;
	}
	/**
	 * 获取：途径地
	 */
	public String getTujingdi() {
		return tujingdi;
	}
	/**
	 * 设置：终止点
	 */
	public void setZhongzhidian(String zhongzhidian) {
		this.zhongzhidian = zhongzhidian;
	}
	/**
	 * 获取：终止点
	 */
	public String getZhongzhidian() {
		return zhongzhidian;
	}
	/**
	 * 设置：车辆名称
	 */
	public void setCheliangmingcheng(String cheliangmingcheng) {
		this.cheliangmingcheng = cheliangmingcheng;
	}
	/**
	 * 获取：车辆名称
	 */
	public String getCheliangmingcheng() {
		return cheliangmingcheng;
	}
	/**
	 * 设置：车牌号
	 */
	public void setChepaihao(String chepaihao) {
		this.chepaihao = chepaihao;
	}
	/**
	 * 获取：车牌号
	 */
	public String getChepaihao() {
		return chepaihao;
	}
	/**
	 * 设置：路线详情
	 */
	public void setLuxianxiangqing(String luxianxiangqing) {
		this.luxianxiangqing = luxianxiangqing;
	}
	/**
	 * 获取：路线详情
	 */
	public String getLuxianxiangqing() {
		return luxianxiangqing;
	}
	/**
	 * 设置：更新时间
	 */
	public void setGengxinshijian(Date gengxinshijian) {
		this.gengxinshijian = gengxinshijian;
	}
	/**
	 * 获取：更新时间
	 */
	public Date getGengxinshijian() {
		return gengxinshijian;
	}

}
