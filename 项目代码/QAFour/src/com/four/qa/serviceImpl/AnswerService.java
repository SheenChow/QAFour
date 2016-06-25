package com.four.qa.serviceImpl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.four.qa.daoImpl.AnswerDao;
import com.four.qa.daoImpl.QuestionDao;
import com.four.qa.daoImpl.UserInfoDao;
import com.four.qa.model.AAnswer;
import com.four.qa.model.Answer;
import com.four.qa.serviceInterface.IAnswerService;

/**
 * 2016-6-25
 * 
 * @author mabing
 *
 */
public class AnswerService implements IAnswerService {

	private AnswerDao answerDao;
	private UserInfoDao userDao;
	private QuestionDao questionDao;

	public AnswerDao getAnswerDao() {
		return answerDao;
	}

	public void setAnswerDao(AnswerDao answerDao) {
		this.answerDao = answerDao;
	}

	public UserInfoDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserInfoDao userDao) {
		this.userDao = userDao;
	}

	public QuestionDao getQuestionDao() {
		return questionDao;
	}

	public void setQuestionDao(QuestionDao questionDao) {
		this.questionDao = questionDao;
	}

	public List<Answer> getListByQID(int qid) {
		System.out.println("qid=" + qid);
		return answerDao.getByQID(qid);
	}

	public List<Answer> getListByAsID(int fid) {
		return answerDao.getByFID(fid);
	}

	public Answer createAnswer(Answer a) {
		return answerDao.answerQS(a);
	}

	public AAnswer createAnswer(AAnswer a) {
		Answer answer = new Answer();
		int fid = a.getFID();
		answer.setAscontent(a.getAscontent());
		answer.setAstime(getCurrentDate());
		answer.setAsuser(userDao.get(a.getAsuser()));
		// answer.setID(a.getID());
		answer.setQID(questionDao.get(a.getQID()));
		answerDao.answerAS(answer, fid);
		return a;
	}

	/**
	 * 产生一个不带毫秒的时间
	 * 
	 * @author mabing
	 * @time 2016-6-25 15:54
	 * @return
	 */
	public Date getCurrentDate() {
		// 产生一个不带毫秒的时间,不然,SQL时间和JAVA时间格式不一致
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		Date tm = new Date();
		try {
			tm = sdf.parse(sdf.format(new Date()));
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return tm;
	}

}
