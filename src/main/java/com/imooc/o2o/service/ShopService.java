package com.imooc.o2o.service;

import com.imooc.o2o.dto.ImageHolder;
import com.imooc.o2o.dto.ShopExecution;
import com.imooc.o2o.entity.Shop;

public interface ShopService{
	
	ShopExecution addShop(Shop shop,ImageHolder thumbnail);
	
	ShopExecution getShopList(Shop condition,int pageIndex,int pageSize);
	
	Shop getShopById(Long shopId);
	
	ShopExecution modifyShop(Shop shop,ImageHolder thumbnail);
}
