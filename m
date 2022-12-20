Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB024C4332F
	for <ath11k@archiver.kernel.org>; Tue, 20 Dec 2022 04:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3M6txdQ1OTp98rsxDqbJnGLDTIIfch2Mfl3VwfGm8P0=; b=V8ZScoIi2m6yr1
	wYQ22qjZI0p7BRhdErWnDTCXR5v12+hxIQIXIu9UbD8Kd/qLGKdQCAjKBkccp3VgM5N4V1UvSWoKF
	0mgVkOlu4mmM1igtHCqP+ETmHnS7x4dxEh5AsGpMBr7GjEsINCPalFD6seodXJH3lnMMHOUre2viR
	2atymPjSYqJ4SblKTSdBjeF75a+Qoj3AhBb3OzTYsDefyxsVvQ2M3CtMKx0vBKznWacCEJPw0zZWA
	l2MarjQ/bhZO6Q9L7c1q26AXdb0t38DEUlX4MNIw0QA8BOPgWS9bU5lPVeDUirS+Q9I3pDGmANgn7
	Ou1BYqW3O1ZM77e4TNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7UVU-009Fh5-1F; Tue, 20 Dec 2022 04:45:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7UVR-009FdE-Fm
	for ath11k@lists.infradead.org; Tue, 20 Dec 2022 04:45:35 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BK2XkYo001989;
	Tue, 20 Dec 2022 04:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=eyaRlWh64pdyOs/RgZYtOLxNNIgrxZZn927yBG+2lXM=;
 b=l2h2CBPMZ9skwyebmuwDj+rvRE9l4Mpvtt/PxlVTyBjdZpdmcb3Sbr0GjrqjIW7pGqTj
 /sFXL3b2ZraWR2ycH4OMiA7yaPpQsXk2pVzLe505RPSebppfMZVdKMQM7q6B74jPPWSE
 IeWpfrx5/78kCWxR+mGBItMXHZqEV8EK/er4MQr5s4uTrWkZNPi4QZGjeD/t+dhfjSwV
 J3MiHl8k/MQqyPV4oNis9pYNTKaMpoap1kX7JotxyE9fh7SfJHEwgwZRZsgB9uPeznqR
 KNiK7Cxz9vh5BTRZ4akwghGKKAjWLhbo0t+FFN9RQBe8fIBHqcfuS6hkRTMKJbjDN9Po KQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mh72gdnbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Dec 2022 04:45:30 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BK4jT5K012293
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Dec 2022 04:45:29 GMT
Received: from rajkbhag-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 19 Dec 2022 20:45:27 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sowmiya Sree Elavalagan
	<quic_ssreeela@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [PATCH] wifi: ath11k: Add support to configure FTM responder role
Date: Tue, 20 Dec 2022 10:14:35 +0530
Message-ID: <20221220044435.10506-1-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Rngxt95eTtt8K-K_CeCuNiWrpo8V2Nzx
X-Proofpoint-ORIG-GUID: Rngxt95eTtt8K-K_CeCuNiWrpo8V2Nzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-19_05,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 suspectscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212200040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_204533_568379_48D9D11C 
X-CRM114-Status: GOOD (  20.35  )
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

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Fine Timing Measurement(FTM) support is used to measure round trip
time between two nodes.

Enable FTM responder feature using hw_params on supported device.
Since FTM functionality is offloaded to firmware, adding the
interface allows user space to enable or disable FTM responder.
Also add support for advertising the same in extended capabilities.

QCA6390, WCN6855 and WCN6750 do not support this feature.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/core.c |  8 ++++++++
 drivers/net/wireless/ath/ath11k/core.h |  1 +
 drivers/net/wireless/ath/ath11k/hw.h   |  1 +
 drivers/net/wireless/ath/ath11k/mac.c  | 20 +++++++++++++++++++-
 drivers/net/wireless/ath/ath11k/wmi.h  |  1 +
 5 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 809f47e6f90f..706dc86fe25c 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -116,6 +116,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tcl_ring_retry = true,
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 		.smp2p_wow_exit = false,
+		.ftm_responder = true,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ6018_HW10,
@@ -198,6 +199,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 		.smp2p_wow_exit = false,
 		.support_fw_mac_sequence = false,
