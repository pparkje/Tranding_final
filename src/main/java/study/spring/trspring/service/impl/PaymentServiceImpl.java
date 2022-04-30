package study.spring.trspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.trspring.model.Payment;
import study.spring.trspring.service.PaymentService;

@Slf4j
@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public Payment getPaymentItem(Payment input) throws Exception {
		Payment result = null;

		try {
			result = sqlSession.selectOne("PaymentMapper.selectItem", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	

	@Override
	public List<Payment> getPaymentList(Payment input) throws Exception {
		List<Payment> result = null;
		
		try {
			result = sqlSession.selectList("PaymentMapper.selectList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getPaymentCount(Payment input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("PaymentMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	

	@Override
	public int addPayment(Payment input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("PaymentMapper.insertItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int editPayment(Payment input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("PaymentMapper.updateItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		return result;
	}
	
	

	@Override
	public int deletePayment(Payment input) throws Exception {
		int result = 0;

		try {
		
			result = sqlSession.delete("PaymentMapper.deleteItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		return result;
	}
	/** 로그인 관련 기능 조회*/
	
}
