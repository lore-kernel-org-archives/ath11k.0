Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOLAe-0002Ft-MG
 for ath11k@lists.infradead.org; Wed, 08 May 2019 11:55:38 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4D6CD60452
 for <ath11k@lists.infradead.org>; Wed,  8 May 2019 11:55:34 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH] ath11k/qmi: Use memcpy_toio() function on I/O memory
Date: Wed,  8 May 2019 17:24:43 +0530
Message-Id: <1557316483-18397-1-git-send-email-vthiagar@codeaurora.org>
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org

The usage of memcpy() function on I/O memory is not recommended
when doing a bulk data copy. Instead use memcpy_toio() function
while copying bulk data to I/O memory. Using the right function
takes care of platform specific alignment requirement as well
in arm64. This fixes the below kernel crash due to unaligned
memory access in 64-bit arm during memory copy of board data to I/O
memory.

[   15.672513] ath11k c000000.wifi1: Downloading BDF: IPQ8074/board-2.bin, size: 917972
[   15.672635] Unhandled fault: alignment fault (0x96000061) at 0xffffff8007200004
[   15.680449] Internal error: : 96000061 [#1] PREEMPT SMP
[   15.946227] CPU: 0 PID: 890 Comm: kworker/u8:5 Tainted: P
[   15.968272] task: ffffffc03cae9f80 ti: ffffffc03cae9f80 task.ti: ffffffc03cae9f80
[   15.968552] PC is at __efistub_memcpy+0x48/0x180
[   15.976011] LR is at ath11k_ce_get_attr_flags+0xc14/0x1594 [ath11k]

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index b862fa9..0bec067 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -1795,7 +1795,7 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 static int
 ath11k_qmi_prepare_bdf_download(struct ath11k_base *ab, int type,
 				struct qmi_wlanfw_bdf_download_req_msg_v01 *req,
-				void *bdf_addr)
+				void __iomem *bdf_addr)
 {
 	struct device *dev = ab->dev;
 	char filename[ATH11K_QMI_MAX_BDF_FILE_NAME_SIZE];
@@ -1813,7 +1813,7 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 		}
 
 		fw_size = min_t(u32, ab->hw_params.fw.board_size, bd.len);
-		memcpy(bdf_addr, bd.data, fw_size);
+		memcpy_toio(bdf_addr, bd.data, fw_size);
 		ath11k_core_free_bdf(ab, &bd);
 		break;
 	case ATH11K_QMI_FILE_TYPE_CALDATA:
@@ -1828,7 +1828,8 @@ static int ath11k_qmi_request_target_cap(struct ath11k_base *ab)
 		fw_size = min_t(u32, ab->hw_params.fw.board_size,
 				fw_entry->size);
 
-		memcpy(bdf_addr + ATH11K_QMI_CALDATA_OFFSET, fw_entry->data, fw_size);
+		memcpy_toio(bdf_addr + ATH11K_QMI_CALDATA_OFFSET,
+			    fw_entry->data, fw_size);
 		ath11k_info(ab, "qmi downloading BDF: %s, size: %zu\n",
 			    filename, fw_entry->size);
 
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
