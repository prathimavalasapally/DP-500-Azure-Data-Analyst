# Create reusable Power BI assets

## Overview

**The estimated time to complete the lab is 45 minutes**

In this lab, you will create a specialized Power BI dataset that extends a core dataset. The specialized dataset will enable the analysis of US sales per capita.

In this lab, you learn how to:

- Create a live connection.

- Create a local DirectQuery model.

- Use lineage view to discover dependent Power BI assets.

## Excercise-1: Publishing Data Model in Power BI
 
In this exercise, you will Publish a data Module in Power BI.

### Task-1: Set up Power BI

In this task, you will set up Power BI.

1. To open Power BI Desktop, select the **Power BI Desktop** shortcut on desktop page.

	![](../images1/dp-0new.png)

1. Select **X** located at the top-right of the getting started window.

	![](../images1/dp-1new.png)

1. At the top-right corner of Power BI Desktop, if you're not already signed in, select **Sign In**. Use the lab credentials in the Environment details tab to complete the sign in process.

	![](../images/DP500-16-6.png)
	
1. Enter the Lab username in the **Enter your email address** and click on **Continue**

	![](../images1/DP500-16-56.png)
	
1. Complete the sign up process by selecting the username and entering the password provided in the environment details tab.

	![](../images1/DP500-16-57.png)
	
	![](../images1/DP500-16-58.png)	
	
1. You will be redirected to the Power BI sign-up page in Microsoft Edge. Select **Signin**.

   
   >**Note**: On the Welcome to Microsoft Edge page, select  **Start without your data**  and on the help for importing Google browsing data page, select 		      the **Continue without this data** button. Then, proceed to select  **Confirm and start browsing**  on the next page.

	
	![](../images1/DP500-16-59.png)
	
1. Enter the Password provided in the Environment Details tab and click on **Signin**
	
	![](../images1/DP500-16-60.png)	
	
1. If stay signed in window Pops-up, select **No**

1. Enter a 10 digit phone number and select **Get started**. Select **Get started** once more. You will be redirected to Power BI.

	![](../images1/DP500-16-61.png)

1. At the top-right, select the profile icon, and then select **Start trial**.

	![](../images/DP500-16-8.png)

1. When prompted, select **Start trial**.

	![](../images/DP500-16-9.png)

1. Do any remaining tasks to complete the trial setup.

	>**Note**: The Power BI web browser experience is known as the **Power BI service**.*

### Task-2: Create a workspace in the Power BI Service

In this task, you will create a workspace.

1. In the Power BI service, to create a workspace, in the **Navigation** pane (located at the left), select **Workspaces**, and then select **Create workspace**.

	![](../images/DP500-16-10.png)


2. In the **Create a workspace** pane (located at the right), in the **Workspace name** box, enter a name for the workspace as **DP500-<inject key="Deployment ID" enableCopy="false" />**
3. Select **Apply**.


	![](../images1/dp-4.png)

	>**Note**:Once created, the workspace opens. In the next task, you will publish a dataset to this workspace.*

4. **Congratulations** on completing the task! Now, it's time to validate it. Here are the steps:

   - Click the **(...) icon** located at the upper right corner of the lab guide section and navigate to the **Lab Validation** Page.
   - Hit the **Validate** button for the corresponding task.
   - If you receive a success message, you can proceed to the next task. If not, carefully read the error message and retry the step, following the instructions in the lab guide.
   - If you need any assistance, please contact us at [labs-support@spektrasystems.com](labs-support@spektrasystems.com).We are available 24/7 to help you out.

### Task-3: Open the starter file in Power BI Desktop

1. To open File Explorer, on the taskbar, select the **File Explorer** shortcut.

	![](../images/DP500-16-13.png)

2. Go to the **C:\LabFiles\DP-500-Azure-Data-Analyst\Allfiles\16\Starter** folder.

3. To open a pre-developed Power BI Desktop file, double-click the **Sales Analysis - Create reusable Power BI artifacts.pbix** file.

4. If **Get the most out of Power BI** window pops-up, close it.

4. If you're not already signed in, at the top-right corner of Power BI Desktop, select **Sign In**. Use the lab credentials to complete the sign in process.

	![](../images/DP500-16-6.png)

### Task-4: Review the data model

In this task, you will review the data model.

1. In Power BI Desktop, at the left, switch to **Model** view.

	![](../images/DP500-16-14.png)

