package gefp.web.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import gefp.model.*;
import gefp.model.dao.*;

@Controller
@SessionAttributes({"user","department","plan","runway","stage","checkpoint","cells"})

public class GefpController {

    @Autowired
    private UserDao userDao;
    
    @Autowired
    private DepartmentDao departmentDao;
    
    @Autowired
    private PlanDao planDao;
    
    @Autowired
    private RunwayDao runwayDao;
    
    @Autowired
    private StageDao stageDao;
    
    @Autowired
    private CheckPointDao checkPointDao;
    
    @Autowired
    private CellDao cellDao;

    
    /************************Department Select*******************************/
    @RequestMapping(value=("/AdminArea/DepartmentSelect.html"), method=RequestMethod.GET)
    public String DepartmentSelect(ModelMap models) {
    	
    	models.put("department", departmentDao.getDepartments());
    	return "AdminArea/DepartmentSelect";
    }
    @RequestMapping(value=("/AdminArea/DepartmentSelect.html"), method=RequestMethod.POST)
    public String DepartmentSelect(@RequestParam String select_dept, ModelMap models, SessionStatus status) {
    	
    	long dept_id = Long.parseLong(select_dept);
    	return "redirect:/AdminArea/GefpAdmin.html?dept_id="+dept_id;
    }
    /*******************************Ends******************************/
    
    /***************************Admin Page*****************************/
    @RequestMapping(value=("/AdminArea/GefpAdmin.html"), method=RequestMethod.GET)
    public String gefp1(@RequestParam long dept_id, ModelMap models, HttpSession session) 
    {
    	models.put("department", departmentDao.getDepartment(dept_id));
    	return "AdminArea/GefpAdmin";
    }
    /****************************************************************/
    
    /**************************Add Plan*******************************/
    @RequestMapping(value=("/AdminArea/AddPlan.html"), method=RequestMethod.GET)
    public String addPlan(@RequestParam long dept_id, ModelMap models) 
    {
    	Plan plan = new Plan();
    	plan.setDepartment(departmentDao.getDepartment(dept_id));
    	models.put("plan", plan);
    	return "AdminArea/AddPlan";
    }
    @RequestMapping(value = "/AdminArea/AddPlan.html", method = RequestMethod.POST)
    public String addPlan(@ModelAttribute Plan plan, ModelMap models, SessionStatus status, BindingResult result)
    {
    		plan.setPublishedDate(new Date());
    		Plan newPlan = planDao.savePlan(plan);    	    
    		return "redirect:/AdminArea/EditPlan.html?plan_id="+newPlan.getId();
    }
    /****************************************************************/
       
    /**************************Edit Plan******************************/
    @RequestMapping(value=("/AdminArea/EditPlan.html"), method=RequestMethod.GET)
    public String editPlan(@RequestParam long plan_id ,ModelMap models) 
    {
    	
    	models.put("plan", planDao.getPlan(plan_id));
    	return "AdminArea/EditPlan";
    }
    /****************************************************************/
      
    /*************************Add Runway*******************************/
    @RequestMapping(value=("/AdminArea/AddRunway.html"), method=RequestMethod.GET)
    public String addRunway(@RequestParam long plan_id, ModelMap models) 
    {
    	Runway runway = new Runway();
    	runway.setPlan(planDao.getPlan(plan_id));
    	models.put("runway", runway);
    	return "AdminArea/AddRunway";
    }
    @RequestMapping(value = "/AdminArea/AddRunway.html", method = RequestMethod.POST)
    public String addRunway(@ModelAttribute Runway runway, ModelMap models, BindingResult result, HttpSession session)
    {
       	/* Code is for setting index of new Runway */
       	Plan plan = (Plan) session.getAttribute("plan");
    	plan = planDao.getPlan(plan.getId());
    	int size = plan.getRunways().size();
    	int index = 0;
    	if(size == 0)
    		index = 1;
    	else{
    		index = plan.getRunways().get(size-1).getRunway_index();
    		index++;
    	}
    	runway.setRunway_index(index);
    	/******************************************/
    	
    	Runway newRunway = runwayDao.saveRunway(runway);
    	
    	List<Stage> stages = newRunway.getPlan().getStages();
    	Cell cell[] = new Cell[stages.size()];
    	for(int i=0; i < cell.length; i++) {
    		cell[i] = new Cell();
    		cell[i].setPlan(newRunway.getPlan());
    		cell[i].setRunway(newRunway);
    		cell[i].setStage(stages.get(i));
    		cellDao.saveCell(cell[i]);
    	}
    	return "redirect:/AdminArea/AddRunway.html?plan_id="+newRunway.getPlan().getId();
    }
    /****************************************************************/
  
