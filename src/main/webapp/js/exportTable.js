$('#downloadExcelBtn').on('click', function () {
	$("#relatorioTable").table2excel({
		filename: "relatorio.xls"
	});
});