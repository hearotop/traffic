package com.entity.vo;

import com.entity.ZhandianxinxiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
 

/**
 * 站点信息
 * 手机端接口返回实体辅助类 
 * （主要作用去除一些不必要的字段）
 * @author 
 * @email 
 * @date 2023-03-18 15:01:59
 */
public class ZhandianxinxiVO  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
	/**
	 * 站点图片
	 */
	
	private String zhandiantupian;
		
	/**
	 * 站点地址
	 */
	
	private String zhandiandizhi;
		
	/**
	 * 途径车辆
	 */
	
	private String tujingcheliang;
		
	/**
	 * 发布日期
	 */
		
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 
	private Date faburiqi;
				
	
	/**
	 * 设置：站点图片
	 */
	 
	public void setZhandiantupian(String zhandiantupian) {
		this.zhandiantupian = zhandiantupian;
	}
	
	/**
	 * 获取：站点图片
	 */
	public String getZhandiantupian() {
		return zhandiantupian;
	}
				
	
	/**
	 * 设置：站点地址
	 */
	 
	public void setZhandiandizhi(String zhandiandizhi) {
		this.zhandiandizhi = zhandiandizhi;
	}
	
	/**
	 * 获取：站点地址
	 */
	public String getZhandiandizhi() {
		return zhandiandizhi;
	}
				
	
	/**
	 * 设置：途径车辆
	 */
	 
	public void setTujingcheliang(String tujingcheliang) {
		this.tujingcheliang = tujingcheliang;
	}
	
	/**
	 * 获取：途径车辆
	 */
	public String getTujingcheliang() {
		return tujingcheliang;
	}
				
	
	/**
	 * 设置：发布日期
	 */
	 
	public void setFaburiqi(Date faburiqi) {
		this.faburiqi = faburiqi;
	}
	
	/**
	 * 获取：发布日期
	 */
	public Date getFaburiqi() {
		return faburiqi;
	}
			
}