    /***************************Add Stage*****************************/
    @RequestMapping(value=("/AdminArea/AddStage.html"), method=RequestMethod.GET)
    public String addStage(@RequestParam long plan_id, ModelMap models) 
    {
    	Stage stage = new Stage();
    	stage.setPlan(planDao.getPlan(plan_id));
    	models.put("stage", stage);
    	return "AdminArea/AddStage";
    }
    @RequestMapping(value = "/AdminArea/AddStage.html", method = RequestMethod.POST)
    public String addStage(@ModelAttribute Stage stage, ModelMap models, SessionStatus status, BindingResult result, HttpSession session)
    {	
    	/* Code is for setting index of new Stage */
       	Plan plan = (Plan) session.getAttribute("plan");
    	plan = planDao.getPlan(plan.getId());
    	int size = plan.getStages().size();
    	int index = 0;
    	if(size == 0)
    		index = 1;
    	else{
    		index = plan.getStages().get(size-1).getStage_index();
    		index++;
    	}
    	stage.setStage_index(index);
    	/******************************************/
    	
    	Stage newStage = stageDao.saveStage(stage);
    	
    	List<Runway> runways = newStage.getPlan().getRunways();
    	Cell cell[] = new Cell[runways.size()];
    	for(int i=0; i < cell.length; i++) {
    		cell[i] = new Cell();
    		cell[i].setPlan(newStage.getPlan());
    		cell[i].setRunway(runways.get(i));
    		cell[i].setStage(newStage);
    		cellDao.saveCell(cell[i]);
    	}
    	
    	return "redirect:/AdminArea/AddStage.html?plan_id="+newStage.getPlan().getId();
    }
    /****************************************************************/
    
    /***************************Add CheckPoint*****************************/
    @RequestMapping(value=("/AdminArea/AddCheckPoint.html"), method=RequestMethod.GET)
    public String addCheckPoint(@RequestParam long plan_id, ModelMap models, HttpSession session) 
    {
    	CheckPoint checkpoint = new CheckPoint();
    	models.put("checkpoint", checkpoint);
    	models.put("plan", planDao.getPlan(plan_id));
    	return "AdminArea/AddCheckPoint";
    }
    @RequestMapping(value = "/AdminArea/AddCheckPoint.html", method = RequestMethod.POST)
    public String addCheckPoint(@ModelAttribute CheckPoint checkpoint, BindingResult result, @RequestParam String cp_stage, @RequestParam String cp_runway, HttpSession session)
    {
		long st_id = Long.parseLong(cp_stage);
		long run_id = Long.parseLong(cp_runway);
		Cell newCell = null;
		Plan plan = (Plan)session.getAttribute("plan");
		Plan newPlan = planDao.getPlan(plan.getId());	
		List<Cell> cells = newPlan.getCells();
		for(int i=0; i<cells.size(); i++)	{
			newCell = cells.get(i);
			if(newCell.getRunway().getId() == run_id && newCell.getStage().getId() == st_id)	{
				break;
			}
		}
		checkpoint.setCell(newCell);
		
		/****Below Code for Setting index of new checkpoint in a Cell****/
		int index = 0;
		int size = newCell.getCheckpoints().size();
		if(size == 0)
			index = 1;
		else {
			index = newCell.getCheckpoints().get(size-1).getCp_index();
			index++;
		}
		checkpoint.setCp_index(index);
		/************************************************************/
		
		checkPointDao.saveCheckPoint(checkpoint);
		return "redirect:/AdminArea/AddCheckPoint.html?plan_id="+plan.getId();
    }    
    /****************************************************************/
    
    /************************Make Current Plan******************************/
    @RequestMapping(value="/AdminArea/MakeCurrentPlan.html", method= RequestMethod.GET)
    public String makeCurrentPlan(@RequestParam long plan_id, ModelMap models) 
    {
    	Plan plan = planDao.getPlan(plan_id);
    	Department dept = plan.getDepartment();
    	dept.setCurrentPlan(plan);
    	Department updateDept = departmentDao.saveDepartment(dept);
    	return "redirect:/AdminArea/GefpAdmin.html?dept_id="+updateDept.getId();
    }
    /****************************************************************/
    
