/**
 * Created by silpa on 7/22/2016.
 */
$(document).ready(function(){
    $("#searchPatient").keyup(function(){

        var query = $(this).val();
        if(query != '' && query.length > 2 ){
            $.ajax({
                url : "/search_patient",
                type: "GET",
                dataType: "json",
				data: {name:query} ,
                success: function(data, textStatus, jqXHR){


						$.each(data,function(key,value){

							 var div_data='<ul class="search_list_pat" >';
							document.getElementById("PatientList").style.display = "block";
							if(value.length === 0){
								div_data = div_data + '<a href="#">No record found</a>';
							}else{
								for (i = 0; i < value.length; i++) {

									div_data= div_data + '<li id='+value[i].file.id+'>' + value[i].file.first_name + ' ' + value[i].file.last_name+'</li>';
									}
								 }
							div_data = div_data + '</ul>';

							$('#PatientList').fadeIn();
							$('#PatientList').html(div_data);
						});
                }
            });
        }
		else{
				document.getElementById("PatientList").style.display = "none";
		}
    });
    $(document).on('click' , 'ul.search_list_pat li', function(){
        $('#searchPatient').val($(this).text());
        $('#patient_id').val(this.id);
        $('#PatientList').fadeOut();

    });

    $("#searchPharmacy").keyup(function(){
        var query = $(this).val();
        if(query != '' && query.length > 2){
            $.ajax({
                url : "/search_pharmacy",
                type: "GET",
                dataType: "json",
				data: {name:query} ,
                success: function(data, textStatus, jqXHR){
						$.each(data,function(key,value){
							 var div_data='<ul class="search_list_phar" >';
							document.getElementById("PharmacyList").style.display = "block";
							if(value.length === 0){
								div_data = div_data + '<li> Pharmacy not found </li>';
							}else{
								for (i = 0; i < value.length; i++) {
									div_data= div_data + '<li id='+value[i].id+'>' + value[i].name+'</li>';
									}
								 }
							div_data = div_data + '</ul>';
							$('#PharmacyList').fadeIn();
							$('#PharmacyList').html(div_data);
						});
                }
              
            });
        }
		else{
				document.getElementById("PharmacyList").style.display = "none";
		}
    });

    $(document).on('click' , 'ul.search_list_phar li', function(){
        $('#searchPharmacy').val($(this).text());
        $('#pharmacy_outlet_id').val(this.id);
        $('#PharmacyList').fadeOut();

    });


});

