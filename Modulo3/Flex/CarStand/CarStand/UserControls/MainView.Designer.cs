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
            btAddNew = new Button();
            SortOrderModelos = new Label();
            lblModelos = new Label();
            cbModelos = new ComboBox();
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
            panelDgv = new Panel();
            dgvMain = new DataGridView();
            Marca = new DataGridViewTextBoxColumn();
            Modelo = new DataGridViewTextBoxColumn();
            Ano = new DataGridViewTextBoxColumn();
            Inspecao = new DataGridViewTextBoxColumn();
            Estado = new DataGridViewTextBoxColumn();
            ActionEdit = new DataGridViewButtonColumn();
            ActionRemove = new DataGridViewButtonColumn();
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
            LayoutPanel.Margin = new Padding(4, 5, 4, 5);
            LayoutPanel.Name = "LayoutPanel";
            LayoutPanel.RowCount = 2;
            LayoutPanel.RowStyles.Add(new RowStyle(SizeType.Absolute, 133F));
            LayoutPanel.RowStyles.Add(new RowStyle(SizeType.Percent, 100F));
            LayoutPanel.RowStyles.Add(new RowStyle(SizeType.Absolute, 33F));
            LayoutPanel.Size = new Size(1000, 350);
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
            PanelFilters.Location = new Point(4, 5);
            PanelFilters.Margin = new Padding(4, 5, 4, 5);
            PanelFilters.Name = "PanelFilters";
            PanelFilters.Size = new Size(992, 123);
            PanelFilters.TabIndex = 0;
            // 
            // btAddNew
            // 
            btAddNew.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            btAddNew.Location = new Point(874, 58);
            btAddNew.Margin = new Padding(4, 5, 4, 5);
            btAddNew.Name = "btAddNew";
            btAddNew.Size = new Size(107, 38);
            btAddNew.TabIndex = 0;
            btAddNew.Text = "Adicionar";
            btAddNew.UseVisualStyleBackColor = true;
            // 
            // SortOrderModelos
            // 
            SortOrderModelos.AutoSize = true;
            SortOrderModelos.Font = new Font("Segoe UI", 11F);
            SortOrderModelos.Location = new Point(329, 78);
            SortOrderModelos.Margin = new Padding(4, 0, 4, 0);
            SortOrderModelos.Name = "SortOrderModelos";
            SortOrderModelos.Size = new Size(23, 30);
            SortOrderModelos.TabIndex = 11;
            SortOrderModelos.Text = "↑";
            // 
            // lblModelos
            // 
            lblModelos.AutoSize = true;
            lblModelos.Font = new Font("Segoe UI", 11F);
            lblModelos.Location = new Point(4, 78);
            lblModelos.Margin = new Padding(4, 0, 4, 0);
            lblModelos.Name = "lblModelos";
            lblModelos.Size = new Size(98, 30);
            lblModelos.TabIndex = 10;
            lblModelos.Text = "Modelos";
            // 
            // cbModelos
            // 
            cbModelos.Font = new Font("Segoe UI", 11F);
            cbModelos.FormattingEnabled = true;
            cbModelos.Location = new Point(103, 74);
            cbModelos.Margin = new Padding(4, 5, 4, 5);
            cbModelos.Name = "cbModelos";
            cbModelos.Size = new Size(218, 38);
            cbModelos.TabIndex = 9;
            // 
            // btPesquisa
            // 
            btPesquisa.Anchor = AnchorStyles.Top | AnchorStyles.Right;
            btPesquisa.Location = new Point(874, 10);
            btPesquisa.Margin = new Padding(4, 5, 4, 5);
            btPesquisa.Name = "btPesquisa";
            btPesquisa.Size = new Size(107, 38);
            btPesquisa.TabIndex = 1;
            btPesquisa.Text = "Pesquisar";
            btPesquisa.UseVisualStyleBackColor = true;
            btPesquisa.Click += BtPesquisa_Click;
            // 
            // SortOrderEstado
            // 
            SortOrderEstado.AutoSize = true;
            SortOrderEstado.Font = new Font("Segoe UI", 11F);
            SortOrderEstado.Location = new Point(665, 78);
            SortOrderEstado.Margin = new Padding(4, 0, 4, 0);
            SortOrderEstado.Name = "SortOrderEstado";
            SortOrderEstado.Size = new Size(23, 30);
            SortOrderEstado.TabIndex = 8;
            SortOrderEstado.Text = "↑";
            // 
            // lblEstado
            // 
            lblEstado.AutoSize = true;
            lblEstado.Font = new Font("Segoe UI", 11F);
            lblEstado.Location = new Point(355, 78);
            lblEstado.Margin = new Padding(4, 0, 4, 0);
            lblEstado.Name = "lblEstado";
            lblEstado.Size = new Size(77, 30);
            lblEstado.TabIndex = 7;
            lblEstado.Text = "Estado";
            // 
            // cbEstado
            // 
            cbEstado.Font = new Font("Segoe UI", 11F);
            cbEstado.FormattingEnabled = true;
            cbEstado.Location = new Point(437, 74);
            cbEstado.Margin = new Padding(4, 5, 4, 5);
            cbEstado.Name = "cbEstado";
            cbEstado.Size = new Size(220, 38);
            cbEstado.TabIndex = 6;
            // 
            // SortOrderAnos
            // 
            SortOrderAnos.AutoSize = true;
            SortOrderAnos.Font = new Font("Segoe UI", 11F);
            SortOrderAnos.Location = new Point(666, 27);
            SortOrderAnos.Margin = new Padding(4, 0, 4, 0);
            SortOrderAnos.Name = "SortOrderAnos";
            SortOrderAnos.Size = new Size(23, 30);
            SortOrderAnos.TabIndex = 5;
            SortOrderAnos.Text = "↑";
            // 
            // lblAnos
            // 
            lblAnos.AutoSize = true;
            lblAnos.Font = new Font("Segoe UI", 11F);
            lblAnos.Location = new Point(372, 27);
            lblAnos.Margin = new Padding(4, 0, 4, 0);
            lblAnos.Name = "lblAnos";
            lblAnos.Size = new Size(61, 30);
            lblAnos.TabIndex = 4;
            lblAnos.Text = "Anos";
            // 
            // cbAnos
            // 
            cbAnos.Font = new Font("Segoe UI", 11F);
            cbAnos.FormattingEnabled = true;
            cbAnos.Location = new Point(437, 23);
            cbAnos.Margin = new Padding(4, 5, 4, 5);
            cbAnos.Name = "cbAnos";
            cbAnos.Size = new Size(218, 38);
            cbAnos.TabIndex = 3;
            // 
            // SortOrderMarcas
            // 
            SortOrderMarcas.AutoSize = true;
            SortOrderMarcas.Font = new Font("Segoe UI", 11F);
            SortOrderMarcas.Location = new Point(329, 27);
            SortOrderMarcas.Margin = new Padding(4, 0, 4, 0);
            SortOrderMarcas.Name = "SortOrderMarcas";
            SortOrderMarcas.Size = new Size(23, 30);
            SortOrderMarcas.TabIndex = 2;
            SortOrderMarcas.Text = "↑";
            // 
            // lblMarcas
            // 
            lblMarcas.AutoSize = true;
            lblMarcas.Font = new Font("Segoe UI", 11F);
            lblMarcas.Location = new Point(4, 27);
            lblMarcas.Margin = new Padding(4, 0, 4, 0);
            lblMarcas.Name = "lblMarcas";
            lblMarcas.Size = new Size(82, 30);
            lblMarcas.TabIndex = 1;
            lblMarcas.Text = "Marcas";
            // 
            // cbMarcas
            // 
            cbMarcas.Font = new Font("Segoe UI", 11F);
            cbMarcas.FormattingEnabled = true;
            cbMarcas.Location = new Point(103, 23);
            cbMarcas.Margin = new Padding(4, 5, 4, 5);
            cbMarcas.Name = "cbMarcas";
            cbMarcas.Size = new Size(218, 38);
            cbMarcas.TabIndex = 0;
            // 
            // panelDgv
            // 
            panelDgv.BackColor = Color.White;
            panelDgv.Controls.Add(dgvMain);
            panelDgv.Dock = DockStyle.Fill;
            panelDgv.Location = new Point(4, 138);
            panelDgv.Margin = new Padding(4, 5, 4, 5);
            panelDgv.Name = "panelDgv";
            panelDgv.Size = new Size(992, 207);
            panelDgv.TabIndex = 2;
            // 
            // dgvMain
            // 
            dgvMain.AllowUserToAddRows = false;
            dgvMain.AllowUserToDeleteRows = false;
            dgvMain.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dgvMain.Columns.AddRange(new DataGridViewColumn[] { Marca, Modelo, Ano, Inspecao, Estado, ActionEdit, ActionRemove });
            dgvMain.Dock = DockStyle.Fill;
            dgvMain.Location = new Point(0, 0);
            dgvMain.Margin = new Padding(4, 5, 4, 5);
            dgvMain.Name = "dgvMain";
            dgvMain.ReadOnly = true;
            dgvMain.RowHeadersWidth = 62;
            dgvMain.Size = new Size(992, 207);
            dgvMain.TabIndex = 0;
            // 
            // Marca
            // 
            Marca.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            Marca.HeaderText = "Marca";
            Marca.MinimumWidth = 8;
            Marca.Name = "Marca";
            Marca.ReadOnly = true;
            // 
            // Modelo
            // 
            Modelo.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            Modelo.HeaderText = "Modelo";
            Modelo.MinimumWidth = 8;
            Modelo.Name = "Modelo";
            Modelo.ReadOnly = true;
            // 
            // Ano
            // 
            Ano.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            Ano.FillWeight = 80F;
            Ano.HeaderText = "Ano";
            Ano.MinimumWidth = 8;
            Ano.Name = "Ano";
            Ano.ReadOnly = true;
            // 
            // Inspecao
            // 
            Inspecao.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            Inspecao.FillWeight = 120F;
            Inspecao.HeaderText = "Última Inspeção";
            Inspecao.MinimumWidth = 8;
            Inspecao.Name = "Inspecao";
            Inspecao.ReadOnly = true;
            // 
            // Estado
            // 
            Estado.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            Estado.HeaderText = "Estado";
            Estado.MinimumWidth = 8;
            Estado.Name = "Estado";
            Estado.ReadOnly = true;
            // 
            // ActionEdit
            // 
            ActionEdit.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            ActionEdit.HeaderText = "Ações";
            ActionEdit.MinimumWidth = 8;
            ActionEdit.Name = "ActionEdit";
            ActionEdit.ReadOnly = true;
            // 
            // ActionRemove
            // 
            ActionRemove.HeaderText = "";
            ActionRemove.MinimumWidth = 8;
            ActionRemove.Name = "ActionRemove";
            ActionRemove.ReadOnly = true;
            ActionRemove.Width = 150;
            // 
            // MainView
            // 
            AutoScaleDimensions = new SizeF(10F, 25F);
            AutoScaleMode = AutoScaleMode.Font;
            Controls.Add(LayoutPanel);
            Margin = new Padding(4, 5, 4, 5);
            MinimumSize = new Size(900, 300);
            Name = "MainView";
            Size = new Size(1000, 350);
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
        private DataGridViewButtonColumn ActionEdit;
        private DataGridViewButtonColumn ActionRemove;
    }
}
