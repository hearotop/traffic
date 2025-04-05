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


import com.dao.XianluweihuDao;
import com.entity.XianluweihuEntity;
import com.service.XianluweihuService;
import com.entity.vo.XianluweihuVO;
import com.entity.view.XianluweihuView;

@Service("xianluweihuService")
public class XianluweihuServiceImpl extends ServiceImpl<XianluweihuDao, XianluweihuEntity> implements XianluweihuService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<XianluweihuEntity> page = this.selectPage(
                new Query<XianluweihuEntity>(params).getPage(),
                new EntityWrapper<XianluweihuEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<XianluweihuEntity> wrapper) {
		  Page<XianluweihuView> page =new Query<XianluweihuView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<XianluweihuVO> selectListVO(Wrapper<XianluweihuEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public XianluweihuVO selectVO(Wrapper<XianluweihuEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<XianluweihuView> selectListView(Wrapper<XianluweihuEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public XianluweihuView selectView(Wrapper<XianluweihuEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
