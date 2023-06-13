# Enforce model security

## Overview

**The estimated time to complete the lab is 45 minutes**

In this lab, you will update a pre-developed data model to enforce security. Specifically, salespeople at the Adventure Works company should only be able to see sales data related to their assigned sales region.

In this lab, you learn how to:

- Create static roles.

- Create dynamic roles.

- Validate roles.

- Map security principals to dataset roles.

## Set up Power BI Desktop

In this task, you will set up Power BI Desktop.

1. To open File Explorer, on the taskbar, select the **File Explorer** shortcut.

	![](../images1/dp9-1new.png)

2. Go to the **C:\LabFiles\DP-500-Azure-Data-Analyst\Allfiles\09\Starter** folder.

3. To open a pre-developed Power BI Desktop file, double-click the **Sales Analysis - Enforce model security.pbix** file.
	
	![](../images1/dp9-2.png)

4. At the top-right corner of Power BI Desktop, if you're not already signed in, select **Sign In**. Use the lab credentials to complete the sign in process.

	![](../images/dp500-create-a-star-schema-model-image3.png)
	
5. Enter the Lab username in the **Enter your email address** and click on **Continue**

	![](../images1/dp9-3.png)
	
6. Complete the sign up process by selecting the username and entering the password provided in the environment details tab.

	![](../images1/DP500-16-57.png)
	
	![](../images1/DP500-16-58.png)	

7. You will be redirected to the Power BI sign-up page in Microsoft Edge. Select **Continue** to complete the sign up.

	![](../images/dp500-create-a-star-schema-model-image3b.png)

8. Enter a 10 digit phone number and select **Get started**. Select **Get started** once more. You will be redirected to Power BI.

9. At the top-right, select the profile icon, and then select **Start trial**.

	![](../images/dp500-create-a-dataflow-image3.png)

10. When prompted, select **Start trial**.

	![](../images/dp500-create-a-dataflow-image4.png)

11. Do any remaining tasks to complete the trial setup.

	*Tip: The Power BI web browser experience is known as the **Power BI service**.*

### Create a workspace

In this task, you will create a workspace.

1. In the Power BI service, to create a workspace, in the **Navigation** pane (located at the left), select **Workspaces**, and then select **Create workspace**.

	![](../images1/dp9-4.png)

2. In the **Create a workspace** pane (located at the right), in the **Workspace name** box, enter a name for the workspace as **DP500-<inject key="Deployment ID" enableCopy="false" />** and select **Save**.

	*The workspace name must be unique within the tenant. If you are getting an error, update the workspace name.*

	![](../images1/dp9-5.png)

### Review the data model

In this task, you will review the data model.

1. Navigate back to Power BI Desktop. If you see **Sign in** in the top right corner of the screen, sign-in again using the credentials provided on the Resources tab of the lab environment. If you are already signed in, proceed to the next step.

	![](../images1/dp-sign.png)

1. In Power BI Desktop, at the left, switch to **Model** view.

	![](../images1/dp9-6.png)


2. Use the model diagram to review the model design.

	![](../images1/dp500_09-10.png)

	*The model comprises six dimension tables and one fact table. The **Sales** fact table stores sales order details. It's a classic star schema design.*

3. Expand open the **Sales Territory** table.

	![](../images1/dp500_09-11.png)

4. Notice that the table includes a **Region** column.

	*The **Region** column stores the Adventure Works sales regions. At this organization, salespeople are only allowed to see data related to their assigned sales region. In this lab, you will implement two different row-level security techniques to enforce data permissions.*

## Create static roles

In this exercise, you will create and validate static roles, and then see how you would map security principals to the dataset roles.

### Create static roles

In this task, you will create two static roles.

1. Switch to **Report** view.

	![](../images1/dp9-7.png)

2. In the stacked column chart visual, in the legend, notice (for now) that it's possible to see many regions.

	![](../images1/dp9-8.png)

	*For now, the chart looks overly busy. That's because all regions are visible. When the solution enforces row-level security, the report consumer will see only one region.*


3. To add a security role, on the **Modeling** ribbon tab, from inside the **Security** group, select **Manage roles**.

	![](../images1/dp9-9.png)

