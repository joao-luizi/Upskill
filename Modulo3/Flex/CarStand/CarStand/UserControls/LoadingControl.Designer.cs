using System.Reflection;

namespace CarStand
{
    partial class LoadingControl
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
                picSpinner.Image?.Dispose();
                stream?.Dispose();
                components?.Dispose();
                components.Dispose();
                
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            tableLayoutPanel1 = new TableLayoutPanel();
            lblMessage = new Label();
            picSpinner = new PictureBox();
            tableLayoutPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)picSpinner).BeginInit();
            SuspendLayout();
            // 
            // tableLayoutPanel1
            // 
            tableLayoutPanel1.ColumnCount = 1;
            tableLayoutPanel1.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100F));
            tableLayoutPanel1.Controls.Add(lblMessage, 0, 1);
            tableLayoutPanel1.Controls.Add(picSpinner, 0, 0);
            tableLayoutPanel1.Dock = DockStyle.Fill;
            tableLayoutPanel1.Location = new Point(0, 0);
            tableLayoutPanel1.Name = "tableLayoutPanel1";
            tableLayoutPanel1.RowCount = 2;
            tableLayoutPanel1.RowStyles.Add(new RowStyle(SizeType.Percent, 100F));
            tableLayoutPanel1.RowStyles.Add(new RowStyle(SizeType.Absolute, 30F));
            tableLayoutPanel1.Size = new Size(250, 250);
            tableLayoutPanel1.TabIndex = 0;
            // 
            // lblMessage
            // 
            lblMessage.Dock = DockStyle.Fill;
            lblMessage.Location = new Point(3, 220);
            lblMessage.Name = "lblMessage";
            lblMessage.Size = new Size(244, 30);
            lblMessage.TabIndex = 0;
            lblMessage.Text = "label1";
            lblMessage.TextAlign = ContentAlignment.MiddleCenter;
            // 
            // picSpinner
            // 
            picSpinner.Dock = DockStyle.Fill;
            picSpinner.Location = new Point(3, 3);
            picSpinner.Name = "picSpinner";
            picSpinner.Size = new Size(244, 214);
            picSpinner.SizeMode = PictureBoxSizeMode.Zoom;
            picSpinner.TabIndex = 1;
            picSpinner.TabStop = false;
            // 
            // LoadingControl
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            BackColor = Color.White;
            Controls.Add(tableLayoutPanel1);
            Name = "LoadingControl";
            Size = new Size(250, 250);
            tableLayoutPanel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)picSpinner).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private TableLayoutPanel tableLayoutPanel1;
        private Label lblMessage;
        private PictureBox picSpinner;
    }
}
