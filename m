Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVUyJ-0007Aa-6a
 for ath11k@lists.infradead.org; Tue, 28 May 2019 05:48:28 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8C3E060712
 for <ath11k@lists.infradead.org>; Tue, 28 May 2019 05:48:25 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH 2/4] ath11k: Fix sparse warnings for symbol not being static
Date: Tue, 28 May 2019 11:18:04 +0530
Message-Id: <1559022486-7073-2-git-send-email-vthiagar@codeaurora.org>
In-Reply-To: <1559022486-7073-1-git-send-email-vthiagar@codeaurora.org>
References: <1559022486-7073-1-git-send-email-vthiagar@codeaurora.org>
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

drivers/net/wireless/ath/ath11k/wmi.c:183:12: warning: symbol 'ath11k_wmi_tlv_parse_alloc' was not declared. Should it be static?
drivers/net/wireless/ath/ath11k/qmi.c:505:22: warning: symbol 'qmi_wlanfw_ind_register_resp_msg_v01_ei' was not declared. Should it be static?

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 2 +-
 drivers/net/wireless/ath/ath11k/wmi.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index ecf09b8..4f3e25b 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -502,7 +502,7 @@
 	},
 };
 
-struct qmi_elem_info qmi_wlanfw_ind_register_resp_msg_v01_ei[] = {
+static struct qmi_elem_info qmi_wlanfw_ind_register_resp_msg_v01_ei[] = {
 	{
 		.data_type	= QMI_STRUCT,
 		.elem_len	= 1,
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 9ca44c4..50e6e31 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -180,7 +180,7 @@ static int ath11k_wmi_tlv_parse(struct ath11k_base *ar, const void **tb,
 				   (void *)tb);
 }
 
-const void **
+static const void **
 ath11k_wmi_tlv_parse_alloc(struct ath11k_base *ab, const void *ptr,
 			   size_t len, gfp_t gfp)
 {
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
