Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4A2C433F5
	for <ath11k@archiver.kernel.org>; Mon, 10 Oct 2022 03:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7pfVkDzcU2rnvO80ZLCygdWE3tsXJ/HODad18GfnyVI=; b=M+3HWE0cTkX8sN
	DkglMEZgoi4brBdiQ5XH/+CYZ3XOO9eDmf+zKBOFngtsOgBnBLiYUL7aEHWF+VyQK2hNqDBfXw+if
	vuREMW0iUlye6SDb0bVfFyTwWeWQ64twT3QXo3LcwuC2AMTkJXikmn7Pnb7HJTMyXIG4ZIj1iuql/
	23OMNixu/VKeG0WvZiMeU/oQ8KE+dQeBY5KiD+Bm+cy2yUjvLKuATPtZB9PibBBvh3IhNfwNCMG19
	yJx9tkBnauobrSDKq3h3lI1N9Tv/NcpjWi9z8LrJYOeOmjebkYAmelbnISF0paR3Bs0bLJces49DO
	eLV5KlnemMzFRugsbVAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohjXF-00Guou-Ro; Mon, 10 Oct 2022 03:32:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohjXD-00GuoC-Ge
	for ath11k@lists.infradead.org; Mon, 10 Oct 2022 03:32:56 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29A3C3nq000533;
	Mon, 10 Oct 2022 03:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=Qb8Uz92RvqxoZ/U5HyycwC7Sm1QLXoJ+L6oWadr4khM=;
 b=DMSse3DLb8N7O/FoQR8kfcMX3y80ASnTVax6S4zc5PzXg+c9hilTugeXwqrr2LmqCbqm
 y/aGMScejJ/TFx1VePoI8z4LTNfRuG9O5Vr8tHkRNCFUl7pmXOjBzltVG/A2roOnWf7g
 pDPzF6bsbAnjjupZAalpb+1V7CFTgrwL1BrswZujIuGxR/rj3G4/qp+KeQFkkebgYYmA
 iqL0gcOgvQLkXvIevcqaQZk+08OLU1c6S+0KeYaSCpiE6KBTVtaF4vQRLlmD4i305Kwr
 0vPv2IXYqiG4k1tPu2+WwSmNljC1zRyQAsUpNYrHP91RLYo26WtYQjFvkmy8wtmqq6OA WQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k32gek3us-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 03:32:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29A3WlZL018699
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 03:32:47 GMT
Received: from bqiang-Celadon-RN.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Sun, 9 Oct 2022 20:32:46 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH] wifi: ath11k: Send PME message during wakeup from D3cold
Date: Mon, 10 Oct 2022 11:32:37 +0800
Message-ID: <20221010033237.415478-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YOHyZI4rP-KocY1uVukdU862mGBPuHHy
X-Proofpoint-ORIG-GUID: YOHyZI4rP-KocY1uVukdU862mGBPuHHy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 clxscore=1011 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210100019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_203255_593741_2B6D50B4 
X-CRM114-Status: GOOD (  13.66  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

We are seeing system stuck on some specific platforms due to
WLAN chip fails to wakeup from D3cold state.

With this flag, firmware will send PME message during wakeup
and this issue is gone.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/qmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index 84e3abecbdac..145f20a681bd 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -19,6 +19,7 @@
 #define SLEEP_CLOCK_SELECT_INTERNAL_BIT	0x02
 #define HOST_CSTATE_BIT			0x04
 #define PLATFORM_CAP_PCIE_GLOBAL_RESET	0x08
+#define PLATFORM_CAP_PCIE_PME_D3COLD	0x10
 
 #define FW_BUILD_ID_MASK "QC_IMAGE_VERSION_STRING="
 
@@ -1752,6 +1753,8 @@ static int ath11k_qmi_host_cap_send(struct ath11k_base *ab)
 	if (ab->hw_params.global_reset)
 		req.nm_modem |= PLATFORM_CAP_PCIE_GLOBAL_RESET;
 
+	req.nm_modem |= PLATFORM_CAP_PCIE_PME_D3COLD;
+
 	ath11k_dbg(ab, ATH11K_DBG_QMI, "qmi host cap request\n");
 
 	ret = qmi_txn_init(&ab->qmi.handle, &txn,

base-commit: 023baf1318ef21442fab3842bf03883bc81223e0
-- 
2.25.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
