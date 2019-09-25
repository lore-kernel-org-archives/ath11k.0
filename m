Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCzCx-0003FC-QD
 for ath11k@lists.infradead.org; Wed, 25 Sep 2019 04:47:21 +0000
Received: from vasanth-lnx.qca.qualcomm.com
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: vthiagar@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 819CA602E1
 for <ath11k@lists.infradead.org>; Wed, 25 Sep 2019 04:47:17 +0000 (UTC)
From: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: [PATCH bringup 1/5] ath11k: Use C99 structure initialization for
 target_service_to_ce_map_wlan[]
Date: Wed, 25 Sep 2019 10:13:55 +0530
Message-Id: <1569386639-1242-1-git-send-email-vthiagar@codeaurora.org>
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

Also cleanup endian conversion for 0 in the last entry of
target_service_to_ce_map_wlan[] with a comment saying it is
the terminator entry of the map table as suggested during
public review.

Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 132 +++++++++++++++++-----------------
 1 file changed, 64 insertions(+), 68 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index e1fee70..db67bab 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -153,118 +153,114 @@
  */
 static const struct service_to_pipe target_service_to_ce_map_wlan[] = {
 	{
-		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_VO),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(3),
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_VO),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		.pipenum = __cpu_to_le32(3),
 	},
 	{
-		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_VO),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(2),
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_VO),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		.pipenum = __cpu_to_le32(2),
 	},
 	{
-		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_BK),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(3),
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_BK),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		.pipenum = __cpu_to_le32(3),
 	},
 	{
-		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_BK),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(2),
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_BK),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		.pipenum = __cpu_to_le32(2),
 	},
 	{
-		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_BE),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(3),
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_BE),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		.pipenum = __cpu_to_le32(3),
 	},
 	{
-		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_BE),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(2),
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_BE),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		.pipenum = __cpu_to_le32(2),
 	},
 	{
-		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_VI),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(3),
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_VI),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		.pipenum = __cpu_to_le32(3),
 	},
 	{
-		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_VI),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(2),
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_DATA_VI),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		.pipenum = __cpu_to_le32(2),
 	},
 	{
-		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_CONTROL),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(3),
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_CONTROL),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		.pipenum = __cpu_to_le32(3),
 	},
 	{
-		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_CONTROL),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(2),
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_CONTROL),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		.pipenum = __cpu_to_le32(2),
 	},
 	{
-		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_CONTROL_MAC1),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(7),
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_CONTROL_MAC1),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		.pipenum = __cpu_to_le32(7),
 	},
 	{
-		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_CONTROL_MAC1),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(2),
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_CONTROL_MAC1),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		.pipenum = __cpu_to_le32(2),
 	},
 	{
-		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_CONTROL_MAC2),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(9),
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_CONTROL_MAC2),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		.pipenum = __cpu_to_le32(9),
 	},
 	{
-		__cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_CONTROL_MAC2),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(2),
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_WMI_CONTROL_MAC2),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		.pipenum = __cpu_to_le32(2),
 	},
 	{
-		__cpu_to_le32(ATH11K_HTC_SVC_ID_RSVD_CTRL),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(0),
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_RSVD_CTRL),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		.pipenum = __cpu_to_le32(0),
 	},
 	{
-		__cpu_to_le32(ATH11K_HTC_SVC_ID_RSVD_CTRL),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(1),
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_RSVD_CTRL),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		.pipenum = __cpu_to_le32(1),
 	},
 	{ /* not used */
-		__cpu_to_le32(ATH11K_HTC_SVC_ID_TEST_RAW_STREAMS),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(0),
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_TEST_RAW_STREAMS),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		.pipenum = __cpu_to_le32(0),
 	},
 	{ /* not used */
-		__cpu_to_le32(ATH11K_HTC_SVC_ID_TEST_RAW_STREAMS),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(1),
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_TEST_RAW_STREAMS),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		.pipenum = __cpu_to_le32(1),
 	},
 	{
-		__cpu_to_le32(ATH11K_HTC_SVC_ID_HTT_DATA_MSG),
-		__cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
-		__cpu_to_le32(4),
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_HTT_DATA_MSG),
+		.pipedir = __cpu_to_le32(PIPEDIR_OUT),	/* out = UL = host -> target */
+		.pipenum = __cpu_to_le32(4),
 	},
 	{
-		__cpu_to_le32(ATH11K_HTC_SVC_ID_HTT_DATA_MSG),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(1),
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_HTT_DATA_MSG),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		.pipenum = __cpu_to_le32(1),
 	},
 	{
-		__cpu_to_le32(ATH11K_HTC_SVC_ID_PKT_LOG),
-		__cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
-		__cpu_to_le32(5),
+		.service_id = __cpu_to_le32(ATH11K_HTC_SVC_ID_PKT_LOG),
+		.pipedir = __cpu_to_le32(PIPEDIR_IN),	/* in = DL = target -> host */
+		.pipenum = __cpu_to_le32(5),
 	},
 
 	/* (Additions here) */
 
-	{ /* must be last */
-		__cpu_to_le32(0),
-		__cpu_to_le32(0),
-		__cpu_to_le32(0),
-	},
+	{ /* terminator entry */ }
 };
 
 #define ATH11K_IRQ_CE0_OFFSET 4
-- 
1.9.1


_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
