package com.youlove.service.walletimpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.youlove.service.domain.Wallet;
import com.youlove.service.wallet.WalletDao;

@Repository("walletDaoImpl")
public class WalletDaoImpl implements WalletDao {

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public WalletDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	// walletListView.jsp
	/*
	public void addWalletView(int plannerCode) throws Exception{
		sqlSession.insert("WalletMapper.addWalletView", plannerCode);
	}
	
	public void deleteWalletView(int plannerCode) throws Exception{
		sqlSession.delete("WalletMapper.deleteWalletView", plannerCode);
	}
	
	public List<Wallet> getWalletListView(int plannerCode) throws Exception{
		return sqlSession.selectList("WalletMapper.getWalletListView", plannerCode);
	}
	*/
	
	// walletList.jsp
	public void addWallet(Wallet wallet) throws Exception{
		sqlSession.insert("WalletMapper.addWallet", wallet);
	}
	
	public Wallet getWallet(int walletDetailCode) throws Exception{
		return sqlSession.selectOne("WalletMapper.getWallet", walletDetailCode);
	}
	/*
	public void updateWallet(Wallet wallet) throws Exception{
		sqlSession.update("WalletMapper.updateWallet", wallet);
	}
	*/
	public void deleteWallet(int walletDetailCode) throws Exception{
		// sqlSession.delete("WalletMapper.deleteWallet", walletDetailCode);
		sqlSession.update("WalletMapper.deleteWallet", walletDetailCode);
	}
	
	public List<Wallet> getWalletList(Map<String, Object> map) throws Exception{
		return sqlSession.selectList("WalletMapper.getWalletList", map);
	}
	
	public int getTotalCount(Map<String, Object> map) throws Exception{
		return sqlSession.selectOne("WalletMapper.getTotalCount", map);
	}
	
}
