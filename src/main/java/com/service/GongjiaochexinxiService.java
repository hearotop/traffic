package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.GongjiaochexinxiEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.GongjiaochexinxiVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.GongjiaochexinxiView;


/**
 * 公交车信息
 *
 * @author 
 * @email 
 * @date 2023-03-18 15:01:59
 */
public interface GongjiaochexinxiService extends IService<GongjiaochexinxiEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<GongjiaochexinxiVO> selectListVO(Wrapper<GongjiaochexinxiEntity> wrapper);
   	
   	GongjiaochexinxiVO selectVO(@Param("ew") Wrapper<GongjiaochexinxiEntity> wrapper);
   	
   	List<GongjiaochexinxiView> selectListView(Wrapper<GongjiaochexinxiEntity> wrapper);
   	
   	GongjiaochexinxiView selectView(@Param("ew") Wrapper<GongjiaochexinxiEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<GongjiaochexinxiEntity> wrapper);
   	

}

