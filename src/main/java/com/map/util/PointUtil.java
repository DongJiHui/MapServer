package com.map.util;

import java.util.ArrayList;

import com.map.jsonBean.Point;


public class PointUtil {
	private static int NORTHEAST = 0;
	private static int NORTHWEST = 1;
	private static int SOUTHWEST = 2;
	private static int SOUTHEAST = 3;
	private static int ERROR =4;
	
	// 1��ʾ�� 0��ʾ����  -1��ʾ����
	public static int pointIsInPolygon(Point point, ArrayList<Point> polygon) {
		int sum = 0;
		for (int i=0; i<polygon.size()-1; i++){
			sum += getEdgeMark(polygon.get(i), polygon.get(i+1), point);
		}
		sum += getEdgeMark(polygon.get(polygon.size()-1), polygon.get(0), point);
		if (sum == 4 || sum == -4) 
			return 1;
		else if (sum == 0) 
			return 0;
		else 
			return -1;
	}
	
	private static int getEdgeMark(Point pointA, Point pointB, Point target){
		int positionA = getPointPosition(pointA, target);
		int positionB = getPointPosition(pointB, target);
		int temp = positionB - positionA;
		if (temp == 3) {
			temp = -1;
		} else if (temp == -3) {
			temp = 1;
		} else if (temp == 2 || temp == -2) {
			Point middle =  Point.middle(pointA, pointB);
			temp = getEdgeMark(pointA,middle,target) + getEdgeMark(middle,pointB,target);
		}
		return temp;
	}
	
	private static int getPointPosition(Point point, Point target){
		if (point.getX()>= target.getX() && point.getY() > target.getY()) {
			return NORTHEAST;
		} else if (point.getX()< target.getX() && point.getY() >= target.getY()) {
			return NORTHWEST;
		} else if (point.getX()<= target.getX() && point.getY() < target.getY()) {
			return SOUTHWEST;
		} else if (point.getX()> target.getX() && point.getY() <=target.getY()) {
			return SOUTHEAST;
		} else {
			return ERROR;
		}
	}
	
}
