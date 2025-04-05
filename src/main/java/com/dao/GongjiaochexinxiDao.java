package com.dao;

import com.entity.GongjiaochexinxiEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.GongjiaochexinxiVO;
import com.entity.view.GongjiaochexinxiView;


/**
 * 公交车信息
 * 
 * @author 
 * @email 
 * @date 2023-03-18 15:01:59
 */
public interface GongjiaochexinxiDao extends BaseMapper<GongjiaochexinxiEntity> {
	
	List<GongjiaochexinxiVO> selectListVO(@Param("ew") Wrapper<GongjiaochexinxiEntity> wrapper);
	
	GongjiaochexinxiVO selectVO(@Param("ew") Wrapper<GongjiaochexinxiEntity> wrapper);
	
	List<GongjiaochexinxiView> selectListView(@Param("ew") Wrapper<GongjiaochexinxiEntity> wrapper);

	List<GongjiaochexinxiView> selectListView(Pagination page,@Param("ew") Wrapper<GongjiaochexinxiEntity> wrapper);
	
	GongjiaochexinxiView selectView(@Param("ew") Wrapper<GongjiaochexinxiEntity> wrapper);
	

}