    /************************Edit CheckPoint********************************/
    @RequestMapping(value=("/AdminArea/EditCheckPoint.html"), method=RequestMethod.GET)
    public String editCheckPoint(@RequestParam long cp_id, @RequestParam long plan_id, ModelMap models, HttpSession session) 
    {
    	CheckPoint checkpoint = checkPointDao.getCheckPoint(cp_id);
    	models.put("checkpoint", checkpoint);
    	models.put("plan", planDao.getPlan(plan_id));
    	return "AdminArea/EditCheckPoint";
    }
    @RequestMapping(value = "/AdminArea/EditCheckPoint.html", method = RequestMethod.POST)
    public String editCheckPoint(@ModelAttribute CheckPoint checkpoint, BindingResult result, @RequestParam String ecp_stage, @RequestParam String ecp_runway, HttpSession session)
    {
    	CheckPoint cp = (CheckPoint) session.getAttribute("checkpoint");
    	CheckPoint cp1 = checkPointDao.getCheckPoint(cp.getId());
		long st_id = Long.parseLong(ecp_stage);
		long run_id = Long.parseLong(ecp_runway);
		Cell newCell = null;
		Plan plan = (Plan)session.getAttribute("plan");
		Plan newPlan = planDao.getPlan(plan.getId());	
		
		/*
		 * Below code is for setting checkpoint index if checkpoint  
		 *  is moved to other cell.
		 *  Set checkpoint index = totalNumberOfCheckPoints + 1 for new cell. 
		 */
		
		if(cp1.getCell().getStage().getId() != st_id || cp1.getCell().getRunway().getId() != run_id)  {
			
			System.out.println("CheckPoint Cell has been changed !!!");
			
			/*********************************************
			 * Set Index of old cell's other checkpoints *
			 *********************************************/
			int oldIndex = cp1.getCp_index();
			List<CheckPoint> oldCellCheckPoints = cp1.getCell().getCheckpoints();
			int oldCellSize = cp1.getCell().getCheckpoints().size();
			
			if(oldIndex != oldCellSize) {
				for(CheckPoint cp0 : oldCellCheckPoints) {
					if(cp0.getCp_index() > oldIndex)	{
						cp0.setCp_index(cp0.getCp_index()-1);
						checkPointDao.saveCheckPoint(cp0);
					}
				}
			}
			/**********************************************/
			
			List<Cell> cells = newPlan.getCells();
			for(int i=0; i<cells.size(); i++)	{
				newCell = cells.get(i);
				if(newCell.getRunway().getId() == run_id && newCell.getStage().getId() == st_id)	{
					break;
				}
			}
			
			int size = newCell.getCheckpoints().size();			
			if(size == 0)
				cp1.setCp_index(1);
			else
				cp1.setCp_index(newCell.getCheckpoints().get(size-1).getCp_index()+1);
			cp1.setCell(newCell);
		}
		/***********************Code Changes Ends here******************************/
		
		cp1.setCheckPoint_name(checkpoint.getCheckPoint_name());
		checkPointDao.saveCheckPoint(cp1);
		return "redirect:/AdminArea/EditPlan.html?plan_id="+newPlan.getId();   	
    }
    /****************************************************************/
    
    /************************Delete CheckPoint********************************/
	@RequestMapping(value=("/AdminArea/deleteCheckPoint.html"), method=RequestMethod.GET)
    public String deleteCheckPoint(@RequestParam long plan_id, @RequestParam long cp_id) 
    {
		int cp_index = checkPointDao.getCheckPoint(cp_id).getCp_index();
		long cell_id = checkPointDao.getCheckPoint(cp_id).getCell().getId();
		List<CheckPoint> checkPoints = cellDao.getCell(cell_id).getCheckpoints();
		checkPoints.remove(checkPointDao.getCheckPoint(cp_id));
		checkPointDao.deleteCheckPoint(checkPointDao.getCheckPoint(cp_id));
		
		for(CheckPoint cp : checkPoints) {
			if(cp.getCp_index() > cp_index)	{
				cp.setCp_index(cp.getCp_index()-1);
				checkPointDao.saveCheckPoint(cp);
			}
		}
    	return "redirect:/AdminArea/EditPlan.html?plan_id="+plan_id;
    }
    /*************************************************************************/
	