4. In the **Manage roles** window, select **Create**.

	![](../images1/dp500_09-15.png)

5. To name the role, replace the selected text with **Australia**, and then press **Enter**.

	![](../images1/dp500_09-16.png)


6. In the **Tables** list, for the **Sales Territory** table, select the ellipsis, and then select **Add filter** > **[Region]**.

	![](../images1/dp9-12.png)

7. In the **Table filter DAX expression** box, replace **Value** with **Australia**.

	![](../images1/dp9-13.png)

	*This expression filters the **Region** column by the value **Australia**.*

8. To create another role, press **Create**.

	![](../images1/dp500_09-19.png)


9. Repeat the steps in this task to create a role named **Canada** that filters the **Region** column by **Canada**.

	![](../images1/dp9-14.png)

	*In this lab, you'll create just the two roles. Consider, however, that in a real-world solution, a role must be created for each of the 11 Adventure Works regions.*

10. Select **Save**.

	![](../images1/dp500_09-21.png)

### Validate the static roles

In this task, you will validate one of the static roles.

1. On the **Modeling** ribbon tab, from inside the **Security** group, select **View as**.

	![](../images1/dp500_09-22.png)


2. In the **View as roles** window, select the **Australia** role.

	![](../images1/dp500_09-23.png)

3. Select **OK**.

	![](../images1/dp500_09-24.png)

4. On the report page, notice that the stacked column chart visual shows only data for Australia.

	![](../images1/dp9-16.png)

5. Across the top of the report, notice the yellow banner that confirms the enforced role.

	![](../images1/dp500_09-26.png)

6. To stop viewing by using the role, at the right of the yellow banner, select **Stop viewing**.

	![](../images1/dp9-17.png)

### Publish the report

In this task, you will publish the report.

1. Save the Power BI Desktop file.

	![](../images1/dp9-18.png)
 

2. To publish the report, on the **Home** ribbon tab, select **Publish**.

	![](../images1/dp9-19.png)

3. In the **Publish to Power BI** window, select your workspace, and then select **Select**.
4. When the publishing succeeds, select **Got it**.


	![](../images1/dp9-20.png)

### Configure row-level security (*Read-only*)

In this task, you will see how to configure row-level security in the Power BI service. 

This task relies on the existence of a **Salespeople_Australia** security group in the tenant you are working in. This security group does NOT automatically exist in the tenant. If you have permissions on your tenant, you can follow the steps below. If you are using a tenant provided to you in training, you will not have the appropriate permissions to create secrurity groups. Please read through the tasks, but note that you will not be able to complete them in the absence of the existence of the security group. **After reading through, proceed to the Clean Up task.**

1. Switch to the Power BI service (web browser).

2. In the workspace landing page, notice the **Sales Analysis - Enforce model security** dataset.

	![](../images1/dp500_09-32.png)


3. Hover the cursor over the dataset, and when the ellipsis appears, select the ellipsis, and then select **Security**.

	![](../images1/dp500_09-33.png)

	*The **Security** option supports mapping Microsoft Azure Active Directory (Azure AD) security principals, which includes security groups and users.*

4. At the left, notice the list of roles, and that **Australia** is selected.

	![](../images1/dp500_09-34.png)

5. In the **Members** box, commence entering **Salespeople_Australia**. 

    *Steps 5 through 8 are for demonstration purposes only, as they rely on the creation or existence of a Salespeople_Australia security group. If you have permissions and the knowledge to create security groups, please feel free to proceed. Otherwise, continue to the Clean Up task.*

	![](../images1/dp500_09-35.png)

6. Select **Add**.

	![](../images1/dp500_09-36.png)

7. To complete the role mapping, select **Save**.

	![](../images1/dp500_09-37.png)

	*Now all members of the **Salespeople_Australia** security group are mapped to the **Australia** role, which restricts data access to view only Australian sales.*

	*In a real-world solution, each role should be mapped to a security group.*

	*This design approach is simple and effective when security groups exist for each region. However, there are disadvantages: it requires more effort to create and set up. It also requires updating and republishing the dataset when new regions are onboarded.*

	*In the next exercise, you will create a dynamic role that is data-driven. This design approach can help address these disadvantages.*

