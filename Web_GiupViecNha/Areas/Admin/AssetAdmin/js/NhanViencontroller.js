
$(".ChucNang").click(function (e) {


    var manv = $("#aMaNV").data('manv');
    var machucnang = $(this).data('id');
    $.ajax({
        url: "/MainAdmin/LoadPhanQuyen",
        dataType: "json",
        type: "GET",
        data: { manv: manv,machucnang:machucnang },

        success: function (result) {

            var data = result.data
                        if (data) {
                          
                                
                        }
                        else {

                   
                            Swal.fire({
                         
                                icon: 'error',
                                title: 'không có quyền',
                                showConfirmButton: true,
                                timer: 1500
                            })
                            return false;
                          
                        }

                  

        }

    })

})