    /************************Edit Stage Name********************************/
	@RequestMapping(value=("/AdminArea/editStageName.html"), method=RequestMethod.GET)
    public String editStage(@RequestParam long id, @RequestParam String name) 
    {
		Stage stage = stageDao.getStage(id);
		stage.setStage_name(name);
		stage = stageDao.saveStage(stage);
    	return "redirect:/AdminArea/EditPlan.html?plan_id="+stage.getPlan().getId();
    }
    /*************************************************************************/

    /************************Edit Runway Name********************************/
	@RequestMapping(value=("/AdminArea/editRunwayName.html"), method=RequestMethod.GET)
    public String editRunway(@RequestParam long id, @RequestParam String name) 
    {
    	Runway runway = runwayDao.getRunway(id);
    	runway.setRunway_name(name);
    	runway = runwayDao.saveRunway(runway);
    	return "redirect:/AdminArea/EditPlan.html?plan_id="+runway.getPlan().getId();
    }
    /*************************************************************************/
	
	/************************Re-Order Runways********************************/
	@RequestMapping(value=("/AdminArea/myAjax.html"), method=RequestMethod.GET)
    public @ResponseBody String sortColumn(@RequestParam(value="tableOrder", required=false) String tableOrder) 
    {
    	String array[] = tableOrder.split(" ");
    	long indexArray[] = new long[array.length];
    	int i = 0;
    	for(String s : array)
    		indexArray[i++] = Long.parseLong(s);
    	
		int index = 1;
		for(long run_id: indexArray) {
			if(run_id != 0) {
				Runway runway = runwayDao.getRunway(run_id);
				runway.setRunway_index(index);
				runwayDao.saveRunway(runway);
				index++;
			}
		}
    	/*
    	List<Runway> runways = null;
    	HashMap<Long, Integer> map = new HashMap<Long,Integer>();
    	
    	i = 1;
    	for(long index : indexArray)
    		if(index != 0)
    			map.put(index, Integer.parseInt(""+i++));	
    	    	
    	for(long index : indexArray)	{
    		if(index != 0) {
    			runways = runwayDao.getRunway(index).getPlan().getRunways();
    			break;
    		}
    	}
    	for(Runway run : runways) {
    		if(map.containsKey(run.getId()))  {
    			run.setRunway_index(map.get(run.getId()));
    			runwayDao.saveRunway(run);
    		}
    	}
    	*/
    	return "Success";
    }
	/************************************************************************/
	
	/************************Re-Order CheckPoints****************************/
	@RequestMapping(value=("/AdminArea/reorderCheckPoint.html"), method=RequestMethod.GET)
    public @ResponseBody String sortCheckPoint(@RequestParam Long checkPointId,
    		@RequestParam(value="new_positions", required=false) Long[] new_positions) 
    {
		int index = 1;
		for(long cp_id: new_positions) {
			CheckPoint cp = checkPointDao.getCheckPoint(cp_id);
			cp.setCp_index(index);
			checkPointDao.saveCheckPoint(cp);
			index++;
		}		
		/*
		HashMap<Long, Integer> map = new HashMap<Long,Integer>();
		int index = 1;
		for(long cp_id : new_positions)
			map.put(cp_id, index++);
		
		List<CheckPoint> checkPoints = checkPointDao.getCheckPoint(checkPointId).getCell().getCheckpoints();
		
		for(CheckPoint cp : checkPoints) {
			if(map.containsKey(cp.getId())) {
				cp.setCp_index(map.get(cp.getId()));
				checkPointDao.saveCheckPoint(cp);
			}
		}
		*/	
    	return "Success";
    }
	/************************************************************************/
	
	/*************************Re-Order Stages********************************/
	@RequestMapping(value=("/AdminArea/reorderRow.html"), method=RequestMethod.GET)
    public @ResponseBody String stageReOrder(@RequestParam Long planId,
    		@RequestParam(value="rowOrder", required=false) Long[] rowOrder) 
    {
		int index = 1;
		for(long rowNumber: rowOrder) {
			Stage stage = stageDao.getStage(rowNumber);
			stage.setStage_index(index);
			stageDao.saveStage(stage);
			index++;
		}
		/*
		HashMap<Long, Integer> map = new HashMap<Long,Integer>();
		int index = 1;
		for(long st_id : rowOrder)
			map.put(st_id, index++);
		List<Stage> stages = planDao.getPlan(planId).getStages();
		
		for(Stage stage : stages) {
			if(map.containsKey(stage.getId()))	{
				stage.setStage_index(map.get(stage.getId()));
				stageDao.saveStage(stage);
			}
		}
		*/
    	return "Success";
    }
	/************************************************************************/
}