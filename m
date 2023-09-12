Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F59CA0EC9
	for <ath11k@archiver.kernel.org>; Tue, 12 Sep 2023 05:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZI5SqrBp3e4fUTrkb5JOVJJFuS/JOdlCbJA9GsDN/A=; b=3BRbrlj+bnS7rH
	VG63fFrcA2dlo/Su/LYRiwz/3yV25EAi+H7/ResB0mws4V4Wog7GNLb6bGSM1S+LrrI785HcykIqt
	Mcz7OUIAnsui2U8C9jvXj4LsOdHlDRaV+hbtgQ990NoD38DO1q0pANrYZGh6ChFVluhckLJlUA9xJ
	4zrbD6QC3lF6FYl+4ixPIuCN5zjTPkn8yQC28ZdztD/6b/4MxvudCFQY+NkntDsrrc0I1IZAnSyCK
	KwEixWEY8QYJcqX4o+KcPcWBttyxuzRYSxUReDg3ga+nzu6Anyld7QPfuciE/TrNYaU5TJ7hExNzR
	TnJglmtsjIdZIFHAtWWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfvoM-002BaU-1D;
	Tue, 12 Sep 2023 05:19:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfvoK-002BZm-1D
	for ath11k@lists.infradead.org;
	Tue, 12 Sep 2023 05:19:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38C4VFH8016280;
	Tue, 12 Sep 2023 05:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=rqH4i04aOnL+3UbLo/Mpkvggeg+3It7OrjPGumfD7SI=;
 b=Nl9KzhBYht/rPT94IBHHulCoEFcjHuPMkw4wNYjn+9QvZx4pfrJQNO4wocvt8q5XTHdz
 GOYtMrCHTJhOqgtWHZ0azgwXNfzQlJLKfIaxSSutxrjtYe0auPxnXQUpjjrMZHFdUvr7
 AbUFgMYBbfrZ1n8dL22A5LFsRDqejtFIMmJR/l1MY5VjZZbY7C2kSDYqF7tIDoVGO+dv
 ZaQQ9ach6rR8pnAFDd96pSQRL2cqRP3xYcbuUPE8n7IMzCldoPL/UP8EQt+bxT2+ArPC
 OhyKGxk5fGpu2wWS9Jk5iccwpmwJwU4TzYA5VEHYtPQIQuUoAidoJ3eO14B/7PRHTNWk sA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t29b0gxgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 05:19:39 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38C5JY25000952
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 05:19:34 GMT
Received: from adisi-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Mon, 11 Sep 2023 22:19:32 -0700
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <johannes@sipsolutions.net>,
        "Aditya
 Kumar Singh" <quic_adisi@quicinc.com>
Subject: [PATCH v2 3/3] wifi: ath11k: fix Tx power value during active CAC
Date: Tue, 12 Sep 2023 10:48:57 +0530
Message-ID: <20230912051857.2284-4-quic_adisi@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230912051857.2284-1-quic_adisi@quicinc.com>
References: <20230912051857.2284-1-quic_adisi@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qfBgaOcHubHXFXkakQxOiveQKtNnORoV
X-Proofpoint-ORIG-GUID: qfBgaOcHubHXFXkakQxOiveQKtNnORoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_02,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309120044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_221940_419984_C6D10946 
X-CRM114-Status: GOOD (  16.65  )
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

Tx power is fetched from firmware's pdev stats. However, during active
CAC, firmware does not fill the current Tx power and sends the max
initialised value filled during firmware init. If host sends this power
to user space, this is wrong since in certain situations, the Tx power
could be greater than the max allowed by the regulatory. Hence, host
should not be fetching the Tx power during an active CAC.

Fix this issue by returning Tx power as 0 during active CAC since it
is known that during CAC, there will be no transmission happening.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Fixes: 9a2aa68afe3d ("wifi: ath11k: add get_txpower mac ops")
Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/mac.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 6b5f032197ff..a36698688f89 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -9045,6 +9045,14 @@ static int ath11k_mac_op_get_txpower(struct ieee80211_hw *hw,
 	if (ar->state != ATH11K_STATE_ON)
 		goto err_fallback;
 
+	/* Firmware doesn't provide Tx power during CAC hence no need to fetch
+	 * the stats.
+	 */
+	if (test_bit(ATH11K_CAC_RUNNING, &ar->dev_flags)) {
+		mutex_unlock(&ar->conf_mutex);
+		return -EAGAIN;
+	}
+
 	req_param.pdev_id = ar->pdev->pdev_id;
 	req_param.stats_id = WMI_REQUEST_PDEV_STAT;
 
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
