package com.entity.view;

import com.entity.XianluweihuEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 线路维护
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2023-03-18 15:01:59
 */
@TableName("xianluweihu")
public class XianluweihuView  extends XianluweihuEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public XianluweihuView(){
	}
 
 	public XianluweihuView(XianluweihuEntity xianluweihuEntity){
 	try {
			BeanUtils.copyProperties(this, xianluweihuEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
