package com.dao;

import com.entity.XianluweihuEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.XianluweihuVO;
import com.entity.view.XianluweihuView;


/**
 * 线路维护
 * 
 * @author 
 * @email 
 * @date 2023-03-18 15:01:59
 */
public interface XianluweihuDao extends BaseMapper<XianluweihuEntity> {
	
	List<XianluweihuVO> selectListVO(@Param("ew") Wrapper<XianluweihuEntity> wrapper);
	
	XianluweihuVO selectVO(@Param("ew") Wrapper<XianluweihuEntity> wrapper);
	
	List<XianluweihuView> selectListView(@Param("ew") Wrapper<XianluweihuEntity> wrapper);

	List<XianluweihuView> selectListView(Pagination page,@Param("ew") Wrapper<XianluweihuEntity> wrapper);
	
	XianluweihuView selectView(@Param("ew") Wrapper<XianluweihuEntity> wrapper);
	

}
