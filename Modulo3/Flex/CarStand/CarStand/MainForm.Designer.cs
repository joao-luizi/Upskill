namespace CarStand
{
    partial class MainForm
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
            MenuStrip = new MenuStrip();
            exitToolStripMenuItem = new ToolStripMenuItem();
            gestãoDeVeiculosToolStripMenuItem = new ToolStripMenuItem();
            reInicializarBDToolStripMenuItem = new ToolStripMenuItem();
            limparBDToolStripMenuItem = new ToolStripMenuItem();
            StatusStrip = new StatusStrip();
            ToolStripStatusLabel = new ToolStripStatusLabel();
            MainPanel = new Panel();
            MenuStrip.SuspendLayout();
            StatusStrip.SuspendLayout();
            SuspendLayout();
            // 
            // MenuStrip
            // 
            MenuStrip.ImageScalingSize = new Size(24, 24);
            MenuStrip.Items.AddRange(new ToolStripItem[] { exitToolStripMenuItem, gestãoDeVeiculosToolStripMenuItem });
            MenuStrip.Location = new Point(0, 0);
            MenuStrip.Name = "MenuStrip";
            MenuStrip.Padding = new Padding(9, 3, 0, 3);
            MenuStrip.Size = new Size(1143, 35);
            MenuStrip.TabIndex = 0;
            MenuStrip.Text = "menuStrip1";
            // 
            // exitToolStripMenuItem
            // 
            exitToolStripMenuItem.Alignment = ToolStripItemAlignment.Right;
            exitToolStripMenuItem.Name = "exitToolStripMenuItem";
            exitToolStripMenuItem.Size = new Size(55, 29);
            exitToolStripMenuItem.Text = "Exit";
            // 
            // gestãoDeVeiculosToolStripMenuItem
            // 
            gestãoDeVeiculosToolStripMenuItem.DropDownItems.AddRange(new ToolStripItem[] { reInicializarBDToolStripMenuItem, limparBDToolStripMenuItem });
            gestãoDeVeiculosToolStripMenuItem.Name = "gestãoDeVeiculosToolStripMenuItem";
            gestãoDeVeiculosToolStripMenuItem.Size = new Size(177, 29);
            gestãoDeVeiculosToolStripMenuItem.Text = "Gestão de Veiculos";
            // 
            // reInicializarBDToolStripMenuItem
            // 
            reInicializarBDToolStripMenuItem.Name = "reInicializarBDToolStripMenuItem";
            reInicializarBDToolStripMenuItem.Size = new Size(232, 34);
            reInicializarBDToolStripMenuItem.Text = "ReInicializar BD";
            // 
            // limparBDToolStripMenuItem
            // 
            limparBDToolStripMenuItem.Name = "limparBDToolStripMenuItem";
            limparBDToolStripMenuItem.Size = new Size(232, 34);
            limparBDToolStripMenuItem.Text = "Limpar BD";
            // 
            // StatusStrip
            // 
            StatusStrip.ImageScalingSize = new Size(24, 24);
            StatusStrip.Items.AddRange(new ToolStripItem[] { ToolStripStatusLabel });
            StatusStrip.Location = new Point(0, 718);
            StatusStrip.Name = "StatusStrip";
            StatusStrip.Padding = new Padding(1, 0, 20, 0);
            StatusStrip.Size = new Size(1143, 32);
            StatusStrip.TabIndex = 1;
            StatusStrip.Text = "statusStrip1";
            // 
            // ToolStripStatusLabel
            // 
            ToolStripStatusLabel.Name = "ToolStripStatusLabel";
            ToolStripStatusLabel.Size = new Size(179, 25);
            ToolStripStatusLabel.Text = "toolStripStatusLabel1";
            // 
            // MainPanel
            // 
            MainPanel.Dock = DockStyle.Fill;
            MainPanel.Location = new Point(0, 35);
            MainPanel.Margin = new Padding(4, 5, 4, 5);
            MainPanel.Name = "MainPanel";
            MainPanel.Size = new Size(1143, 683);
            MainPanel.TabIndex = 2;
            // 
            // MainForm
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(1143, 750);
            Controls.Add(MainPanel);
            Controls.Add(StatusStrip);
            Controls.Add(MenuStrip);
            FormBorderStyle = FormBorderStyle.FixedSingle;
            MainMenuStrip = MenuStrip;
            Margin = new Padding(4, 5, 4, 5);
            Name = "MainForm";
            StartPosition = FormStartPosition.CenterScreen;
            Text = "MainForm";
            WindowState = FormWindowState.Maximized;
            Load += MainForm_Load;
            MenuStrip.ResumeLayout(false);
            MenuStrip.PerformLayout();
            StatusStrip.ResumeLayout(false);
            StatusStrip.PerformLayout();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private MenuStrip MenuStrip;
        private StatusStrip StatusStrip;
        private ToolStripStatusLabel ToolStripStatusLabel;
        private ToolStripMenuItem exitToolStripMenuItem;
        private Panel MainPanel;
        private ToolStripMenuItem gestãoDeVeiculosToolStripMenuItem;
        private ToolStripMenuItem reInicializarBDToolStripMenuItem;
        private ToolStripMenuItem limparBDToolStripMenuItem;
    }
}