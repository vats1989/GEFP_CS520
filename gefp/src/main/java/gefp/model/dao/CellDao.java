package gefp.model.dao;

import gefp.model.Cell;

import java.util.List;


public interface CellDao {

    Cell getCell( long id );

    List<Cell> getCell();
    
    Cell saveCell(Cell cell);
    
    Cell getCellByRunwayStage(long run_id, long st_id);
}