8. To return to the workspace landing page, in the **Navigation** pane, select the workspace.

## Create a dynamic role

In this exercise, you will add a table to the model, create and validate a dynamic role, and then map a security principal to the dataset role.

### Add the Salesperson table

In this task, you will add the **Salesperson** table to the model.

1. Switch to **Model** view.

	![](../images1/dp500_09-38.png)

2. On the **Home** ribbon tab, from inside the **Queries** group, select the **Transform data** icon.

	![](../images1/dp9-23.png)

	*If you are prompted to specify how to connect, **Edit Credentials** and specify how to sign-in.*

	![](../images1/dp9-24.png)

	*Select **Connect***

	![](../images1/dp9-25.png)
	 
	*If you are prompted for Encryption Support, click on **OK**
	
	 ![](../images1/dp500_09-42.png)


3. In the **Power Query Editor** window, in the **Queries** pane (located at the left), right-click the **Customer** query, and then select **Duplicate**.

	![](../images1/dp500_09-43.png)

	*Because the **Customer** query already includes steps to connect the data warehouse, duplicating it is an efficient way to commence the development of a new query.*

4. In the **Query Settings** pane (located at the right), in the **Name** box, replace the text with **Salesperson**.

	![](../images1/dp500_09-44.png)


5. In the **Applied Steps** list, right-click the **Removed Other Columns** step (third step), and then select **Delete Until End**.

	![](../images1/dp500_09-45.png)

6. When prompted to confirm deletion of the step, select **Delete**.

	![](../images1/dp9-29.png)

7. To source data from a different data warehouse table, in the **Applied Steps** list, in the **Navigation** step (second step), select the gear icon (located at the right).

	![](../images1/dp500_09-47.png)

8. In the **Navigation** window, select the **DimEmployee** table.

	![](../images1/dp9-31.png)


9. Select **OK**.

	![](../images1/dp500_09-49.png)

10. To remove unnecessary columns, on the **Home** ribbon tab, from inside the **Manage Columns** group, select the **Choose Columns** icon.

	![](../images1/dp9-32.png)

11. In the **Choose Columns** window, uncheck the **(Select All Columns)** item.

	![](../images1/dp500_09-51.png)

12. Check the following three columns:

	- EmployeeKey

	- SalesTerritoryKey

	- EmailAddress

	![](../images1/dp9-33.png)


13. Select **OK**.

	![](../images1/dp500_09-52.png)

14. To rename the **EmailAddress** column, double-click the **EmailAddress** column header.

15. Replace the text with **UPN**, and then press **Enter**.

	*UPN is an acronym for User Principal Name. The values in this column match the Azure AD account names.*

	![](../images1/dp500_09-53.png)

16. To load the table to the model, on the **Home** ribbon tab, select the **Close &amp; Apply** icon.

	![](../images1/dp500_09-54.png)

17. When the table has added to the model, notice that a relationship to the **Sales Territory** table was automatically created.

### Configure the relationship

In this task, you will configure properties of the new relationship.

1. Right-click the relationship between the **Salesperson** and **Sales Territory** tables, and then select **Properties**.

	![](../images1/dp500_09-55.png)


2. In the **Edit relationship** window, in the **Cross filter direction** dropdown list, select **Both**.

	![](../images1/dp9-37.png)


3. Check the **Apply security filter in both directions** checkbox.

	![](../images1/dp500_09-56.png)

	*Because there' a one-to-many relationship from the **Sales Territory** table to the **Salesperson** table, filters propagate only from the **Sales Territory** table to the **Salesperson** table. To force propagation in the other direction, the cross filter direction must be set to both.*
	
	> **Note**: In case you encounter this error: `Table 'Sales Territory' is configured for row-level security, introducing constraints on how security filters are specified.` Uncheck the **Apply security filter in both directions** box and continue.

	![](../images1/dp500-m09-note10a.png)
	
	![](../images1/dp500-m09-note11.png)

4. Select **OK**.

	![](../images1/dp500_09-57.png)