2. Use the model diagram to review the model design.

	![](../images/DP500-16-15.png)

	>**Note**:The model comprises six dimension tables and one fact table. The **Sales** fact table stores sales order details. It's a classic star schema design.*

### Task-5: Publish the data model

In this task, you will publish the data model.

1. To publish the report, on the **Home** ribbon tab, select **Publish**. 

    	>**Note**:If prompted to save changes, select **Save.***

2. In the **Publish to Power BI** window, select the workspace named **DP500-<inject key="Deployment ID" enableCopy="false" />**, and then select **Select**.

	![](../images1/dp-5.png)	

3. When the publishing succeeds, select **Got it**.

	![](../images1/dp-6.png)	

	>**Note**:Once published, the model becomes a Power BI dataset. In this lab, this dataset is a core dataset that a business analyst can extend to create a specialized dataset. In the next exercise, you will create a specialized dataset to solve a specific business requirement.*

4. Close Power BI Desktop.

5. If prompted to save changes, select **Don't save**.

	![](../images/DP500-16-19.png)

## Excercise-2: Create a specialized dataset

In this exercise, you will create a specialized dataset to allow the analysis of US sales per capita. Because the core dataset doesn't contain population values, you will add a new table to extend the model.

### Task-1 Create a live connection

In this task, you will create a new report that uses a live connection to the **Sales Analysis - Create reusable Power BI artifacts** dataset, which you published in the previous exercise.

1. To open Power BI Desktop, on the taskbar, select the **Power BI Desktop** shortcut.

	![](../images1/dp-7.png)	

2. Select **X** located at the top-right of the getting started window.

	![](../images1/dp-1new.png)	

3. To save the file, on the **File** ribbon, select **Save as**.

4. In the **Save As** window, go to the **C:\LabFiles\DP-500-Azure-Data-Analyst\Allfiles\16\MySolution** folder.

5. In the **File name** box, enter **US Sales Analysis**.

	![](../images/DP500-16-20.png)

6. Select **Save**.

7. Complete the signin process,if not signed in to PowerBI desktop and continue with the next step.

7. To create a live connection, on the **Home** ribbon tab, from inside the **Data** group, select **Power BI datasets** in Data hub drawdown.

	![](../images/DP500-16-3.png)

8. In the **Select a dataset to create a report** window, select the **Sales Analysis - Create reusable Power BI artifacts** dataset.

	![](../images/DP500-16-5.png)

9. Select **Connect**.

	![](../images/DP500-16-4.png)

10. At the bottom left, in the status bar, notice that the report connects live to the dataset.

	![](../images1/dp-9.png)	

11. Switch to **Model** view.

	![](../images/DP500-16-22.png)

12. If necessary, to fit the model diagram to your screen, at the bottom right, select **Fit to screen**.

	![](../images/DP500-16-23.png)

13. Hover the cursor over any table header to reveal a tooltip, and notice that the data source type is SQL Server Analysis Services, the server refers to your workspace, and the database is the dataset.

	![](../images/DP500-16-24.png)

	>**Note**:These properties indicate that a remote model hosts the table. In the next task, you will make changes to the model to extend it. That process will create a local DirectQuery model that you can modify in many different ways.*

14. Save the Power BI Desktop file.

	![](../images/DP500-16-25.png)

### Task-2: Create a local DirectQuery model

In this task, you will create a local DirectQuery model.

1. On the **Home** ribbon tab, from inside the **Modeling** group, select **Make changes to this model**.

	![](../images/DP500-16-26.png)

	>**Note**: if you do not see the option to make changes to this model, you need to enable the preview feature, DirectQuery for PBI datasets and AS*
	>**Note**: Navigate to **File** > **Options and settings** > **Options**, and in the Preview features section, select the DirectQuery for Power BI datasets and Analysis Services checkbox to enable this preview feature. You may need to restart Power BI Desktop for the change to take effect.(you can save and close and reopen the file if still the changes are not shownup) 

	![](../images1/dp-11.png)
	
	![](../images1/dp-12.png)	

2. Now,after changing the settings,you can able to view and select **Make changes to this model** and then select **Add a local model**.

	![](../images/DP500-16-27.png)

	>**Note**:The model is now a DirectQuery model. It's now possible to enhance the model by modifying certain table or column properties, or adding calculated columns. It's even possible to extend the model with new tables of data that are sourced from other data sources. You will add a table to add US population data to the model.*

3. Select **Submit** in the Connect to data popup-window.
	
