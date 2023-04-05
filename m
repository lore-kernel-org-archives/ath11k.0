Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9934AC7619A
	for <ath11k@archiver.kernel.org>; Wed,  5 Apr 2023 22:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4uqAhDajbgOafpDoYHFS7m6lTyk1torijRkH3IkWxGY=; b=PGGqFO2E95JXXR
	tAlE90z5ZHKhTOknknxtTDcazWbsvjQrJkz6AVc20sBcszcuBKDydpzjt6Q8fVYwjW6FzzBO3QpS0
	kqgKlc9IY9/3d/zx/CK0fEBTdCOf/t5bv04aauQykyBxDHIq/OfzYiT9DgDsWSY5pZKhlsX8bFV4m
	JElXhKgleYB/ZuFwbX6MO7arHD0T9REP0HVOcZQ5n2+WTpHQKB8sKI09K32frFsxD5VtQzmXTeDEc
	TcdR6MJs2H1Z6lRjkMKdZmBl2U7OuvNW7/ruksibUW6vxW2RXZGDF8Kyv7dOpA41mgzQaZ7zhr68l
	tZ3eFYs9jQRrxp0aMtHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkBRE-005psx-2W;
	Wed, 05 Apr 2023 22:17:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkBRB-005pqc-0x
	for ath11k@lists.infradead.org;
	Wed, 05 Apr 2023 22:17:06 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 335MAfsE015969;
	Wed, 5 Apr 2023 22:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=um5EGkcw2CgtiSi18U1NlpdztWBskNaEKEBYO/sV9j4=;
 b=h556WPU0U3H7SzjT3Y7q6Uz1wIcLJecWfDenAPo0TLVLvVe+M4fVB8G5geyTw/LpGOuC
 n8GP0ehtS9LQsJOatSBLvOJSKRNcH49PjRQRO9d+NjWbmdDamqIcM0mMYNw3NQraGlap
 g/4q8u2jKhvMzDpvOjNhq0fZd/l0GQI5NWLsP4zI+Id6QVRtlGR26An3HTrWgC4ULiN/
 cOm6FNKYF1wNbvwtRPxfFMM6gZb9yMm0v0Ry3gWSDQ3u11ABU79AJzg/NvBmHrf+IIZ5
 YNq671sC9/47CVnyUiBVOk+dkKgyhI9XYaFH03KKk5TfpeS0wKwAMDcmd8prdhcntE1J Ww== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3prpg23sf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Apr 2023 22:16:59 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 335MGw2m002081
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Apr 2023 22:16:58 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 5 Apr 2023 15:16:58 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
Subject: [PATCH v3 5/7] wifi: ath11k: refactor vif parameter configurations
Date: Wed, 5 Apr 2023 15:16:46 -0700
Message-ID: <20230405221648.17950-6-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230405221648.17950-1-quic_alokad@quicinc.com>
References: <20230405221648.17950-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iKfbudPUzVZKqVtuS391pe1MkMAF4aVr
X-Proofpoint-ORIG-GUID: iKfbudPUzVZKqVtuS391pe1MkMAF4aVr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_15,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304050199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_151705_340004_52985679 
X-CRM114-Status: GOOD (  17.25  )
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

Security parameters for each non-transmitting profile can be
different when MBSSID is enabled and this information is included
in the MBSSID element in the Beacon frame. Current implementation
to set rsnie_present and wpaie_present does not parse this element
hence it applies only to the transmitting interface.

Move the code to a separate function to make additions for
non-transmitting interfaces cleaner.

Tested-on : IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
---
v3: Renamed ath11k_mac_setup_bcn_tmpl_vif_params(0 as
    ath11k_mac_set_vif_params() as the parameters are not actually
    set in the Beacon frame. MLO link ID change is not required
    anymore.

v2: Changed calls to mac80211 APIs to include MLO link ID.

 drivers/net/wireless/ath/ath11k/mac.c | 41 ++++++++++++++++-----------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 87f21a3f0ac6..a10f4a6a1120 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1351,28 +1351,14 @@ static int ath11k_mac_op_config(struct ieee80211_hw *hw, u32 changed)
 	return ret;
 }
 
-static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
+static void ath11k_mac_set_vif_params(struct ath11k_vif *arvif,
+				      struct sk_buff *bcn)
 {
-	struct ath11k *ar = arvif->ar;
-	struct ath11k_base *ab = ar->ab;
-	struct ieee80211_hw *hw = ar->hw;
-	struct ieee80211_vif *vif = arvif->vif;
-	struct ieee80211_mutable_offsets offs = {};
-	struct sk_buff *bcn;
 	struct ieee80211_mgmt *mgmt;
 	u8 *ies;
-	int ret;
-
-	if (arvif->vdev_type != WMI_VDEV_TYPE_AP)
-		return 0;
-
-	bcn = ieee80211_beacon_get_template(hw, vif, &offs, 0);
-	if (!bcn) {
-		ath11k_warn(ab, "failed to get beacon template from mac80211\n");
-		return -EPERM;
-	}
 
 	ies = bcn->data + ieee80211_get_hdrlen_from_skb(bcn);
+	mgmt = (struct ieee80211_mgmt *)bcn->data;
 	ies += sizeof(mgmt->u.beacon);
 
 	if (cfg80211_find_ie(WLAN_EID_RSN, ies, (skb_tail_pointer(bcn) - ies)))
@@ -1386,7 +1372,28 @@ static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
 		arvif->wpaie_present = true;
 	else
 		arvif->wpaie_present = false;
+}
+
+static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
+{
+	struct ath11k *ar = arvif->ar;
+	struct ath11k_base *ab = ar->ab;
+	struct ieee80211_hw *hw = ar->hw;
+	struct ieee80211_vif *vif = arvif->vif;
+	struct ieee80211_mutable_offsets offs = {};
+	struct sk_buff *bcn;
+	int ret;
+
+	if (arvif->vdev_type != WMI_VDEV_TYPE_AP)
+		return 0;
+
+	bcn = ieee80211_beacon_get_template(hw, vif, &offs, 0);
+	if (!bcn) {
+		ath11k_warn(ab, "failed to get beacon template from mac80211\n");
+		return -EPERM;
+	}
 
+	ath11k_mac_set_vif_params(arvif, bcn);
 	ret = ath11k_wmi_bcn_tmpl(ar, arvif->vdev_id, &offs, bcn);
 
 	kfree_skb(bcn);
-- 
2.39.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
