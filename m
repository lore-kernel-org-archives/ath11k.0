Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622FBC32771
	for <ath11k@archiver.kernel.org>; Mon, 19 Sep 2022 02:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+6nMKeSVsjDgYh6OzzWCc6qxkObJ6tIyH4Dvg8igIj0=; b=LrCKQxDS+7QIQG
	5sO/dHMOcMerfu4pyItw0DLe+nF5IjUwPDOxLFAiSGX0Y6oxooErDoVw7Ncfxob/T+z75lI05xOIq
	laNTzQUXUPZeOKUR7XqazssHFV3b5y3AWQd+gbMf1IB85QYMZquH+6AgENeqoLNS2rzrUFCwSoytv
	DH1zdt+CDOpMiU61LwYnUVt+u+4h1alyXUuX4aAXNFz9T0tm7/BDjMsscUpfdZPWp9zFJBWH1WsH9
	tpcqSoYJ5IBmMC8/cNEdzw4XrAYSdseC3NltwYDOMkRzqibDnZh7+WxWrYbj1qSnM2GNQLaEOqhfV
	CtAr6qbxtHhxS7mKmZcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oa6lu-006DO9-P1; Mon, 19 Sep 2022 02:44:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oa6lr-006DKs-Di
	for ath11k@lists.infradead.org; Mon, 19 Sep 2022 02:44:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28J2YtTx002535;
	Mon, 19 Sep 2022 02:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=gj9DYOowkpK4RYYMpaj6yRJ09p07W1LZXMq9yA9O7/s=;
 b=lv+wJHPu5k2OiessydTLw1gW109IxF7QayllrpzXBf2POlZNn7dj115CUI1hQ/fJG56p
 w4jBbiK5r6C0xH6QEYZCzfhRQYLolSe53YN2QzSCkozz7u+wbn0bSIebXXmiYjO4nyqQ
 iSJDcJXjB0/lJlyWPhRg2F9btbeH2YeJF6P373y8eA4yi1HIRJSAoWrAgYy9WkTUvWm0
 WB5Cmvs4wnIsFmw71RjUbcDc9vmsq+U1nbM7BTI/NvLBCce7foerwILtuPhPgJOohSSO
 5TJx2hDxhNEj5uzKU4mHSNOEYqBMfzqnL9elBIqsjfkZc7uqNVcRsIu8ya2KNmK/74CB Qg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jn6qktuat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 02:44:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28J2iTk4013798
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Sep 2022 02:44:29 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Sun, 18 Sep 2022 19:44:27 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] wifi: ath11k: change complete() to complete_all() for scan.completed
Date: Sun, 18 Sep 2022 22:44:13 -0400
Message-ID: <20220919024413.25083-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rH1hhfSfwpxj6STeQZTvwNl2UPP7pKRQ
X-Proofpoint-GUID: rH1hhfSfwpxj6STeQZTvwNl2UPP7pKRQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_01,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209190017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_194431_718811_100F94A1 
X-CRM114-Status: GOOD (  17.63  )
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

Currently commit 1f682dc9fb37("ath11k: reduce the wait time of 11d scan
and hw scan while add interface" introduced a wait_for_completion_timeout
operation for ar->scan.completed, another one is existed in ath11k_scan_stop(),
then ath11k has two places to wait for the ar->scan.completed and they
run in different thread, thus it is possible to happend that the two
thread both enter wait status. To handle this scenario, ath11k should
change the complete() to complete_all() for the ar->scan.completed. This
also work well when it is only one thread wait for ar->scan.completed.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 2 +-
 drivers/net/wireless/ath/ath11k/mac.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 54848b1efccb..f25e8669ea4f 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1602,7 +1602,7 @@ static void ath11k_core_pre_reconfigure_recovery(struct ath11k_base *ab)
 		ar->state_11d = ATH11K_11D_IDLE;
 		complete(&ar->completed_11d_scan);
 		complete(&ar->scan.started);
-		complete(&ar->scan.completed);
+		complete_all(&ar->scan.completed);
 		complete(&ar->scan.on_channel);
 		complete(&ar->peer_assoc_done);
 		complete(&ar->peer_delete_done);
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 4218211afa30..a59fdeff9833 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3456,7 +3456,7 @@ void __ath11k_mac_scan_finish(struct ath11k *ar)
 		ar->scan_channel = NULL;
 		ar->scan.roc_freq = 0;
 		cancel_delayed_work(&ar->scan.timeout);
-		complete(&ar->scan.completed);
+		complete_all(&ar->scan.completed);
 		break;
 	}
 }

base-commit: c6d18be90f9b0c7fb64c6138b51c49151140fb57
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
