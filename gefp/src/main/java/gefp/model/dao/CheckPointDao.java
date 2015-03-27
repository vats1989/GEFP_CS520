package gefp.model.dao;

import java.util.List;

import gefp.model.CheckPoint;

public interface CheckPointDao {

	   CheckPoint getCheckPoint( long id );

	    List<CheckPoint> getCheckPoints();

	    CheckPoint saveCheckPoint(CheckPoint checkPoint);
	    
	    void deleteCheckPoint(CheckPoint checkPoint);
}
