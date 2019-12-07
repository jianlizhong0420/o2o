package com.imooc.o2o.dao;

import static org.junit.Assert.assertEquals;

import java.util.Date;

import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.imooc.o2o.BaseTest;
import com.imooc.o2o.entity.Area;
import com.imooc.o2o.entity.PersonInfo;
import com.imooc.o2o.entity.Shop;
import com.imooc.o2o.entity.ShopCategory;

public class ShopDaoTest extends BaseTest{
	
	@Autowired
	private ShopDao shopDao;
	
	@Test
	@Ignore
	public void testInsertShop() {
		Shop shop = new Shop();
		PersonInfo owner = new PersonInfo();
		Area area = new Area();
		ShopCategory shopCategory = new ShopCategory();
		
		owner.setUserId(1L);
		area.setAreaId(1);
		shopCategory.setShopCategoryId(1L);
		
		shop.setOwner(owner);
		shop.setArea(area);
		shop.setShopCategory(shopCategory);
		shop.setShopName("张三的小店");
		shop.setShopDesc("张三小店的店铺描述");
		shop.setShopAddr("张三小店的店铺地址");
		shop.setShopImg("/user/ceshi.jpg");
		shop.setPhone("88555666");
		shop.setPriority(3);
		shop.setAdvice("店铺申请通过");
		shop.setCreateTime(new Date());
		shop.setLastEditTime(new Date());
		shop.setEnableStatus(1);
		
		int effectedNum = shopDao.insertShop(shop);
		assertEquals(1,effectedNum);
	}
	
	@Test
	public void testUpdateShop() {
		Shop shop = new Shop();
		Area area = new Area();
		ShopCategory shopCategory = new ShopCategory();
		shop.setShopId(1L);
		
		area.setAreaId(2);//1改成2
		shopCategory.setShopCategoryId(2L);//1改成2
		
		shop.setArea(area);
		shop.setShopCategory(shopCategory);
		shop.setShopName("李四的小店");
		shop.setShopDesc("李四小店的店铺描述");
		shop.setShopAddr("李四小店的店铺地址");
		shop.setShopImg("/user/22222.jpg");
		shop.setPhone("222222222");
		shop.setPriority(5);
		shop.setAdvice("店铺申请通过啦");
		shop.setCreateTime(new Date());
		shop.setLastEditTime(new Date());
		shop.setEnableStatus(0);
		
		int effectedNum = shopDao.updateShop(shop);
		assertEquals(1,effectedNum);
		
	}
}
