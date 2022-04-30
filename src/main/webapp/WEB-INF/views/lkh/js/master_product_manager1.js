/**
 * 
 */
$(function() {
    /* '#all_check'의 선택 상태가 변경되었을 때의 이벤트 */
    $("#g_ch1").change(function() {
        // 모든 '.hobby'의 선택 상태를 '#all_check'와 동일하게 맞춘다.
        $(".checkbox_size").prop('checked', $(this).prop('checked'));
    })
})