+		.ftm_responder = true,
 	},
 	{
 		.name = "qca6390 hw2.0",
@@ -282,6 +284,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 		.smp2p_wow_exit = false,
 		.support_fw_mac_sequence = true,
+		.ftm_responder = false,
 	},
 	{
 		.name = "qcn9074 hw1.0",
@@ -363,6 +366,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 		.smp2p_wow_exit = false,
 		.support_fw_mac_sequence = false,
+		.ftm_responder = true,
 	},
 	{
 		.name = "wcn6855 hw2.0",
@@ -447,6 +451,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 		.smp2p_wow_exit = false,
 		.support_fw_mac_sequence = true,
+		.ftm_responder = false,
 	},
 	{
 		.name = "wcn6855 hw2.1",
@@ -529,6 +534,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 		.smp2p_wow_exit = false,
 		.support_fw_mac_sequence = true,
+		.ftm_responder = false,
 	},
 	{
 		.name = "wcn6750 hw1.0",
@@ -609,6 +615,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE_WCN6750,
 		.smp2p_wow_exit = true,
 		.support_fw_mac_sequence = true,
+		.ftm_responder = false,
 	},
 	{
 		.hw_rev = ATH11K_HW_IPQ5018_HW10,
@@ -688,6 +695,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
 		.tx_ring_size = DP_TCL_DATA_RING_SIZE,
 		.smp2p_wow_exit = false,
 		.support_fw_mac_sequence = false,
+		.ftm_responder = true,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
index beb552108ac3..b01c806ffa23 100644
--- a/drivers/net/wireless/ath/ath11k/core.h
+++ b/drivers/net/wireless/ath/ath11k/core.h
@@ -346,6 +346,7 @@ struct ath11k_vif {
 
 	bool is_started;
 	bool is_up;
+	bool ftm_responder;
 	bool spectral_enabled;
 	bool ps;
 	u32 aid;
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 9f45d061d826..0be4e1232384 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -224,6 +224,7 @@ struct ath11k_hw_params {
 	u32 tx_ring_size;
 	bool smp2p_wow_exit;
 	bool support_fw_mac_sequence;
+	bool ftm_responder;
 };
 
 struct ath11k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index b198edba76eb..767a2a39ad6a 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -3110,7 +3110,7 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 	u16 bitrate;
 	int ret = 0;
 	u8 rateidx;
-	u32 rate;
+	u32 rate, param;
 	u32 ipv4_cnt;
 
 	mutex_lock(&ar->conf_mutex);
@@ -3412,6 +3412,20 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw *hw,
 		}
 	}
 
+	if (changed & BSS_CHANGED_FTM_RESPONDER &&
+	    arvif->ftm_responder != info->ftm_responder &&
+	    ar->ab->hw_params.ftm_responder &&
+	    (vif->type == NL80211_IFTYPE_AP ||
+	     vif->type == NL80211_IFTYPE_MESH_POINT)) {
+		arvif->ftm_responder = info->ftm_responder;
+		param = WMI_VDEV_PARAM_ENABLE_DISABLE_RTT_RESPONDER_ROLE;
+		ret = ath11k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id, param,
+						    arvif->ftm_responder);
+		if (ret)
+			ath11k_warn(ar->ab, "Failed to set ftm responder %i: %d\n",
+				    arvif->vdev_id, ret);
+	}
+
 	if (changed & BSS_CHANGED_FILS_DISCOVERY ||
 	    changed & BSS_CHANGED_UNSOL_BCAST_PROBE_RESP)
 		ath11k_mac_fils_discovery(arvif, info);
@@ -9113,6 +9127,10 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	wiphy_ext_feature_set(ar->hw->wiphy,
 			      NL80211_EXT_FEATURE_SET_SCAN_DWELL);
 
+	if (ab->hw_params.ftm_responder)
+		wiphy_ext_feature_set(ar->hw->wiphy,
+				      NL80211_EXT_FEATURE_ENABLE_FTM_RESPONDER);
+
 	ath11k_reg_init(ar);
 
 	if (!test_bit(ATH11K_FLAG_RAW_MODE, &ab->dev_flags)) {
diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 8f2c07d70a4a..0a045af5419b 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -1073,6 +1073,7 @@ enum wmi_tlv_vdev_param {
 	WMI_VDEV_PARAM_ENABLE_BCAST_PROBE_RESPONSE,
 	WMI_VDEV_PARAM_FILS_MAX_CHANNEL_GUARD_TIME,
 	WMI_VDEV_PARAM_HE_LTF = 0x74,
+	WMI_VDEV_PARAM_ENABLE_DISABLE_RTT_RESPONDER_ROLE = 0x7d,
 	WMI_VDEV_PARAM_BA_MODE = 0x7e,
 	WMI_VDEV_PARAM_AUTORATE_MISC_CFG = 0x80,
 	WMI_VDEV_PARAM_SET_HE_SOUNDING_MODE = 0x87,
-- 
2.17.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
