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
	public int isWallet(int plannerCode) throws Exception{
		return sqlSession.selectOne("WalletMapper.isWallet", plannerCode);
	}
	
	public int getWalletCode(int plannerCode) throws Exception{
		return sqlSession.selectOne("WalletMapper.getWalletCode", plannerCode);
	}
	
	public void addWalletView(int plannerCode) throws Exception{
		sqlSession.insert("WalletMapper.addWalletView", plannerCode);
	}

	public void deleteWalletView(int walletCode) throws Exception{
		sqlSession.update("WalletMapper.deleteWalletView", walletCode);
	}
	
	// walletList.jsp
	public void addWallet(Wallet wallet) throws Exception{
		sqlSession.insert("WalletMapper.addWallet", wallet);
	}
	
	public Wallet getWallet(int walletDetailCode) throws Exception{
		return sqlSession.selectOne("WalletMapper.getWallet", walletDetailCode);
	}
	
	public void updateWallet(Wallet wallet) throws Exception{
		sqlSession.update("WalletMapper.updateWallet", wallet);
	}
	
	public void deleteWallet(int walletDetailCode) throws Exception{
		sqlSession.update("WalletMapper.deleteWallet", walletDetailCode);
	}
	
	public List<Wallet> getWalletList(Map<String, Object> map) throws Exception{
		return sqlSession.selectList("WalletMapper.getWalletList", map);
	}
	
	public int getTotalCount(Map<String, Object> map) throws Exception{
		return sqlSession.selectOne("WalletMapper.getTotalCount", map);
	}

	public double totalComes(Wallet wallet) throws Exception{
		return sqlSession.selectOne("WalletMapper.totalComes", wallet);
	}
	
	public List<Wallet> getWalletChart(int walletCode) throws Exception{
		return sqlSession.selectList("WalletMapper.getWalletChart", walletCode);
	}
	
}