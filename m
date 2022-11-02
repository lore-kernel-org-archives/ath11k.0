Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00502C433FE
	for <ath11k@archiver.kernel.org>; Wed,  2 Nov 2022 06:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mw5LenNBkXcWdR+RQfO3j+cLzepMSRfISJ9I3WCr2co=; b=TN3j0xwOMzPUvL
	DmFeQYT+OnE/+dDWGKNvaS3A+8lQTADYRVyW//HJcsuEbtgJAp1wjPt3O5fmY3+GOwVBPHc+vFODx
	Hr7zkI1zlKBK8tVZkxtP4S38jkQe8g0/k/6Bi2i6zTZSEDSgzKSFhUWgekijLjJIMjxKenQI5XiEp
	iHJ9qmU2wJeic8RNpgwyb8S3aDyMSrBoGzx+YRs+r2tgUK9OmcOpKYGPkANS/C/QgQIP3xpJ2wF9I
	RJPVoRiW7VICQjQ5/1pO2CF6OkVTW1EUzTwd60OBwvC4z5A1eX8I6nEIktTafNHMhSxtvu3cPqQWY
	Rvk9q8ammMggID4Lye0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq71Y-008QF9-VV; Wed, 02 Nov 2022 06:14:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq71W-008QDd-7B
	for ath11k@lists.infradead.org; Wed, 02 Nov 2022 06:14:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A25qY4a005300;
	Wed, 2 Nov 2022 06:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=xDWRRIQ1wf0+iOYlAZ8Oe2lQzK3V4SJ6qgIugj3Dzvs=;
 b=XPhU4JIi9lfm73/0IOR8b1SR3n8eIcelNtEFyiI/P/HBcFq34u6q5PfH9BIHYc4nYJeV
 yCdTa5fjN0EGMKRu9oxVAKIAyUMLOkE2pOgn0GJDnUvMgkinDbPFnZtcxeQ6goM0MnVF
 6J0yWc2AtmUgFaida1jic2g1gVolPt2c2fXDgmHbuS6XND77eRB3XKyoPGWqJeymu/X/
 OHw3NKmPrpkOWqDN1CPQNX84qe4X6K0GjE5skhkL72sUZNe0GYZSFALhoafFAhm5rqXn
 qukU0KUvfh0JAwo0v4lHGKxfX/nF0p8V+fEikw6CiAunt/4muEXdqQCQoUErz7UFnngL Tw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kk7nfhdx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Nov 2022 06:14:47 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A26EkD3022047
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Nov 2022 06:14:46 GMT
Received: from youghand-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Tue, 1 Nov 2022 23:14:44 -0700
From: Youghandhar Chintala <quic_youghand@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_mpubbise@quicinc.com>,
        Youghandhar Chintala <quic_youghand@quicinc.com>
Subject: [PATCH] wifi: ath11k: Trigger sta disconnect on hardware restart
Date: Wed, 2 Nov 2022 11:44:23 +0530
Message-ID: <20221102061423.1032-1-quic_youghand@quicinc.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uzQBI0wKQxUnHrBge5KRaC-THVOQNW4P
X-Proofpoint-GUID: uzQBI0wKQxUnHrBge5KRaC-THVOQNW4P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-02_02,2022-11-01_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211020037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_231450_404772_533AE4F7 
X-CRM114-Status: GOOD (  18.52  )
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

Currently after the hardware restart triggered from the driver, the
station interface connection remains intact, since a disconnect trigger
is not sent to userspace. This can lead to a problem in targets where
the wifi mac sequence is added by the firmware.

After the target restart, its wifi mac sequence number gets reset to
zero. Hence AP to which our device is connected will receive frames with
a  wifi mac sequence number jump to the past, thereby resulting in the
AP dropping all these frames, until the frame arrives with a wifi mac
sequence number which AP was expecting.

To avoid such frame drops, its better to trigger a station disconnect
upon target hardware restart which can be done with API
ieee80211_reconfig_disconnect exposed to mac80211.

The other targets are not affected by this change, since the hardware
params flag is not set.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 6 ++++++
 drivers/net/wireless/ath/ath11k/hw.h   | 1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 7 +++++++
 3 files changed, 14 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 0ab2f190f1ec..edf78df9b12f 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -195,6 +195,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tcl_ring_retry = true,
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 		.smp2p_wow_exit = false,
+		.support_fw_mac_sequence = false,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -277,6 +278,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tcl_ring_retry = true,
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 		.smp2p_wow_exit = false,
+		.support_fw_mac_sequence = true,
 	},
 	{
 		.name = "qcn9074 hw1.0",
@@ -356,6 +358,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tcl_ring_retry = true,
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 		.smp2p_wow_exit = false,
+		.support_fw_mac_sequence = false,
 	},
 	{
 		.name = "wcn6855 hw2.0",
@@ -438,6 +441,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tcl_ring_retry = true,
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 		.smp2p_wow_exit = false,
+		.support_fw_mac_sequence = true,
 	},
 	{
 		.name = "wcn6855 hw2.1",
@@ -519,6 +523,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tcl_ring_retry = true,
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 		.smp2p_wow_exit = false,
+		.support_fw_mac_sequence = true,
 	},
 	{
 		.name = "wcn6750 hw1.0",
@@ -597,6 +602,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tcl_ring_retry = false,
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE_WCN6750,
 		.smp2p_wow_exit = true,
+		.support_fw_mac_sequence = true,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 8a3f24862edc..0c5ef8a526d8 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -219,6 +219,7 @@ struct ath11k_hw_params {
 	bool tcl_ring_retry;
 	u32 tx_ring_size;
 	bool smp2p_wow_exit;
+	bool support_fw_mac_sequence;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 6426a38f8961..780841613bc6 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8045,6 +8045,13 @@ ath11k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
 				ath11k_dbg(ab, ATH11K_DBG_BOOT, "reset success\n");
 			}
 		}
+		if (ar->ab->hw_params.support_fw_mac_sequence) {
+			list_for_each_entry(arvif, &ar->arvifs, list) {
+				if (arvif->is_up && arvif->vdev_type == WMI_VDEV_TYPE_STA)
+					ieee80211_hw_restart_disconnect(arvif->vif);
+			}
+		}
+
 	}
 
 	mutex_unlock(&ar->conf_mutex);
-- 
2.38.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
