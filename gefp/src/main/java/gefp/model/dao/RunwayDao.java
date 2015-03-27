package gefp.model.dao;

import java.util.List;

import gefp.model.Runway;;


public interface RunwayDao {

	   Runway getRunway( long id );

	    List<Runway> getRunways();
	    
	    Runway saveRunway(Runway runway);
}
