Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45F8C36002
	for <ath11k@archiver.kernel.org>; Thu, 20 Mar 2025 02:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6ZCVV9nip6wecdpl/GSOc4LWcqKyTSHDeLY/R2J33I=; b=xPV04HN+mkPf2In+RtiGMIgjs2
	CJOY3T1P6iegaMZZn0S5b2ILEb4bIaoSPp/M+05rVg0Y8ewUu0zcZHu3lQ8ROZg5nGPF4I76wvSKs
	2Ot6gqZDf3/gwHuwTvYam2JYUTGkQADmexv0rONFfGcrAqvwSB3otL0AcKjUDHCDJIcKXKTZLh3bz
	4W/uDl51C6Bl48WqMKr0URywomNLF1GVCplSGdTU7r2FdNW4EUMn6c8Q2zDmrr0BQxwErT1WwWKS2
	mGsnMhJjEmqdah+4qzmAmv6Ri7lu3kKJH3I6UKOvY/YYJvhbVGlmf4flHRJ3c6GlW74I81947fqTd
	LZUGvl7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv5lD-0000000Auor-4B6L;
	Thu, 20 Mar 2025 02:35:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv5fn-0000000Au0e-0SdC
	for ath11k@lists.infradead.org;
	Thu, 20 Mar 2025 02:30:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JDtenL020872;
	Thu, 20 Mar 2025 02:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U6ZCVV9nip6wecdpl/GSOc4LWcqKyTSHDeLY/R2J33I=; b=EnM3hnw8HHhwEi7l
	6tDz+dOfG2mSWLYH3Oz2Wag62TvsLeiFLXKwuwHiTfYR3/rKivjWuE+f3NsUV6dc
	Lg8W/PWNudgnfXfhCMtlFOZjLlmeqKTwqWTUlDMPXWAJrDwGFzgtn9B0j0tLzBZX
	tTdRZAm3WsMvHtAkxmYDw93Et+xa1z7CP2EaFFwMyZJlB/IuttoLdMPaxJMzyrFE
	K5jLW4yxuYW1IY4qlAutxQT5yJCU5dymxcTza7LF9OzF+OwWkCrT00QTeYVXRxG8
	9xcbkvNes0571wwOdO3ZI42R97RkBFxMQB23KGNxT0LE2oyiAhyy4zWr4V2sFF9I
	HlleKA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exxbq8sf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 02:30:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52K2UH3W021801
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 02:30:17 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Mar 2025 19:30:16 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH ath-next 2/5] wifi: ath11k: introduce ath11k_core_continue_suspend_resume()
Date: Thu, 20 Mar 2025 10:30:00 +0800
Message-ID: <20250320023003.65028-3-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250320023003.65028-1-quic_bqiang@quicinc.com>
References: <20250320023003.65028-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=QN1oRhLL c=1 sm=1 tr=0 ts=67db7dba cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=XLp1zxdMKvP_wVYWocMA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Ozt6Df6zKt4FXIhyqpwqY7lcDHQBlP4M
X-Proofpoint-GUID: Ozt6Df6zKt4FXIhyqpwqY7lcDHQBlP4M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=686
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_193019_152247_D07EB882 
X-CRM114-Status: GOOD (  15.90  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Currently ath11k_core_suspend() and ath11k_core_resume() have the same
check before going on. In upcoming patches the check is needed by some
newly added functions as well.

To avoid duplicate code, introduce a new helper
ath11k_core_continue_suspend_resume() which does such check internally.
Callers can decide whether to go on based on its return value.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 46 +++++++++++++++-----------
 1 file changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 8657e735bf16..d3241a0df407 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1018,23 +1018,37 @@ bool ath11k_core_coldboot_cal_support(struct ath11k_base *ab)
 		return ab->hw_params.coldboot_cal_mm;
 }
 
-int ath11k_core_suspend(struct ath11k_base *ab)
+/* Check if we need to continue with suspend/resume operation.
+ * Return:
+ *	a negative value: error happens and don't continue.
+ *	0:  no error but don't continue.
+ *	positive value: no error and do continue.
+ */
+static int ath11k_core_continue_suspend_resume(struct ath11k_base *ab)
 {
-	int ret;
-	struct ath11k_pdev *pdev;
 	struct ath11k *ar;
 
 	if (!ab->hw_params.supports_suspend)
 		return -EOPNOTSUPP;
 
 	/* so far single_pdev_only chips have supports_suspend as true
-	 * and only the first pdev is valid.
+	 * so pass 0 as a dummy pdev_id here.
 	 */
-	pdev = ath11k_core_get_single_pdev(ab);
-	ar = pdev->ar;
+	ar = ab->pdevs[0].ar;
 	if (!ar || ar->state != ATH11K_STATE_OFF)
 		return 0;
 
+	return 1;
+}
+
+int ath11k_core_suspend(struct ath11k_base *ab)
+{
+	int ret;
+
+	ret = ath11k_core_continue_suspend_resume(ab);
+	if (ret <= 0)
+		return ret;
+
 	ret = ath11k_dp_rx_pktlog_stop(ab, true);
 	if (ret) {
 		ath11k_warn(ab, "failed to stop dp rx (and timer) pktlog during suspend: %d\n",
@@ -1042,7 +1056,10 @@ int ath11k_core_suspend(struct ath11k_base *ab)
 		return ret;
 	}
 
-	ret = ath11k_mac_wait_tx_complete(ar);
+	/* So far only single_pdev_only devices can reach here,
+	 * so it is valid to handle the first, and the only, pdev.
+	 */
+	ret = ath11k_mac_wait_tx_complete(ab->pdevs[0].ar);
 	if (ret) {
 		ath11k_warn(ab, "failed to wait tx complete: %d\n", ret);
 		return ret;
@@ -1080,19 +1097,10 @@ EXPORT_SYMBOL(ath11k_core_suspend);
 int ath11k_core_resume(struct ath11k_base *ab)
 {
 	int ret;
-	struct ath11k_pdev *pdev;
-	struct ath11k *ar;
 
-	if (!ab->hw_params.supports_suspend)
-		return -EOPNOTSUPP;
-
-	/* so far signle_pdev_only chips have supports_suspend as true
-	 * and only the first pdev is valid.
-	 */
-	pdev = ath11k_core_get_single_pdev(ab);
-	ar = pdev->ar;
-	if (!ar || ar->state != ATH11K_STATE_OFF)
-		return 0;
+	ret = ath11k_core_continue_suspend_resume(ab);
+	if (ret <= 0)
+		return ret;
 
 	ret = ath11k_hif_resume(ab);
 	if (ret) {
-- 
2.25.1


