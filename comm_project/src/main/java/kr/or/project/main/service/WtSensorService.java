package kr.or.project.main.service;

import java.util.List;

import kr.or.project.main.model.Sensor;
import kr.or.project.main.model.WtSensor;

public interface WtSensorService {	
	public List<WtSensor> createSensor(WtSensor WtSensor);
	public List<WtSensor> readALLWtSensor(WtSensor WtSensor);
	public List<WtSensor> readLightWtSensor(WtSensor WtSensor);
	public List<WtSensor> readPhWtSensor(WtSensor WtSensor);
	public List<WtSensor> readLevelWtSensor(WtSensor WtSensor);
	public List<WtSensor> readTemperWtSensor(WtSensor WtSensor);
	public List<WtSensor> updateWtSensor(WtSensor WtSensor);
	public List<WtSensor> deleteSensor(WtSensor WtSensor);
}
