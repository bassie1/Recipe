namespace RecipeWinForms
{
    partial class frmRecipe
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            tblMain = new TableLayoutPanel();
            lblCaptionRecipeName = new Label();
            lblCaptionCalories = new Label();
            lblCaptionDateDrafted = new Label();
            lblCaptionDatePublished = new Label();
            lblCaptionDateArchived = new Label();
            lblCaptionRecipeStatus = new Label();
            txtRecipeName = new TextBox();
            txtDatePublished = new TextBox();
            txtDateArchived = new TextBox();
            txtRecipeStatus = new TextBox();
            dtpDateDrafted = new DateTimePicker();
            txtCalories = new TextBox();
            lblCuisine = new Label();
            lblUSerName = new Label();
            tblToolbar = new TableLayoutPanel();
            btnSave = new Button();
            btnDelete = new Button();
            lstCuisineType = new ComboBox();
            lstUserName = new ComboBox();
            tblMain.SuspendLayout();
            tblToolbar.SuspendLayout();
            SuspendLayout();
            // 
            // tblMain
            // 
            tblMain.ColumnCount = 2;
            tblMain.ColumnStyles.Add(new ColumnStyle());
            tblMain.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100F));
            tblMain.Controls.Add(lblCaptionRecipeName, 0, 0);
            tblMain.Controls.Add(lblCaptionCalories, 0, 1);
            tblMain.Controls.Add(lblCaptionDateDrafted, 0, 4);
            tblMain.Controls.Add(lblCaptionDatePublished, 0, 5);
            tblMain.Controls.Add(lblCaptionDateArchived, 0, 6);
            tblMain.Controls.Add(lblCaptionRecipeStatus, 0, 7);
            tblMain.Controls.Add(txtRecipeName, 1, 0);
            tblMain.Controls.Add(txtDatePublished, 1, 5);
            tblMain.Controls.Add(txtDateArchived, 1, 6);
            tblMain.Controls.Add(txtRecipeStatus, 1, 7);
            tblMain.Controls.Add(dtpDateDrafted, 1, 4);
            tblMain.Controls.Add(txtCalories, 1, 1);
            tblMain.Controls.Add(lblCuisine, 0, 2);
            tblMain.Controls.Add(lblUSerName, 0, 3);
            tblMain.Controls.Add(tblToolbar, 0, 8);
            tblMain.Controls.Add(lstCuisineType, 1, 2);
            tblMain.Controls.Add(lstUserName, 1, 3);
            tblMain.Dock = DockStyle.Fill;
            tblMain.Font = new Font("Segoe UI", 13.8F, FontStyle.Regular, GraphicsUnit.Point);
            tblMain.Location = new Point(0, 0);
            tblMain.Name = "tblMain";
            tblMain.RowCount = 9;
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 10.451232F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 10.451232F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 10.451232F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 10.451232F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 10.451232F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 10.451232F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 10.451232F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 10.451232F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 16.3901443F));
            tblMain.Size = new Size(781, 555);
            tblMain.TabIndex = 0;
            // 
            // lblCaptionRecipeName
            // 
            lblCaptionRecipeName.Anchor = AnchorStyles.Left;
            lblCaptionRecipeName.AutoSize = true;
            lblCaptionRecipeName.Font = new Font("Segoe UI", 13.8F, FontStyle.Regular, GraphicsUnit.Point);
            lblCaptionRecipeName.Location = new Point(3, 13);
            lblCaptionRecipeName.Name = "lblCaptionRecipeName";
            lblCaptionRecipeName.Size = new Size(149, 31);
            lblCaptionRecipeName.TabIndex = 0;
            lblCaptionRecipeName.Text = "Recipe Name";
            lblCaptionRecipeName.TextAlign = ContentAlignment.MiddleLeft;
            // 
            // lblCaptionCalories
            // 
            lblCaptionCalories.Anchor = AnchorStyles.Left;
            lblCaptionCalories.AutoSize = true;
            lblCaptionCalories.Font = new Font("Segoe UI", 13.8F, FontStyle.Regular, GraphicsUnit.Point);
            lblCaptionCalories.Location = new Point(3, 71);
            lblCaptionCalories.Name = "lblCaptionCalories";
            lblCaptionCalories.Size = new Size(95, 31);
            lblCaptionCalories.TabIndex = 2;
            lblCaptionCalories.Text = "Calories";
            lblCaptionCalories.TextAlign = ContentAlignment.MiddleLeft;
            // 
            // lblCaptionDateDrafted
            // 
            lblCaptionDateDrafted.Anchor = AnchorStyles.Left;
            lblCaptionDateDrafted.AutoSize = true;
            lblCaptionDateDrafted.Font = new Font("Segoe UI", 13.8F, FontStyle.Regular, GraphicsUnit.Point);
            lblCaptionDateDrafted.Location = new Point(3, 245);
            lblCaptionDateDrafted.Name = "lblCaptionDateDrafted";
            lblCaptionDateDrafted.Size = new Size(145, 31);
            lblCaptionDateDrafted.TabIndex = 3;
            lblCaptionDateDrafted.Text = "Date Drafted";
            lblCaptionDateDrafted.TextAlign = ContentAlignment.MiddleLeft;
            // 
            // lblCaptionDatePublished
            // 
            lblCaptionDatePublished.Anchor = AnchorStyles.Left;
            lblCaptionDatePublished.AutoSize = true;
            lblCaptionDatePublished.Font = new Font("Segoe UI", 13.8F, FontStyle.Regular, GraphicsUnit.Point);
            lblCaptionDatePublished.Location = new Point(3, 303);
            lblCaptionDatePublished.Name = "lblCaptionDatePublished";
            lblCaptionDatePublished.Size = new Size(169, 31);
            lblCaptionDatePublished.TabIndex = 4;
            lblCaptionDatePublished.Text = "Date Published";
            lblCaptionDatePublished.TextAlign = ContentAlignment.MiddleLeft;
            // 
            // lblCaptionDateArchived
            // 
            lblCaptionDateArchived.Anchor = AnchorStyles.Left;
            lblCaptionDateArchived.AutoSize = true;
            lblCaptionDateArchived.Font = new Font("Segoe UI", 13.8F, FontStyle.Regular, GraphicsUnit.Point);
            lblCaptionDateArchived.Location = new Point(3, 361);
            lblCaptionDateArchived.Name = "lblCaptionDateArchived";
            lblCaptionDateArchived.Size = new Size(158, 31);
            lblCaptionDateArchived.TabIndex = 5;
            lblCaptionDateArchived.Text = "Date Archived";
            lblCaptionDateArchived.TextAlign = ContentAlignment.MiddleLeft;
            // 
            // lblCaptionRecipeStatus
            // 
            lblCaptionRecipeStatus.Anchor = AnchorStyles.Left;
            lblCaptionRecipeStatus.AutoSize = true;
            lblCaptionRecipeStatus.Font = new Font("Segoe UI", 13.8F, FontStyle.Regular, GraphicsUnit.Point);
            lblCaptionRecipeStatus.Location = new Point(3, 419);
            lblCaptionRecipeStatus.Name = "lblCaptionRecipeStatus";
            lblCaptionRecipeStatus.Size = new Size(150, 31);
            lblCaptionRecipeStatus.TabIndex = 6;
            lblCaptionRecipeStatus.Text = "Recipe Status";
            lblCaptionRecipeStatus.TextAlign = ContentAlignment.MiddleLeft;
            // 
            // txtRecipeName
            // 
            txtRecipeName.BorderStyle = BorderStyle.FixedSingle;
            txtRecipeName.Dock = DockStyle.Fill;
            txtRecipeName.Font = new Font("Segoe UI", 13.8F, FontStyle.Regular, GraphicsUnit.Point);
            txtRecipeName.Location = new Point(178, 3);
            txtRecipeName.Name = "txtRecipeName";
            txtRecipeName.Size = new Size(600, 38);
            txtRecipeName.TabIndex = 9;
            // 
            // txtDatePublished
            // 
            txtDatePublished.BorderStyle = BorderStyle.FixedSingle;
            txtDatePublished.Dock = DockStyle.Fill;
            txtDatePublished.Font = new Font("Segoe UI", 13.8F, FontStyle.Regular, GraphicsUnit.Point);
            txtDatePublished.Location = new Point(178, 293);
            txtDatePublished.Name = "txtDatePublished";
            txtDatePublished.Size = new Size(600, 38);
            txtDatePublished.TabIndex = 11;
            // 
            // txtDateArchived
            // 
            txtDateArchived.BorderStyle = BorderStyle.FixedSingle;
            txtDateArchived.Dock = DockStyle.Fill;
            txtDateArchived.Font = new Font("Segoe UI", 13.8F, FontStyle.Regular, GraphicsUnit.Point);
            txtDateArchived.Location = new Point(178, 351);
            txtDateArchived.Name = "txtDateArchived";
            txtDateArchived.Size = new Size(600, 38);
            txtDateArchived.TabIndex = 12;
            // 
            // txtRecipeStatus
            // 
            txtRecipeStatus.BorderStyle = BorderStyle.FixedSingle;
            txtRecipeStatus.Dock = DockStyle.Fill;
            txtRecipeStatus.Font = new Font("Segoe UI", 13.8F, FontStyle.Regular, GraphicsUnit.Point);
            txtRecipeStatus.Location = new Point(178, 409);
            txtRecipeStatus.Name = "txtRecipeStatus";
            txtRecipeStatus.Size = new Size(600, 38);
            txtRecipeStatus.TabIndex = 13;
            // 
            // dtpDateDrafted
            // 
            dtpDateDrafted.Dock = DockStyle.Left;
            dtpDateDrafted.Format = DateTimePickerFormat.Short;
            dtpDateDrafted.Location = new Point(178, 235);
            dtpDateDrafted.Name = "dtpDateDrafted";
            dtpDateDrafted.Size = new Size(211, 38);
            dtpDateDrafted.TabIndex = 15;
            // 
            // txtCalories
            // 
            txtCalories.Dock = DockStyle.Fill;
            txtCalories.Location = new Point(178, 61);
            txtCalories.Name = "txtCalories";
            txtCalories.Size = new Size(600, 38);
            txtCalories.TabIndex = 17;
            // 
            // lblCuisine
            // 
            lblCuisine.Anchor = AnchorStyles.Left;
            lblCuisine.AutoSize = true;
            lblCuisine.Location = new Point(3, 129);
            lblCuisine.Name = "lblCuisine";
            lblCuisine.Size = new Size(88, 31);
            lblCuisine.TabIndex = 18;
            lblCuisine.Text = "Cuisine";
            // 
            // lblUSerName
            // 
            lblUSerName.Anchor = AnchorStyles.Left;
            lblUSerName.AutoSize = true;
            lblUSerName.Location = new Point(3, 187);
            lblUSerName.Name = "lblUSerName";
            lblUSerName.Size = new Size(121, 31);
            lblUSerName.TabIndex = 19;
            lblUSerName.Text = "UserName";
            // 
            // tblToolbar
            // 
            tblToolbar.ColumnCount = 2;
            tblMain.SetColumnSpan(tblToolbar, 2);
            tblToolbar.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 43.8709679F));
            tblToolbar.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 56.1290321F));
            tblToolbar.Controls.Add(btnSave, 1, 0);
            tblToolbar.Controls.Add(btnDelete, 0, 0);
            tblToolbar.Dock = DockStyle.Fill;
            tblToolbar.Location = new Point(3, 467);
            tblToolbar.Name = "tblToolbar";
            tblToolbar.RowCount = 1;
            tblToolbar.RowStyles.Add(new RowStyle(SizeType.Percent, 50F));
            tblToolbar.Size = new Size(775, 85);
            tblToolbar.TabIndex = 20;
            // 
            // btnSave
            // 
            btnSave.Anchor = AnchorStyles.Bottom;
            btnSave.AutoSize = true;
            btnSave.Location = new Point(490, 41);
            btnSave.Name = "btnSave";
            btnSave.Size = new Size(134, 41);
            btnSave.TabIndex = 2;
            btnSave.Text = "Save";
            btnSave.UseVisualStyleBackColor = true;
            // 
            // btnDelete
            // 
            btnDelete.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
            btnDelete.AutoSize = true;
            btnDelete.Location = new Point(207, 41);
            btnDelete.Name = "btnDelete";
            btnDelete.Size = new Size(130, 41);
            btnDelete.TabIndex = 1;
            btnDelete.Text = "Delete";
            btnDelete.UseVisualStyleBackColor = true;
            // 
            // lstCuisineType
            // 
            lstCuisineType.FormattingEnabled = true;
            lstCuisineType.Location = new Point(178, 119);
            lstCuisineType.Name = "lstCuisineType";
            lstCuisineType.Size = new Size(151, 39);
            lstCuisineType.TabIndex = 21;
            // 
            // lstUserName
            // 
            lstUserName.FormattingEnabled = true;
            lstUserName.Location = new Point(178, 177);
            lstUserName.Name = "lstUserName";
            lstUserName.Size = new Size(151, 39);
            lstUserName.TabIndex = 22;
            // 
            // frmRecipe
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(781, 555);
            Controls.Add(tblMain);
            Name = "frmRecipe";
            Text = "frmRecipe";
            tblMain.ResumeLayout(false);
            tblMain.PerformLayout();
            tblToolbar.ResumeLayout(false);
            tblToolbar.PerformLayout();
            ResumeLayout(false);
        }

        #endregion

        private TableLayoutPanel tblMain;
        private Label lblCaptionRecipeName;
        private Label lblCaptionCalories;
        private Label lblCaptionDateDrafted;
        private Label lblCaptionDatePublished;
        private Label lblCaptionDateArchived;
        private Label lblCaptionRecipeStatus;
        private TextBox txtRecipeName;
        private TextBox txtRecipeStatus;
        private TextBox txtDatePublished;
        private TextBox txtDateArchived;
        private DateTimePicker dtpDateDrafted;
        private TextBox txtCalories;
        private Label lblCuisine;
        private Label lblUSerName;
        private TableLayoutPanel tblToolbar;
        private Button btnSave;
        private Button btnDelete;
        private ComboBox lstCuisineType;
        private ComboBox lstUserName;
    }
}