$encoding = [System.Text.Encoding]::UTF8

# Table structure 
# Create columns 
$table = New-Object system.Data.DataTable "TestTable"
$col1 = New-Object system.Data.DataColumn Name,([string])
$col2 = New-Object system.Data.DataColumn tst1,([string])
$col3 = New-Object system.Data.DataColumn tst2,([string])
$col4 = New-Object system.Data.DataColumn tst3,([string])
$col5 = New-Object system.Data.DataColumn tst4,([string])
# Add columns
$table.columns.add($col1) # column 1
$table.columns.add($col2) # column 2
$table.columns.add($col3) # column 3
$table.columns.add($col4) # column 4
$table.columns.add($col5) # column 5
#Create Row1
$row1 = $table.NewRow()
$row1.Name = "Row 1"
$row1.tst1 = "Entity 1 Row 1 Column 1" # row 1 value
$row1.tst2 = "Entity 2 Row 1 Column 2" # row 2 value 
$row1.tst3 = "Entity 3 Row 1 Column 3" # row 3 value
$row1.tst4 = "Entity 4 Row 1 Column 4" # row 4 value
$table.Rows.Add($row1) # add row 1
#Create Row2
$row2 = $table.NewRow()
$row2.Name = "Row 2"
$row2.tst1 = "Entity 1 Row 2 Column 1" # row 1 value
$row2.tst2 = "Entity 2 Row 2 Column 2" # row 2 value 
$row2.tst3 = "Entity 3 Row 2 Column 3" # row 3 value
$row2.tst4 = "Entity 4 Row 1 Column 4" # row 3 value
$table.Rows.Add($row2) # add row 1
# describe CSS template in html header 
$Header = @"
<style>
TABLE {border-width: 1px; border-style: solid; border-color: black; border-collapse: collapse; text-align: center;}
TD {border-width: 1px; padding: 3px; border-style: solid; border-color: black;}
</style>
"@
# httml body
$html = "<table>
<tr>
<td><b>Column 1</b></td>
<td><b>Column 2</b></td>
<td><b>Column 3</b></td>
<td><b>Column 4</b></td>
<td><b>Column 5</b></td>
</tr>
"

foreach ($row in $table.Rows)
{ 
    $html += "<tr><td>" + $row[0] + "</td><td>" + $row[1] + "</td><td>" + $row[2] + "</td><td>" + $row[3] + "</td><td>" + $row[4] + "</td></tr>"
}
$html += "</table>"

$body = $Header + $html

Send-MailMessage -SmtpServer smtp.domain.ru -From "test.user@domain.ru" -To "test.user@domain.ru" -Subject "Test" -Body $body -BodyAsHtml -Encoding $encoding
