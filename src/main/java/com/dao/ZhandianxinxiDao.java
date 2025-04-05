package com.dao;

import com.entity.ZhandianxinxiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.ZhandianxinxiVO;
import com.entity.view.ZhandianxinxiView;


/**
 * 站点信息
 * 
 * @author 
 * @email 
 * @date 2023-03-18 15:01:59
 */
public interface ZhandianxinxiDao extends BaseMapper<ZhandianxinxiEntity> {
	
	List<ZhandianxinxiVO> selectListVO(@Param("ew") Wrapper<ZhandianxinxiEntity> wrapper);
	
	ZhandianxinxiVO selectVO(@Param("ew") Wrapper<ZhandianxinxiEntity> wrapper);
	
	List<ZhandianxinxiView> selectListView(@Param("ew") Wrapper<ZhandianxinxiEntity> wrapper);

	List<ZhandianxinxiView> selectListView(Pagination page,@Param("ew") Wrapper<ZhandianxinxiEntity> wrapper);
	
	ZhandianxinxiView selectView(@Param("ew") Wrapper<ZhandianxinxiEntity> wrapper);
	

}
