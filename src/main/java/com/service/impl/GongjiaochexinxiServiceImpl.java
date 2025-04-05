package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;


import com.dao.GongjiaochexinxiDao;
import com.entity.GongjiaochexinxiEntity;
import com.service.GongjiaochexinxiService;
import com.entity.vo.GongjiaochexinxiVO;
import com.entity.view.GongjiaochexinxiView;

@Service("gongjiaochexinxiService")
public class GongjiaochexinxiServiceImpl extends ServiceImpl<GongjiaochexinxiDao, GongjiaochexinxiEntity> implements GongjiaochexinxiService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<GongjiaochexinxiEntity> page = this.selectPage(
                new Query<GongjiaochexinxiEntity>(params).getPage(),
                new EntityWrapper<GongjiaochexinxiEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<GongjiaochexinxiEntity> wrapper) {
		  Page<GongjiaochexinxiView> page =new Query<GongjiaochexinxiView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<GongjiaochexinxiVO> selectListVO(Wrapper<GongjiaochexinxiEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public GongjiaochexinxiVO selectVO(Wrapper<GongjiaochexinxiEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<GongjiaochexinxiView> selectListView(Wrapper<GongjiaochexinxiEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public GongjiaochexinxiView selectView(Wrapper<GongjiaochexinxiEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