4. Hover the cursor over any table header to reveal a tooltip, and notice that the table storage mode is set to **DirectQuery**.

	![](../images/DP500-16-28.png)

### Task-3: Design the report layout

In this task, you will design the report layout to analyze US state sales.

1. Switch to **Report** view.

	![](../images/dp-16.png)

2. In the **Data** pane (located at the right), expand open the **Reseller** table.

3. Right-click the **Country-Region** field, and then select **Add to filters** > **Report-level filters**.

	![](../images/DP500-16-29.png)

4. Expand open the **Filters** pane (located at the left of the **Visualizations** pane).

5. In the **Filters** pane, in the **Filters on all pages** section, in the **Country-Region** card, select **United States**.

	![](../images/DP500-16-31.png)

6. To add a table visual, in the **Visualizations** pane, select the table visual icon.

	![](../images/DP500-16-32.png)

7. Reposition and resize the table so that it fills the entire page.

8. In the **Data** pane, from inside the **Reseller** table, drag the **State-Province** field and drop it into the table visual.

	![](../images/DP500-16-33.png)

9. In the **Data** pane, expand the **Sales** table, and then add the **Sales Amount** field to the table visual.

	![](../images/DP500-16-34.png)

10. To sort the states by descending order of sales amount, select the **Sales Amount** header.

	![](../images/DP500-16-35.png)

	>**Note**:This report layout now provides basic detail about US state sales. However, an additional requirement is to show sales per capita and sort states by descending order of that measure.*

### Task-4: Add a table

In this task, you will add a table of US population data sourced from a web page.

1. Switch to **Model** view.

	![](../images/DP500-16-22.png)

2. On the **Home** ribbon tab, from inside the **Data** group, select **Get data**, and then select **Web**.

	![](../images/DP500-16-36.png)

3. In the **URL** box, enter the following file path: **C:\LabFiles\DP-500-Azure-Data-Analyst\Allfiles\16\Assets\us-resident-population-estimates-2020.html**

	>**Note**:For the purposes of this lab, Power BI Desktop will access the web page from the file system.*

	>**Note**: The file path is available to copy and paste from the **C:\LabFiles\DP-500-Azure-Data-Analyst\Allfiles\16\Assets\Snippets.txt** file.*
	
	![](../images1/dp-20.png)


4. Select **OK**.

	![](../images/DP500-16-37.png)

5. In the **Navigator** window, at the right, switch to **Web View**.

	![](../images1/dp-21.png)

	>**Note**:The web page presents US resident population estimates sourced from the April 2020 census.*

6. Switch back to Table view.
7. At the left, select **Table 2**.

	![](../images1/dp-22.png)

8. Notice the table view preview.

	>**Note**:This table of data contains the data that's required by your model to calculate sales per capita. You will need to prepare the data by applying transformations: Specifically, you will remove the row for **United States**, remove the **RANK** column, and rename the **STATE** and **NUMBER** columns.*

9. To prepare the data, select **Transform Data**.

	![](../images/DP500-16-41.png)

10. In the Power Query Editor window, in the **Query Settings** pane (located at the right), in the **Name** box, replace the text with **US Population**, and then press **Enter**.

	![](../images/DP500-16-42.png)

11. To remove the **United States** row, in the **STATE** column header, select the down-arrow, and then unselect the **United States** item (scroll to the bottom of the list).
12. Select **OK**.


	![](../images1/dp-25.png)

13. To remove the **RANK** column, right-click the column header, and then select **Remove**.

	![](../images1/dp-26.png)

14. To rename the **STATE** column, double-click the column header, replace the text with **State**, and then press **Enter**.

15. Rename the **NUMBER** column as **Population**.

	![](../images/DP500-16-45.png)

16. To apply the query, on the **Home** ribbon tab, from inside the **Close** group, select the **Close & Apply** icon.

	![](../images/DP500-16-46.png)

17. When prompted about a potential security risk, read the notification, and then select **OK**.

	![](../images1/dp-29.png)

	>**Note**:Power BI Desktop applies the query to create a model table. It adds a new table that imports population data to the model.*

18. Reposition the **US Population** table near the **Reseller** table.

19. To create a model relationship, from the **US Population** table, drag the **State** column and drop it on the **State-Province** column of the **Reseller** table.

	![](../images/DP500-16-47.png)

