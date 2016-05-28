package com.map.jsonBean;


public class Point {
	public static Point middle (Point a, Point b){
		Point point = new Point();
		point.setX((a.getX()+b.getX())/2);
		point.setY((a.getY()+b.getY())/2);
		return point;
	}
	private float lng;
	private float lat;
	public float getLng() {
		return lng;
	}
	public void setLng(float lng) {
		this.lng = lng;
	}
	
	public Point() {
		super();
	}
	public Point(float x, float y) {
		super();
		this.lng = x;
		this.lat = y;
	}
	public float getLat() {
		return lat;
	}
	public void setLat(float lat) {
		this.lat = lat;
	}
	public float getX() {
		return lng;
	}
	public void setX(float x) {
		this.lng = x;
	}
	public float getY() {
		return lat;
	}
	public void setY(float lat) {
		this.lat = lat;
	}
}
