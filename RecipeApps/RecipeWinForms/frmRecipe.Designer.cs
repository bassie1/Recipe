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
            tblToolbar = new TableLayoutPanel();
            btnSave = new Button();
            btnDelete = new Button();
            txtCalories = new TextBox();
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
            tblMain.Controls.Add(lblCaptionDateDrafted, 0, 2);
            tblMain.Controls.Add(lblCaptionDatePublished, 0, 3);
            tblMain.Controls.Add(lblCaptionDateArchived, 0, 4);
            tblMain.Controls.Add(lblCaptionRecipeStatus, 0, 5);
            tblMain.Controls.Add(txtRecipeName, 1, 0);
            tblMain.Controls.Add(txtDatePublished, 1, 3);
            tblMain.Controls.Add(txtDateArchived, 1, 4);
            tblMain.Controls.Add(txtRecipeStatus, 1, 5);
            tblMain.Controls.Add(dtpDateDrafted, 1, 2);
            tblMain.Controls.Add(tblToolbar, 1, 6);
            tblMain.Controls.Add(txtCalories, 1, 1);
            tblMain.Dock = DockStyle.Fill;
            tblMain.Font = new Font("Segoe UI", 13.8F, FontStyle.Regular, GraphicsUnit.Point);
            tblMain.Location = new Point(0, 0);
            tblMain.Name = "tblMain";
            tblMain.RowCount = 5;
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 13.88889F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 13.8888865F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 13.8888874F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 13.8888874F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 13.8888874F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 13.8888874F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Percent, 16.6666641F));
            tblMain.RowStyles.Add(new RowStyle(SizeType.Absolute, 84F));
            tblMain.Size = new Size(731, 444);
            tblMain.TabIndex = 0;
            // 
            // lblCaptionRecipeName
            // 
            lblCaptionRecipeName.Anchor = AnchorStyles.Left;
            lblCaptionRecipeName.AutoSize = true;
            lblCaptionRecipeName.Font = new Font("Segoe UI", 13.8F, FontStyle.Regular, GraphicsUnit.Point);
            lblCaptionRecipeName.Location = new Point(3, 15);
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
            lblCaptionCalories.Location = new Point(3, 76);
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
            lblCaptionDateDrafted.Location = new Point(3, 137);
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
            lblCaptionDatePublished.Location = new Point(3, 198);
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
            lblCaptionDateArchived.Location = new Point(3, 259);
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
            lblCaptionRecipeStatus.Location = new Point(3, 320);
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
            txtRecipeName.Size = new Size(550, 38);
            txtRecipeName.TabIndex = 9;
            // 
            // txtDatePublished
            // 
            txtDatePublished.BorderStyle = BorderStyle.FixedSingle;
            txtDatePublished.Dock = DockStyle.Fill;
            txtDatePublished.Font = new Font("Segoe UI", 13.8F, FontStyle.Regular, GraphicsUnit.Point);
            txtDatePublished.Location = new Point(178, 186);
            txtDatePublished.Name = "txtDatePublished";
            txtDatePublished.Size = new Size(550, 38);
            txtDatePublished.TabIndex = 11;
            // 
            // txtDateArchived
            // 
            txtDateArchived.BorderStyle = BorderStyle.FixedSingle;
            txtDateArchived.Dock = DockStyle.Fill;
            txtDateArchived.Font = new Font("Segoe UI", 13.8F, FontStyle.Regular, GraphicsUnit.Point);
            txtDateArchived.Location = new Point(178, 247);
            txtDateArchived.Name = "txtDateArchived";
            txtDateArchived.Size = new Size(550, 38);
            txtDateArchived.TabIndex = 12;
            // 
            // txtRecipeStatus
            // 
            txtRecipeStatus.BorderStyle = BorderStyle.FixedSingle;
            txtRecipeStatus.Dock = DockStyle.Fill;
            txtRecipeStatus.Font = new Font("Segoe UI", 13.8F, FontStyle.Regular, GraphicsUnit.Point);
            txtRecipeStatus.Location = new Point(178, 308);
            txtRecipeStatus.Name = "txtRecipeStatus";
            txtRecipeStatus.Size = new Size(550, 38);
            txtRecipeStatus.TabIndex = 13;
            // 
            // dtpDateDrafted
            // 
            dtpDateDrafted.Dock = DockStyle.Left;
            dtpDateDrafted.Format = DateTimePickerFormat.Short;
            dtpDateDrafted.Location = new Point(178, 125);
            dtpDateDrafted.Name = "dtpDateDrafted";
            dtpDateDrafted.Size = new Size(211, 38);
            dtpDateDrafted.TabIndex = 15;
            // 
            // tblToolbar
            // 
            tblToolbar.ColumnCount = 2;
            tblToolbar.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 50F));
            tblToolbar.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 50F));
            tblToolbar.Controls.Add(btnSave, 1, 0);
            tblToolbar.Controls.Add(btnDelete, 0, 0);
            tblToolbar.Dock = DockStyle.Fill;
            tblToolbar.Location = new Point(178, 369);
            tblToolbar.Name = "tblToolbar";
            tblToolbar.RowCount = 1;
            tblToolbar.RowStyles.Add(new RowStyle(SizeType.Percent, 50F));
            tblToolbar.Size = new Size(550, 72);
            tblToolbar.TabIndex = 16;
            // 
            // btnSave
            // 
            btnSave.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
            btnSave.AutoSize = true;
            btnSave.Location = new Point(440, 28);
            btnSave.Name = "btnSave";
            btnSave.Size = new Size(107, 41);
            btnSave.TabIndex = 2;
            btnSave.Text = "Save";
            btnSave.UseVisualStyleBackColor = true;
            // 
            // btnDelete
            // 
            btnDelete.Anchor = AnchorStyles.Bottom | AnchorStyles.Right;
            btnDelete.AutoSize = true;
            btnDelete.Location = new Point(175, 28);
            btnDelete.Name = "btnDelete";
            btnDelete.Size = new Size(97, 41);
            btnDelete.TabIndex = 1;
            btnDelete.Text = "Delete";
            btnDelete.UseVisualStyleBackColor = true;
            // 
            // txtCalories
            // 
            txtCalories.Dock = DockStyle.Fill;
            txtCalories.Location = new Point(178, 64);
            txtCalories.Name = "txtCalories";
            txtCalories.Size = new Size(550, 38);
            txtCalories.TabIndex = 17;
            // 
            // frmRecipe
            // 
            AutoScaleDimensions = new SizeF(8F, 20F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(731, 444);
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
        private Button btnDelete;
        private DateTimePicker dtpDateDrafted;
        private TableLayoutPanel tblToolbar;
        private Button btnSave;
        private TextBox txtCalories;
    }
}