package com.imooc.o2o.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.imooc.o2o.dao.ShopDao;
import com.imooc.o2o.dto.ImageHolder;
import com.imooc.o2o.dto.ShopExecution;
import com.imooc.o2o.entity.Shop;
import com.imooc.o2o.enums.ShopStateEnum;
import com.imooc.o2o.exceptions.ShopOperationException;
import com.imooc.o2o.service.ShopService;
import com.imooc.o2o.util.ImageUtil;
import com.imooc.o2o.util.PathUtil;

@Service
@Transactional
public class ShopServiceImpl implements ShopService {
	@Autowired
	private ShopDao shopDao;
	
	@Override
	public ShopExecution addShop(Shop shop, ImageHolder thumbnail) {
		//空值判断
		if(shop==null) {
			return new ShopExecution(ShopStateEnum.NULL_SHOP);
		}
		try {
			shop.setCreateTime(new Date());
			shop.setLastEditTime(new Date());
			shop.setEnableStatus(0);
			
			int effectedNum = shopDao.insertShop(shop);
			if(effectedNum<=0) {
				throw new ShopOperationException("店铺创建失败");
			}else {
				if(thumbnail.getImage() !=null) {
					try {
						addShopImage(shop,thumbnail);
					}catch(Exception e) {
						throw new ShopOperationException("addShopImage() Error"+e.getMessage());
					}
					effectedNum = shopDao.updateShop(shop);
					if(effectedNum<=0) {
						throw new ShopOperationException("更新店铺图片地址失败");
					}
				}
			}
			
		}catch(Exception e) {
			throw new ShopOperationException("店铺创建失败"+e.getMessage());
		}
		return new ShopExecution(ShopStateEnum.CHECK,shop);
	}

	private void addShopImage(Shop shop, ImageHolder thumbnail) {
		String targetAddr = PathUtil.getShopImagePath(shop.getShopId());
		String shopImgAddr = ImageUtil.generateThumbnail(thumbnail, targetAddr);
		shop.setShopAddr(shopImgAddr);
	}

	@Override
	public ShopExecution getShopList(Shop condition, int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Shop getShopById(Long shopId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ShopExecution modifyShop(Shop shop, ImageHolder thumbnail) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
