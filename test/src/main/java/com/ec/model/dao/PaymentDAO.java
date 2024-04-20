package com.ec.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.ec.mybatis.SQLMapConfig;

public class PaymentDAO {
private SqlSession ss;
	
	public PaymentDAO() {
		ss = SQLMapConfig.getFactory().openSession(true);
	}

	public long getPaymentCnt() {
		return ss.selectOne("Payment.paymentCnt");
	}
	
	
}