5. To hide the table, at the top-right of the **Salesperson** table, select the eye icon.

	![](../images1/dp500_09-58.png)

	*The purpose of the **Salesperson** table is to enforce data permissions. When hidden, report authors and the Q&A experience won't see the table or its fields.*
 

### Create a dynamic role

In this task, you will create a dynamic role, which enforces permissions based on data in the model.

1. Switch to **Report** view.

2. To add a security role, on the **Modeling** ribbon tab, from inside the **Security** group, select **Manage roles**.

	![](../images1/dp9-39.png)

3. In the **Manage roles** window, select **Create**.

	![](../images1/dp500_09-61.png)

4. To name the role, replace the selected text with **Salespeople**.

	![](../images1/dp500_09-62.png)

	*This time, only one role needs to be created.*

5. Add a filter to the **UPN** column of the **Salesperson** table.

	![](../images1/dp500_09-63.png)

6. In the **Table filter DAX expression** box, replace **"Value"** with **USERPRINCIPALNAME()**.

	![](../images1/dp500_09-64.png)

	*This expression filters the **UPN** column by the USERPRINCIPALNAME function, which returns the user principal name (UPN) of the authenticated user.*

7. Now, being under the **Salespeople** role, add a filter to the **Region** column of the **Sales Territory** table.

	![](../images1/dp500_09-65.png)

8. In the **Table filter DAX expression** box, replace **"Value"** with **Northeast**.

	![](../images1/dp500_09-66.png)

	*When the UPN filters the **Salesperson** table, it filters the **Sales Territory** table, which in turn filters the **Sales** table. This way, the authenticated user will only see sales data for their assigned region.*

7. Select **Save**.

	![](../images1/67.png)

### Validate the dynamic role

In this task, you will validate the dynamic role.

1. On the **Modeling** ribbon tab, from inside the **Security** group, select **View as**.

	![](../images1/dp9-44.png)


2. In the **View as roles** window, check **Other user**, and then in the corresponding box, enter: **michael9@adventure-works.com**

	![](../images1/dp500_09-69.png)

	*For testing purposes, **Other user** is the value that will be returned by the USERPRINCIPALNAME function. Note that this salesperson is assigned to the **Northeast** region.*

3. Check the **Salespeople** role.

	![](../images1/dp9-46.png)

4. Select **OK**.

	![](../images1/dp500_09-71.png)

5. On the report page, notice that the stacked column chart visual shows only data for Northeast.

	![](../images1/dp9-47.png)

6. Across the top of the report, notice the yellow banner that confirms the enforced role.

	![](../images1/dp500_09-73.png)


7. To stop viewing by using the role, at the right of the yellow banner, select **Stop viewing**.

	![](../images1/dp500_09-74.png)

### Finalize the design (*Read-only*)

In this task, you will finalize the design by publishing the report and mapping a security group to the role.

*The steps in this task are deliberately brief. For full step details, refer to the task steps of the previous exercise.*

1. Save the Power BI Desktop file.

	![](../images1/dp500_09-75.png)

2. Publish the report to the workspace you created at the beginning of the lab. 

3. Close Power BI Desktop.

4. Switch to the Power BI service (web browser).

5. Go to the security settings for the **Sales Analysis - Enforce model security** dataset.

6. Map the **Salespeople** security group the **Salespeople** role.

	![](../images1/dp500_09-76.png)

	*Now all members of the **Salespeople** security group are mapped to the **Salespeople** role. Providing the authenticated user is represented by a row in the **Salesperson** table, the assigned sales territory will be used to filter the sales table.*

	*This design approach is simple and effective when the data model stores the user principal name values. When salespeople are added or removed, or are assigned to different sales territories, this design approach will simply work.*

7. **Congratulations** on completing the task! Now, it's time to validate it. Here are the steps:

   - Click the **(...) icon** located at the upper right corner of the lab guide section and navigate to the **Lab Validation** Page.
   - Hit the **Validate** button for the corresponding task.
   - If you receive a success message, you can proceed to the next task. If not, carefully read the error message and retry the step, following the instructions in the lab guide.
   - If you need any assistance, please contact us at [labs-support@spektrasystems.com](labs-support@spektrasystems.com).We are available 24/7 to help you out.
