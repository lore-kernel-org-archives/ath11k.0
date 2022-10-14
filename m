Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85E4C4332F
	for <ath11k@archiver.kernel.org>; Fri, 14 Oct 2022 15:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CjKmpWJAa48YGhFFEi1WSBIY5gVzQs5oCUuhPjktM3M=; b=hz7U+56y6pU0W6
	0slmZMEZPcQkzpxvJsE+FxVQHGtOtqz1nLZ+Zs0hQtCuhHajd8McETUeCh8Oy7XsDu07cLKnTafpT
	0YQj2AYH98MgyleKWQbmLl69D+conP6IJLSGlsxABsMxRl9ehWIUOS4ZZXd0oQs6xBxUihY618hTD
	Gi45SMI9D6xvzGQCbTe2Yd10iU2ihmEKso9aM2hm/9KkNWIp++wEZjBOz6Yxi6L95sn7NV3V4yhhR
	jGQjuyhgvHVCyg4k7jyeX7kmD7+Ly5KU54Dt8gShQ2WLQPbhfbTO0tS4SObanvRaUPoGEILn2SbcC
	o+m9mzPtzAHj2l1yQC1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojMpe-00FDCb-NQ; Fri, 14 Oct 2022 15:42:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojMpa-00FDAf-4J
	for ath11k@lists.infradead.org; Fri, 14 Oct 2022 15:42:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EEteqG016479;
	Fri, 14 Oct 2022 15:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=4tzYF922QtOZ9HWF2MUcwCmnjM0kWhjntW7t/8P2NOk=;
 b=UXnSCzxjLAhszEbfyybx53Ous/RY+nzT4l+xL2nIOZBRu5YQvR9pKKPnzleTHpq222on
 BHsNBE36ujFULmwzDydrxSTL1perMLYdlMRxMMVoqVLXzte0bU7rwQm/BYxYQGkZiGzq
 +DzHnfbHP4oSJiHXdQqyp8+muZF4U3TY0bqzGy0Z6IRyw1I6ak+RmsCcIJLUZOmzuKta
 VPKOHcdJWNrbdejnvyDtqymtdG7ESUKUwZzkriObJLEaAB3LF47Uxnynu9zpgUv95cl/
 r+s0Llzo+qbtZEo470XhY/mwHV/GSvmhzPLTHCKvDX/sA6bZ9A/+12w/dKXgyasOMhIj 4w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k74ech6tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Oct 2022 15:42:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29EFgVht003870
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Oct 2022 15:42:31 GMT
Received: from nmaran-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 14 Oct 2022 08:42:30 -0700
From: Nagarajan Maran <quic_nmaran@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Nagarajan Maran
	<quic_nmaran@quicinc.com>
Subject: [PATCH] ath11k: fix monitor vdev creation with firmware recovery
Date: Fri, 14 Oct 2022 21:12:16 +0530
Message-ID: <20221014154216.4262-1-quic_nmaran@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KSOr6z2wb6968Xn1968n4EwKId0xSna0
X-Proofpoint-ORIG-GUID: KSOr6z2wb6968Xn1968n4EwKId0xSna0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_09,2022-10-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=988 mlxscore=0
 impostorscore=0 clxscore=1011 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_084238_214567_40D636B0 
X-CRM114-Status: GOOD (  14.41  )
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

During firmware recovery, the monitor interface is not
getting created in the driver and firmware since
the respective flags are not updated properly.

So after firmware recovery is successful, when monitor
interface is brought down manually, firmware assertion
is observed, since we are trying to bring down the
interface which is not yet created in the firmware.

Fix this by updating the monitor flags properly per
phy#, during firmware recovery.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Nagarajan Maran <quic_nmaran@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 35a5de3a0a8a..0ab2f190f1ec 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1677,6 +1677,10 @@ void ath11k_core_pre_reconfigure_recovery(struct ath11k_base *ab)
 			     ath11k_mac_tx_mgmt_pending_free, ar);
 		idr_destroy(&ar->txmgmt_idr);
 		wake_up(&ar->txmgmt_empty_waitq);
+
+		ar->monitor_vdev_id = -1;
+		clear_bit(ATH11K_FLAG_MONITOR_STARTED, &ar->monitor_flags);
+		clear_bit(ATH11K_FLAG_MONITOR_VDEV_CREATED, &ar->monitor_flags);
 	}
 
 	wake_up(&ab->wmi_ab.tx_credits_wq);
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
