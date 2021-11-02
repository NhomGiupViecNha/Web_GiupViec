$(document).ready(function () {


    function validate() {
        if ($('#txttgThue').val() == "") {
            alert("Vui lòng nhập số thời gian thuê");
            document.myForm.txttgThue.focus();
            return false;
        }

        if ($('#txtDiaChi').val() == "") {
            alert("Vui lòng nhập địa chỉ thực hiện dịch vụ");
            document.myForm.txttgThue.focus();
            return false;
        }
        if ($('#txtThoiGianThucHien').val() == null) {
            alert("Vui lòng nhập chọn thời gian thực hiện dịch vụ");
            document.myForm.txttgThue.focus();
            return false;
        }


    }

    $('#btnApDungMaKM').click(function () {
        var makm = $('#txtMaKM').val();
        $.ajax({
            url: '/DonDatDV/SuDungKM',
            data: makm, 

            success: function (rs) {

                if(rs!=null)
                {
                    var phantramgiam = rs.PhanTramGiamGia;
                    var tongtien = $('#txtTongTien').val();
                    tongtien -= (Number(tongtien) * Number(phantramgiam)) / 100;
                    $('#txtTongTien').val(tongtien);
                    Swal.fire({
                       
                        icon: 'success',
                        title: 'Đã áp dụng mã',
                        showConfirmButton: false,
                        timer: 1500
                    })

                }
                else {
                    Swal.fire({

                        icon: 'error',
                        title: 'Mã không hợp lệ. Vui lòng kiểm tra lại',
                        showConfirmButton: false,
                        timer: 1500
                    })

                }

            }


        })



    })



    $('.payment-button').click(function () {

      

        Swal.fire({
            title: 'Xác nhận',
            text: "Bạn có muốn thanh toán dịch vụ ?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Đồng ý',
            cancelButtonText: 'Hủy bỏ',
        }).then(function (result) {
            if (result.isConfirmed) {

                var madd = $(this).data('madd');
                var httt = $('.cbThanhToan').val();
                var tinhtrangthanhtoan=''
                if (httt == 'tructiep')
                {
                    tinhtrangthanhtoan = 'false'
                }
                else if(httt=='online')
                {
                    tinhtrangthanhtoan = 'true'
                }
             var phichon=   $("#txtPhiChonCTV").val()
                var giadv = $('#txtGiaDV').val();
                var tongtien = Number(phichon) + Number(giadv);
                var dd = {
                    MaDonDat: $('#txtMaDonDat').val(),
                    MaDV: $('#txtMaDV').val(),
                    SoThoiGianThue: $('#txttgThue').val(),
                    DiaChiThucHien: $('#txtDiaChi').val(),
                    MoTaCongViec: $('#txtGhiChu').val(),
                    ThoiGianThucHien:$('#txtThoiGianThucHien').val(),
                    TinhTrangDonDat: 'Chờ duyệt',
                    MaKH: $('#txtMaKH').val(),
                    TuyChonCTV: $('.cbChonCTV').val(),
                    TinhTrangThanhToan: tinhtrangthanhtoan,
                    MaUuDaiApDung:'',
                    MaCTVNhanViec: $('.cbCTV').val(),
                    HinhThucThanhToan: $('.cbThanhToan').val(),
                    ChiPhiChonCTV: $("#txtPhiChonCTV").val(),
                    TongTien:tongtien


                }
                $.ajax({

                    url: "/DonDatDV/ThanhToan",
                    data: dd,


                    success: function (rs) {
                        if(rs)
                        {

                            Swal.fire(
                         'Thành công!',
                         'Thanh toán thành công',
                         'success'

                             )

                        }

                        else {

                      
                            Swal.fire(
                         'Thất bại!',
                         'Thanh toán không thành công. Số dư không đủ. Vui lòng nạp thêm',
                         'error'

                             )

                        
                        }

                    }

                })
       



            }
        })

    })

    $('#txttgThue').change(function () {

        var tg = $(this).val();

        var thanhtien = Number($('#txtGiaThanhDV').val()) * Number(tg);
        $('#txtGiaDV').val(thanhtien)
        $('#txtTongTien').val(thanhtien)

    })

    $(".cbChonCTV").change(function () {

        var chon = $(this).val();
        var madv  = $(this).data('madv');
        $.ajax({

            url: "/DonDatDV/layDSCTVTheoKinhNghiem",
            data: {madv:madv},
            dataType: "json",

            success: function (result) {
                var html = '';
                var phichon = 0;
                if (chon == 'hethongchon')
                {
                    html+=''
                }
                else if (chon == 'tuchon')
                {
                    html += '  <label>Chọn cộng tác viên:</label>'
                    $.each(result, function (key, item) {


                        html += '<select  class=" cbCTV form-control">';
                        html += '    <option  value="' + item.MaCTV + '">' + item.TenCTV + '</option>';

                        html += ' </select>';

                    })
                    phichon = 15000;
                }
          
                $("#dsCTV").html(html)
                $("#txtPhiChonCTV").val(phichon)
                var giadv = $('#txtGiaDV').val();
                var tongtien = phichon + Number(giadv);
                var html = '<i class="fa fa-lock fa-lg"></i>&nbsp;<span >Thanh toán:</span>  <span id="payment-button-amount">' + tongtien+"VNĐ" + '</span>'
                $('#txtTongTien').val(tongtien)
                $('#payment-button').html(html);
            }

            
        })



    })



})

