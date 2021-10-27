
$(document).ready(function () {

    $('#locTheoLoai').change(LocDuLieu)
    $('.btnXemChiTietDV').click(xemchitiet)
    $('.btnXoaDV').click(xoaDV)
    $('#btnSearch').click(LocDuLieu)

   
})
function LocDuLieu() {
  
    var search = $(this).val();
    if (search == "")
    {
        search = $("#txtSearch").val();

    }
    $.ajax({
        url: "/DichVu/locDuLieu",
        dataType: "json",

        data: {
            search: search
        },

        success: function (result) {
            var data = result;
            var html = '';
            $.each(data, function (key, item) {
                html += '<tr>';
                html += '<td>' + item.MaDichVu + '</td>';
                html += '<td class="desc"> <span>' + item.TenDichVu + '</span> </td>';
                html += '<td>' + item.MoTa + '</td>';
                html += '<td>' + item.DonViTinh + '</td>';
                html += '<td>  <span>' + item.GiaThanh + ' </span></td>';
                html += '<td>' + item.KinhNghiemYeuCau + '</td>';
                html += '<td><img width="60px" src="/Content/HinhAnh/' + item.HinhAnh + '"' + '" /></td>';
                html += '<td>' + item.LoaiDV + '</td>';
                html += '<td>     <div class="table-data-feature">  <button class="item"  data-toggle="tooltip" onclick="xoaDV(this);"  value="' + item.MaDichVu + '"' + '" data-placement="top" title="Delete">'
                              +'  <i class="zmdi zmdi-delete"></i>'+
                          '  </button>'

                html += ' <button class="item btnXemChiTietDV" onclick="xemchitiet(this);" data-toggle="tooltip" value="' + item.MaDichVu + '"' + '" data-placement="top" title="Edit">'
                           + '  <i class="zmdi zmdi-edit"></i>' +
                       '  </button> </div>'
                html += '</tr>';
                

            })
            $("#tblDSDichVu").html(html)

        }


    })

  
 



}

function LoadDuLieu() {

    var search =''
    $.ajax({
        url: "/DichVu/locDuLieu",
        dataType: "json",

        data: {
            search: search
        },

        success: function (result) {
            var data = result;
            var html = '';
            $.each(data, function (key, item) {
                html += '<tr>';
                html += '<td>' + item.MaDichVu + '</td>';
                html += '<td class="desc"> <span>' + item.TenDichVu + '</span> </td>';
                html += '<td>' + item.MoTa + '</td>';
                html += '<td>' + item.DonViTinh + '</td>';
                html += '<td>  <span>' + item.GiaThanh + ' </span></td>';
                html += '<td>' + item.KinhNghiemYeuCau + '</td>';
                html += '<td><img width="60px" src="/Content/HinhAnh/'+item.HinhAnh+'"' + '" /></td>';
                html += '<td>' + item.LoaiDV + '</td>';
                html += '<td>     <div class="table-data-feature">  <button class="item" data-toggle="tooltip" onclick="xoaDV(this);" value="' + item.MaDichVu + '"' + '" data-placement="top" title="Delete">'
                              + '  <i class="zmdi zmdi-delete"></i>' +
                          '  </button>'

                html += ' <button class="item " onclick="xemchitiet(this);" data-toggle="tooltip" value="' + item.MaDichVu + '"' + '" data-placement="top" title="Edit">'
                           + '  <i class="zmdi zmdi-edit"></i>' +
                       '  </button> </div>'
                html += '</tr>';


            })
            $("#tblDSDichVu").html(html)

        }


    })






}


function xemchitiet(madv) {
    var madvu = $(madv).val();
    $.ajax({
        url: '/DichVu/xemChiTietDV',
     type:"GET",
        data: {
            dichvu: madvu
            
        },
        

            success: function () {

                window.location.href = "ThongTinChiTietDV?dichvu=" + madvu;

            }
 

    })
   


}


function xoaDV(button) {
    var madv = $(this).data('madv');
    if (madv == null)
    {
        madv = $(button).val();

    }
    Swal.fire({
        title: 'Lưu ý',
        text: "Bạn có muốn xóa dịch vụ ?"+madv,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Đồng ý',
        cancelButtonText: 'Hủy bỏ',
    }).then(function (result) {
        if (result.isConfirmed) {

            $.ajax({
                url: '/DichVu/XoaDV',

                data: {
                    madv: madv

                },

                success: function (rs) {
                

                    {
                      
                        if (rs) {
                            LoadDuLieu();
                            Swal.fire(
                      'Thành công!',
                      'Xóa thành công',
                      'success'

                    )
                           
                        }
                   else {
                            Swal.fire(
                    'Thất bại!',
                    'Xóa không thành công',
                    'error'
                  )

                        }

                       


                    }
                }

            })

          
         

        }
    })



}