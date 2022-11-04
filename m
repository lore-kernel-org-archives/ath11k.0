Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD64C433FE
	for <ath11k@archiver.kernel.org>; Fri,  4 Nov 2022 08:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BIX40gMMSlVrK+dKmMGtT6ooCuZsov093SN5Wao9pRg=; b=qIcYIq0AXy5xSq
	rdOKkFLH+LtaeHELkL6wWxZ3cPTvRdez8pq/O0kM/X+6W/YcHIwb8WFeEoBmZRh89FjdoPWUoEkLF
	6IjTvd9l5LxaeAr9HBU9dSDFzUKp6VxLsP4XLsKG09qhgMwJKTIY1BFV0Znf9d+C4ImmVvtaxilM2
	VV9iiVmd13mVVmaQCtCcATCrbJc25LdDd33zT6SiwTPjim4CIV8Z8ZwCyHlbtVG/RjwMfgPagYxEI
	mVfdbfc++/cmcXTbHmWe63+6gnQRG/iA+JNdmxe5C5XME/Iu0CSduaAdfBbRdEwbAcUVdqsEUWoX0
	YMd/VT06ke8aFhkiwG6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqsTb-0031EO-0o; Fri, 04 Nov 2022 08:54:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqsTX-0031CZ-RO
	for ath11k@lists.infradead.org; Fri, 04 Nov 2022 08:54:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A48TCU4007256;
	Fri, 4 Nov 2022 08:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=Q3ivjPfhefs5FmtsQkMYD0t2R+VeUMRe8emnV2rOpL0=;
 b=mUTwq12nkeKXiDYYLcZIUjhd8Mv+rxsryug9+deYATaasdkMy4hZBKK8gl+4Cuqfiydz
 zkxZYqfPfb9bDJ/Uu9h3mQ4wCuT/150OtZU5aUCCb0UdnjbC/efTHlzYInG9Wnt9RYR9
 9NTBsXWI6GhP5Y84HYSJoxb3xuyBPW4OTaOeQ5flccsRW/wqYHUmJlRbCryHppi2MEKQ
 b8S41JWU8SZst1pUrAd1pi0YvZEMoCKOkaKp1djlxS0t6jUqQ0JAMp9c+lfOpxVfY76g
 YEeR+PHL8uWy4gW1pOmapNQLx3fpurH5hP4KBEuDUm732/KfNGVA3mLpoUbJkKJEeCiD Zw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kmvk90cvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 08:54:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2A48sR7s026294
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Nov 2022 08:54:27 GMT
Received: from youghand-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 4 Nov 2022 01:54:25 -0700
From: Youghandhar Chintala <quic_youghand@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Youghandhar Chintala <quic_youghand@quicinc.com>,
        kernel test robot
	<lkp@intel.com>
Subject: [PATCH v2] wifi: ath11k: Trigger sta disconnect on hardware restart
Date: Fri, 4 Nov 2022 14:24:03 +0530
Message-ID: <20221104085403.11025-1-quic_youghand@quicinc.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V30OoK6WFme0V4BW0prj2MM9tIkvTDFk
X-Proofpoint-ORIG-GUID: V30OoK6WFme0V4BW0prj2MM9tIkvTDFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_02,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_015456_034225_BBE9430E 
X-CRM114-Status: GOOD (  19.46  )
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

Reported-by: kernel test robot <lkp@intel.com>

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1

Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>

---
Changes from v1:
- Added arvif declaration
---
 drivers/net/wireless/ath/ath11k/core.c | 6 ++++++
 drivers/net/wireless/ath/ath11k/hw.h   | 1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 8 ++++++++
 3 files changed, 15 insertions(+)

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
index 6426a38f8961..d0ba05e7e879 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -8010,6 +8010,7 @@ ath11k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
 	struct ath11k *ar = hw->priv;
 	struct ath11k_base *ab = ar->ab;
 	int recovery_count;
+	struct ath11k_vif *arvif;
 
 	if (reconfig_type != IEEE80211_RECONFIG_TYPE_RESTART)
 		return;
@@ -8045,6 +8046,13 @@ ath11k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
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
