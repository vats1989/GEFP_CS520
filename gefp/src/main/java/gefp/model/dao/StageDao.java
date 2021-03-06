package gefp.model.dao;

import java.util.List;

import gefp.model.Stage;

public interface StageDao {

    Stage getStage( long id );

    List<Stage> getStages();
    
    Stage saveStage(Stage stage);
	
}
