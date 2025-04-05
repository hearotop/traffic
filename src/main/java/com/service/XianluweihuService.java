package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.XianluweihuEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.XianluweihuVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.XianluweihuView;


/**
 * 线路维护
 *
 * @author 
 * @email 
 * @date 2023-03-18 15:01:59
 */
public interface XianluweihuService extends IService<XianluweihuEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<XianluweihuVO> selectListVO(Wrapper<XianluweihuEntity> wrapper);
   	
   	XianluweihuVO selectVO(@Param("ew") Wrapper<XianluweihuEntity> wrapper);
   	
   	List<XianluweihuView> selectListView(Wrapper<XianluweihuEntity> wrapper);
   	
   	XianluweihuView selectView(@Param("ew") Wrapper<XianluweihuEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<XianluweihuEntity> wrapper);
   	

}

