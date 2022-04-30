package study.spring.trspring.service;

import java.util.List;

import study.spring.trspring.model.Qna;

public interface QnaService {

	public Qna getQnaItem(Qna input) throws Exception;

	public List<Qna> getQnaList(Qna input) throws Exception;
	
	public Qna getQnaJoinItem(Qna input) throws Exception;

	public List<Qna> getQnaJoinList(Qna input) throws Exception;

	public int getQnaCount(Qna input) throws Exception;
	
	public int addQna(Qna input) throws Exception;

	public int editQna(Qna input) throws Exception;

	public int deleteQna(Qna input) throws Exception;
}
