package study.spring.trspring.service;

import java.util.List;

import study.spring.trspring.model.Point;


public interface PointService {
	public Point getPointItem(Point input) throws Exception;

	public List<Point> getPointList(Point input) throws Exception;

	public int getPointCount(Point input) throws Exception;

	public int addPoint(Point input) throws Exception;

	public int editPoint(Point input) throws Exception;

	public int deletePoint(Point input) throws Exception;
	
}
