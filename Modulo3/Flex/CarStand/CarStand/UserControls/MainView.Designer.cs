namespace CarStand
{
    partial class MainView
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            LayoutPanel = new TableLayoutPanel();
            PanelFilters = new Panel();
            btPesquisa = new Button();
            SortOrderEstado = new Label();
            lblEstado = new Label();
            cbEstado = new ComboBox();
            SortOrderAnos = new Label();
            lblAnos = new Label();
            cbAnos = new ComboBox();
            SortOrderMarcas = new Label();
            lblMarcas = new Label();
            cbMarcas = new ComboBox();
            btAddNew = new Button();
            panelDgv = new Panel();
            dgvMain = new DataGridView();
            lblModelos = new Label();
            cbModelos = new ComboBox();
            SortOrderModelos = new Label();
            Marca = new DataGridViewTextBoxColumn();
            Modelo = new DataGridViewTextBoxColumn();
            Ano = new DataGridViewTextBoxColumn();
            Inspecao = new DataGridViewTextBoxColumn();
            Estado = new DataGridViewTextBoxColumn();
            Actions = new DataGridViewButtonColumn();
            LayoutPanel.SuspendLayout();
            PanelFilters.SuspendLayout();
            panelDgv.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)dgvMain).BeginInit();
            SuspendLayout();
            // 
            // LayoutPanel
            // 
            LayoutPanel.ColumnCount = 1;
            LayoutPanel.ColumnStyles.Add(new ColumnStyle(SizeType.Percent, 100F));
            LayoutPanel.Controls.Add(PanelFilters, 0, 0);
            LayoutPanel.Controls.Add(panelDgv, 0, 1);
            LayoutPanel.Dock = DockStyle.Fill;
            LayoutPanel.Location = new Point(0, 0);
            LayoutPanel.Name = "LayoutPanel";
            LayoutPanel.RowCount = 2;
            LayoutPanel.RowStyles.Add(new RowStyle(SizeType.Absolute, 80F));
            LayoutPanel.RowStyles.Add(new RowStyle(SizeType.Percent, 100F));
            LayoutPanel.RowStyles.Add(new RowStyle(SizeType.Absolute, 20F));
            LayoutPanel.Size = new Size(635, 202);
            LayoutPanel.TabIndex = 0;
            // 
            // PanelFilters
            // 
            PanelFilters.BackColor = Color.White;
            PanelFilters.Controls.Add(btAddNew);
            PanelFilters.Controls.Add(SortOrderModelos);
            PanelFilters.Controls.Add(lblModelos);
            PanelFilters.Controls.Add(cbModelos);
            PanelFilters.Controls.Add(btPesquisa);
            PanelFilters.Controls.Add(SortOrderEstado);
            PanelFilters.Controls.Add(lblEstado);
            PanelFilters.Controls.Add(cbEstado);
            PanelFilters.Controls.Add(SortOrderAnos);
            PanelFilters.Controls.Add(lblAnos);
            PanelFilters.Controls.Add(cbAnos);
            PanelFilters.Controls.Add(SortOrderMarcas);
            PanelFilters.Controls.Add(lblMarcas);
            PanelFilters.Controls.Add(cbMarcas);
            PanelFilters.Dock = DockStyle.Fill;
            PanelFilters.Location = new Point(3, 3);
            PanelFilters.Name = "PanelFilters";
            PanelFilters.Size = new Size(629, 74);
            PanelFilters.TabIndex = 0;
            // 
            // btPesquisa
            // 
            btPesquisa.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            btPesquisa.Location = new Point(547, 6);
            btPesquisa.Name = "btPesquisa";
            btPesquisa.Size = new Size(75, 23);
            btPesquisa.TabIndex = 1;
            btPesquisa.Text = "Pesquisar";
            btPesquisa.UseVisualStyleBackColor = true;
            btPesquisa.Click += btPesquisa_Click;
            // 
            // SortOrderEstado
            // 
            SortOrderEstado.AutoSize = true;
            SortOrderEstado.Font = new Font("Segoe UI", 11F);
            SortOrderEstado.Location = new Point(400, 47);
            SortOrderEstado.Name = "SortOrderEstado";
            SortOrderEstado.Size = new Size(16, 20);
            SortOrderEstado.TabIndex = 8;
            SortOrderEstado.Text = "↑";
            // 
            // lblEstado
            // 
            lblEstado.AutoSize = true;
            lblEstado.Font = new Font("Segoe UI", 11F);
            lblEstado.Location = new Point(216, 47);
            lblEstado.Name = "lblEstado";
            lblEstado.Size = new Size(54, 20);
            lblEstado.TabIndex = 7;
            lblEstado.Text = "Estado";
            // 
            // cbEstado
            // 
            cbEstado.Font = new Font("Segoe UI", 11F);
            cbEstado.FormattingEnabled = true;
            cbEstado.Location = new Point(274, 43);
            cbEstado.Name = "cbEstado";
            cbEstado.Size = new Size(121, 28);
            cbEstado.TabIndex = 6;
            // 
            // SortOrderAnos
            // 
            SortOrderAnos.AutoSize = true;
            SortOrderAnos.Font = new Font("Segoe UI", 11F);
            SortOrderAnos.Location = new Point(400, 16);
            SortOrderAnos.Name = "SortOrderAnos";
            SortOrderAnos.Size = new Size(16, 20);
            SortOrderAnos.TabIndex = 5;
            SortOrderAnos.Text = "↑";
            // 
            // lblAnos
            // 
            lblAnos.AutoSize = true;
            lblAnos.Font = new Font("Segoe UI", 11F);
            lblAnos.Location = new Point(228, 16);
            lblAnos.Name = "lblAnos";
            lblAnos.Size = new Size(42, 20);
            lblAnos.TabIndex = 4;
            lblAnos.Text = "Anos";
            // 
            // cbAnos
            // 
            cbAnos.Font = new Font("Segoe UI", 11F);
            cbAnos.FormattingEnabled = true;
            cbAnos.Location = new Point(274, 12);
            cbAnos.Name = "cbAnos";
            cbAnos.Size = new Size(121, 28);
            cbAnos.TabIndex = 3;
            // 
            // SortOrderMarcas
            // 
            SortOrderMarcas.AutoSize = true;
            SortOrderMarcas.Font = new Font("Segoe UI", 11F);
            SortOrderMarcas.Location = new Point(198, 16);
            SortOrderMarcas.Name = "SortOrderMarcas";
            SortOrderMarcas.Size = new Size(16, 20);
            SortOrderMarcas.TabIndex = 2;
            SortOrderMarcas.Text = "↑";
            // 
            // lblMarcas
            // 
            lblMarcas.AutoSize = true;
            lblMarcas.Font = new Font("Segoe UI", 11F);
            lblMarcas.Location = new Point(3, 16);
            lblMarcas.Name = "lblMarcas";
            lblMarcas.Size = new Size(56, 20);
            lblMarcas.TabIndex = 1;
            lblMarcas.Text = "Marcas";
            // 
            // cbMarcas
            // 
            cbMarcas.Font = new Font("Segoe UI", 11F);
            cbMarcas.FormattingEnabled = true;
            cbMarcas.Location = new Point(72, 12);
            cbMarcas.Name = "cbMarcas";
            cbMarcas.Size = new Size(121, 28);
            cbMarcas.TabIndex = 0;
            // 
            // btAddNew
            // 
            btAddNew.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            btAddNew.Location = new Point(547, 35);
            btAddNew.Name = "btAddNew";
            btAddNew.Size = new Size(75, 23);
            btAddNew.TabIndex = 0;
            btAddNew.Text = "Adicionar";
            btAddNew.UseVisualStyleBackColor = true;
            // 
            // panelDgv
            // 
            panelDgv.BackColor = Color.White;
            panelDgv.Controls.Add(dgvMain);
            panelDgv.Dock = DockStyle.Fill;
            panelDgv.Location = new Point(3, 83);
            panelDgv.Name = "panelDgv";
            panelDgv.Size = new Size(629, 116);
            panelDgv.TabIndex = 2;
            // 
            // dgvMain
            // 
            dgvMain.AllowUserToAddRows = false;
            dgvMain.AllowUserToDeleteRows = false;
            dgvMain.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgvMain.Columns.AddRange(new DataGridViewColumn[] { Marca, Modelo, Ano, Inspecao, Estado, Actions });
            dgvMain.Dock = DockStyle.Fill;
            dgvMain.Location = new Point(0, 0);
            dgvMain.Name = "dgvMain";
            dgvMain.ReadOnly = true;
            dgvMain.Size = new Size(629, 116);
            dgvMain.TabIndex = 0;
            // 
            // lblModelos
            // 
            lblModelos.AutoSize = true;
            lblModelos.Font = new Font("Segoe UI", 11F);
            lblModelos.Location = new Point(3, 47);
            lblModelos.Name = "lblModelos";
            lblModelos.Size = new Size(67, 20);
            lblModelos.TabIndex = 10;
            lblModelos.Text = "Modelos";
            // 
            // cbModelos
            // 
            cbModelos.Font = new Font("Segoe UI", 11F);
            cbModelos.FormattingEnabled = true;
            cbModelos.Location = new Point(72, 43);
            cbModelos.Name = "cbModelos";
            cbModelos.Size = new Size(121, 28);
            cbModelos.TabIndex = 9;
            // 
            // SortOrderModelos
            // 
            SortOrderModelos.AutoSize = true;
            SortOrderModelos.Font = new Font("Segoe UI", 11F);
            SortOrderModelos.Location = new Point(198, 48);
            SortOrderModelos.Name = "SortOrderModelos";
            SortOrderModelos.Size = new Size(16, 20);
            SortOrderModelos.TabIndex = 11;
            SortOrderModelos.Text = "↑";
            // 
            // Marca
            // 
            Marca.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            Marca.HeaderText = "Marca";
            Marca.Name = "Marca";
            Marca.ReadOnly = true;
            // 
            // Modelo
            // 
            Modelo.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            Modelo.HeaderText = "Modelo";
            Modelo.Name = "Modelo";
            Modelo.ReadOnly = true;
            // 
            // Ano
            // 
            Ano.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            Ano.FillWeight = 80F;
            Ano.HeaderText = "Ano";
            Ano.Name = "Ano";
            Ano.ReadOnly = true;
            // 
            // Inspecao
            // 
            Inspecao.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            Inspecao.FillWeight = 120F;
            Inspecao.HeaderText = "Última Inspeção";
            Inspecao.Name = "Inspecao";
            Inspecao.ReadOnly = true;
            // 
            // Estado
            // 
            Estado.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            Estado.HeaderText = "Estado";
            Estado.Name = "Estado";
            Estado.ReadOnly = true;
            // 
            // Actions
            // 
            Actions.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            Actions.FillWeight = 200F;
            Actions.HeaderText = "Ações";
            Actions.Name = "Actions";
            Actions.ReadOnly = true;
            // 
            // MainView
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            Controls.Add(LayoutPanel);
            MinimumSize = new Size(635, 150);
            Name = "MainView";
            Size = new Size(635, 202);
            LayoutPanel.ResumeLayout(false);
            PanelFilters.ResumeLayout(false);
            PanelFilters.PerformLayout();
            panelDgv.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)dgvMain).EndInit();
            ResumeLayout(false);
        }

        #endregion

        private TableLayoutPanel LayoutPanel;
        private Panel PanelFilters;
        private ComboBox cbMarcas;
        private Label lblMarcas;
        private Label SortOrderAnos;
        private Label lblAnos;
        private ComboBox cbAnos;
        private Label SortOrderMarcas;
        private Label SortOrderEstado;
        private Label lblEstado;
        private ComboBox cbEstado;
        private Panel panelInsertBt;
        private Button btAddNew;
        private Panel panelDgv;
        private DataGridView dgvMain;
        private Button btPesquisa;
        private Label lblModelos;
        private ComboBox cbModelos;
        private Label SortOrderModelos;
        private DataGridViewTextBoxColumn Marca;
        private DataGridViewTextBoxColumn Modelo;
        private DataGridViewTextBoxColumn Ano;
        private DataGridViewTextBoxColumn Inspecao;
        private DataGridViewTextBoxColumn Estado;
        private DataGridViewButtonColumn Actions;
    }
}
