package study.spring.trspring.service;

import java.util.List;

import study.spring.trspring.model.Review;

public interface ReviewService {
	
	public Review getReviewItem(Review input) throws Exception;

	public List<Review> getReviewList(Review input) throws Exception;

	public int getReviewCount(Review input) throws Exception;

	public int addReview(Review input) throws Exception;

	public int editReview(Review input) throws Exception;

	public int deleteReview(Review input) throws Exception;

	public List<Review> getReviewListAll() throws Exception;
}
