Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB5FC46CD4
	for <ath11k@archiver.kernel.org>; Mon, 18 Dec 2023 08:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PFvKnl6l9vYkT//vzJAeMYyHimY6L+vXtOXI7QEk0s=; b=pIKyz1HBzJx6p1evqN7RPhrqv5
	W2SLlXBbZbDW0D5SwnTvzV5pCvFqtlEIxnngFjknvtCyjrEW9dF7ruCNcbJak62sZobt+KcifRmUU
	WvKJWOuIOyeDzRHKtpV2JRruU8nmBILVZUZtbehVFgoh1ukPj3qBVLNFHcxZyF3DqCrM/rsOJCcdU
	fnvaM0FGiCS3psEsjNSVqS1W2vKZJFuWLri9SheGuXYk5djnMr+V2dNfNSoOH1HxI0bT18V9jYGcS
	qwLVC2nxFziTbSCCZeVcnC8/ZguiI1AyGEogwVX2+rJjuQ/3rI7vi5eWWwUwubQJtm/8TrbFrJWKJ
	9JnG9YSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rF9St-009YR8-2n;
	Mon, 18 Dec 2023 08:59:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rF9Sp-009YNx-1m
	for ath11k@lists.infradead.org;
	Mon, 18 Dec 2023 08:59:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BI6uGGf019617;
	Mon, 18 Dec 2023 08:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=+PFvKnl6l9vYkT//vzJAeMYyHimY6L+vXtOXI7QEk0s=; b=dH
	P1hHiXKCPTV+tNsVj2wA3K8LA2hoqbtBWhLjhi/fuBsUwAjt9UvkWK7Eu901P+qm
	AuG8Q3XLl8EQrHnArrewsmiPMxdvrRZim6w3xrx4RGsqrC0ekAUfp19neleX19uO
	TtHL0iADlkvVcsSprGa1vtWfuVihQKkBh0HKLUsTZYt5VcCNf4yq4mC61j4SvIfR
	TjntbvkpqKuXvGBDRbGC+713JgXEElF+w+GajTRbwZPTGSc6x/PzyZoHDTSGwHIC
	YBA8tuxpQteqMSWTx0F+j+IQ1K6YzFq/fd0v8lf5UazBRuquRfezbcP2sdjY8Yv3
	CZns98IFec8Ai+0gbNAQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v152qbsyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 08:59:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BI8wxFv009813
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 08:58:59 GMT
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 18 Dec 2023 00:58:58 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v10 03/12] wifi: ath11k: fix a possible dead lock caused by ab->base_lock
Date: Mon, 18 Dec 2023 16:58:35 +0800
Message-ID: <20231218085844.2658-4-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231218085844.2658-1-quic_bqiang@quicinc.com>
References: <20231218085844.2658-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hHCbMkwk9R0q-mssDpFOTCPsCZS-1Axi
X-Proofpoint-GUID: hHCbMkwk9R0q-mssDpFOTCPsCZS-1Axi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 mlxlogscore=958
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312180064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_005903_598406_D27C49D4 
X-CRM114-Status: GOOD (  15.56  )
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

spin_lock/spin_unlock are used in ath11k_reg_chan_list_event to
acquire/release ab->base_lock. For now this is safe because that
function is only called in soft IRQ context.

But ath11k_reg_chan_list_event() will be called from process
context in an upcoming patch, and this can result in a deadlock if
ab->base_lock is acquired in process context and then soft IRQ occurs
on the same CPU and tries to acquire that lock.

Fix it by using spin_lock_bh and spin_unlock_bh instead.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23

Fixes: 69a0fcf8a9f2 ("ath11k: Avoid reg rules update during firmware recovery")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
v10:
 no change.
v9:
 no change.
v8:
 no change.
v7:
 no change.

 drivers/net/wireless/ath/ath11k/wmi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index a48aafc79b90..9f8a62c334b0 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -7142,13 +7142,13 @@ int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
 	/* Avoid default reg rule updates sent during FW recovery if
 	 * it is already available
 	 */
-	spin_lock(&ab->base_lock);
+	spin_lock_bh(&ab->base_lock);
 	if (test_bit(ATH11K_FLAG_RECOVERY, &ab->dev_flags) &&
 	    ab->default_regd[pdev_idx]) {
-		spin_unlock(&ab->base_lock);
+		spin_unlock_bh(&ab->base_lock);
 		goto retfail;
 	}
-	spin_unlock(&ab->base_lock);
+	spin_unlock_bh(&ab->base_lock);
 
 	if (pdev_idx >= ab->num_radios) {
 		/* Process the event for phy0 only if single_pdev_only
@@ -7201,7 +7201,7 @@ int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
 		ab->reg_info_store[pdev_idx] = *reg_info;
 	}
 
-	spin_lock(&ab->base_lock);
+	spin_lock_bh(&ab->base_lock);
 	if (ab->default_regd[pdev_idx]) {
 		/* The initial rules from FW after WMI Init is to build
 		 * the default regd. From then on, any rules updated for
@@ -7221,7 +7221,7 @@ int ath11k_reg_handle_chan_list(struct ath11k_base *ab,
 		ab->default_regd[pdev_idx] = regd;
 	}
 	ab->dfs_region = reg_info->dfs_region;
-	spin_unlock(&ab->base_lock);
+	spin_unlock_bh(&ab->base_lock);
 
 	return 0;
 
-- 
2.25.1