20. In the **Create Relationship** window, in the **Cross Filter Direction** dropdown list, select **Both**.

	![](../images1/dp-30.png)

	>**Note**:Each row of the **Reseller** table stores a reseller, so the values found in the **State-Province** column will contain duplicate values (for example, there are many resellers in the state of California). When you create the relationship, Power BI Desktop automatically determines column cardinalities and discovered that it's a many-to-one relationship. To ensure filters propagate from the **Reseller** table to the **US Population** table, the relationship must cross filter in both directions.*

21. Select **OK**.

	![](../images/DP500-16-37.png)

22. To hide the new table, in the header of the **US Population** table, select the visibility icon.

	![](../images/DP500-16-49.png)

	>**Note**:The table doesn't need to be visible to report authors.*

### Task-5: Add a measure

In this task, you will add a measure to calculate sales per capita.

1. Switch to **Report** view.

	![](../images/DP500-16-29.png)

2. In the **Data** pane, right-click the **Sales** table, and then select **New measure**.

	![](../images1/dp-33.png)

3. In the formula bar, Replace and enter the following measure definition.

	>**Note**: The measure definition is available to copy and paste from the **C:\LabFiles\DP-500-Azure-Data-Analyst\Allfiles\16\Assets\Snippets.txt** file.*

	```
	Sales per Capita =
	DIVIDE(
	SUM(Sales[Sales Amount]),
	SUM('US Population'[Population])
	)
	```

	>**Note**:The measure named **Sales per Capita** uses the DAX [DIVIDE](https://docs.microsoft.com/dax/divide-function-dax) function to divide the sum of the **Sales Amount** column by the sum of the **Population** column.*
	
	![](../images1/dp-34.png)


4. On the **Measure Tools** contextual ribbon tab, from inside the **Formatting** group, in the decimal places box, enter **4**.

	![](../images/DP500-16-51.png)

5. To add the measure to the matrix visual, in the **Data** pane, from inside the **Sales** table, drag the **Sales per Capita** field into the table visual.

	>**Note**:The measure evaluates the result by combining data sourced from a remote model in the Power BI service with data from the imported table that is local to your new model.*
	
	![](../images1/dp-35.png)

6. To sort the states by descending sales per capita value, select the **Sales per Capita** column header.

	![](../images/DP500-16-52.png)

### Task-6: Publish the solution

In this task, you will publish the solution, which comprises a specialized data model and a report.

1. Save the Power BI Desktop file.

	![](../images/DP500-16-25.png)

2. To publish the solution, on the **Home** ribbon tab, select **Publish**.

	![](../images/DP500-16-16.png)

3. In the **Publish to Power BI** window, select your workspace named **DP500-<inject key="Deployment ID" enableCopy="false" />** , and then select **Select**.

	![](../images1/dp-38.png)

4. When the publishing succeeds, select **Got it**.

	![](../images1/dp-39.png)

5. Close Power BI Desktop.

6. If prompted to save changes, select **Don't save**.

	![](../images1/dp-40.png)

### Task-7: Review the specialized dataset

In this task, you will review the specialized dataset in the Power BI service.

1. Switch to the Power BI service (web browser).

2. In the workspace landing page, notice the **US Sales Analysis** report and **US Sales Analysis** dataset.

	![](../images/DP500-16-53.png)


3. Hover the cursor over the **US Sales Analysis** dataset, and when the ellipsis appears, select the ellipsis, and then select **View lineage**.

	![](../images1/dp-42.png)

	>**Note**:The **View lineage** option supports finding out dependencies between Power BI assets. That's important, for example, if you are going to publish changes to a core dataset. Lineage view will tell you the dependent datasets that might require testing.*

4. In lineage view, notice the connection between the report, the **US Sales Analysis** dataset, and the **Sales Analysis - Create reusable Power BI artifacts** dataset.

	![](../images/DP500-16-55.png)

	>**Note**:When Power BI datasets relate to other datasets, it's known as chaining. In this lab, the **US Sales Analysis** dataset is chained to the **Sales Analysis - Create reusable Power BI artifacts** dataset, enabling its reuse for a specialized purpose.*

5. **Congratulations** on completing the task! Now, it's time to validate it. Here are the steps:

   - Click the **(...) icon** located at the upper right corner of the lab guide section and navigate to the **Lab Validation** Page.
   - Hit the **Validate** button for the corresponding task.
   - If you receive a success message, you can proceed to the next task. If not, carefully read the error message and retry the step, following the instructions in the lab guide.
   - If you need any assistance, please contact us at [labs-support@spektrasystems.com](labs-support@spektrasystems.com).We are available 24/7 to help you out.
