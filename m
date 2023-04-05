Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738A3C77B73
	for <ath11k@archiver.kernel.org>; Wed,  5 Apr 2023 22:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZUoSXzvRFa/KStmjChxvzdNsyXcJs/MpIVmAqHnH8Ik=; b=4lGw9Od6b4u0qL
	LoNv7tnmgCaotWTISkIDch8GzurbQ8ZQJHSUPIQo2HinGYZfpIAZ93Xf+wuadafcawJxg9pxj1Hig
	RJdtl76nEWodN1pWyJqgtcCAsxyPwquybuiJ6cICGfMAFWvpNTudtyzaqrdp3ZBgSfbP7irfgYwz1
	VRy0ZGMdtdTBFnIJy5zUu7kUsJ6jI3FwrlftdQHKQJbo3sq1UkMpqcchEYBlEkA5xfXl77nY8O+U4
	fpKKvEA03X3kknQXdYsEDoeUsUZ6aybII3ZseIYKLSqmfdOXaqzzd/fopMEd8o06qJSkBeIT5Eiy8
	5NMrri1068mXQpYJw1bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkBRH-005puW-0J;
	Wed, 05 Apr 2023 22:17:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkBRB-005pqe-1P
	for ath11k@lists.infradead.org;
	Wed, 05 Apr 2023 22:17:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 335LrxaI012682;
	Wed, 5 Apr 2023 22:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=ra/cOyqEFup0CVK77aWcP2hGC1gvM67pOXsAMMZncAQ=;
 b=hozLGpbf6t40CKKBVsFpVhbIydftc9re8ThIaRmBImiXYU7v2IgJtRvkVdQAYrNLOM7l
 2ZX/CU1vwkzXXWDmx1mqGdwe89+INoYErGAxSwa494QRiIAmVT7Tw8lVKRcuGOsHGcFo
 W2MC46wkiaSouZbIcP0w2UbmvSXrMom4QJkQUdnhcF/C1IeB7KCK2ixD2hv8+bVY/JuH
 NiDs3Wkbzp3JNMOKI3vhlbT5I3h9a13psuOLqGlYegUZmNRR7Erbc0ncgK1LfGgPQcjU
 2HgTzV6TMwdKMvthFfjECMM092jZ1vNDt/sfsXMjgI0sFMMaLKP+kBDSFwUPEoPdiG/Q jg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3psf2w88yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Apr 2023 22:17:00 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 335MGxQ9022492
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Apr 2023 22:16:59 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 5 Apr 2023 15:16:58 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
Subject: [PATCH v3 6/7] wifi: ath11k: MBSSID beacon support
Date: Wed, 5 Apr 2023 15:16:47 -0700
Message-ID: <20230405221648.17950-7-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230405221648.17950-1-quic_alokad@quicinc.com>
References: <20230405221648.17950-1-quic_alokad@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: C9ekNfCelnnedMmu4ImF1qjwb7Md580N
X-Proofpoint-GUID: C9ekNfCelnnedMmu4ImF1qjwb7Md580N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_15,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304050199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_151705_595340_7E8BEE0C 
X-CRM114-Status: GOOD (  23.64  )
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

- Split ath11k_mac_setup_bcn_tmpl() to move the beacon retrieval and
  WMI command to a new function, ath11k_mac_setup_bcn_tmpl_legacy().
  In the original function add checks to use the transmitting interface
  when MBSSID is enabled.
- Set rsnie_present and wpaie_present fields for the non-transmitting
  interfaces when MBSSID is enabled.

Tested-on : IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
Co-developed-by: John Crispin <john@phrozen.org>
Signed-off-by: John Crispin <john@phrozen.org>
---
v3: Squashed some hunks from patches 09/10 and 10/10 from v2 to create
    this which logically adds support for MBSSID, beacon related
    as well as vif parameters for non-transmitting profiles.
    Renamed ath11k_mac_setup_bcn_tmpl_nontx_vif_rsnie() as
    ath11k_mac_setup_nontx_vif_rsnie() as this function does
    not set anything in the beacon template.
v2: Rebase only.

 drivers/net/wireless/ath/ath11k/mac.c | 116 ++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/wmi.c |   1 +
 2 files changed, 112 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index a10f4a6a1120..ee910fd756f2 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1351,6 +1351,84 @@ static int ath11k_mac_op_config(struct ieee80211_hw *hw, u32 changed)
 	return ret;
 }
 
+static void ath11k_mac_setup_nontx_vif_rsnie(struct ath11k_vif *arvif,
+					     bool tx_arvif_rsnie_present,
+					     const u8 *profile, u8 profile_len)
+{
+	if (cfg80211_find_ie(WLAN_EID_RSN, profile, profile_len)) {
+		arvif->rsnie_present = true;
+	} else if (tx_arvif_rsnie_present) {
+		int i;
+		u8 nie_len;
+		const u8 *nie = cfg80211_find_ext_ie(WLAN_EID_EXT_NON_INHERITANCE,
+						     profile, profile_len);
+		if (!nie)
+			return;
+
+		nie_len = nie[1];
+		nie += 2;
+		for (i = 0; i < nie_len; i++) {
+			if (nie[i] == WLAN_EID_RSN) {
+				arvif->rsnie_present = false;
+				break;
+			}
+		}
+	}
+}
+
+static bool ath11k_mac_set_nontx_vif_params(struct ath11k_vif *tx_arvif,
+					    struct ath11k_vif *arvif,
+					    struct sk_buff *bcn)
+{
+	struct ieee80211_mgmt *mgmt;
+	const u8 *ies, *profile, *next_profile;
+	int ies_len;
+
+	ies = bcn->data + ieee80211_get_hdrlen_from_skb(bcn);
+	mgmt = (struct ieee80211_mgmt *)bcn->data;
+	ies += sizeof(mgmt->u.beacon);
+	ies_len = skb_tail_pointer(bcn) - ies;
+
+	ies = cfg80211_find_ie(WLAN_EID_MULTIPLE_BSSID, ies, ies_len);
+	arvif->rsnie_present = tx_arvif->rsnie_present;
+
+	while (ies) {
+		u8 mbssid_len;
+
+		ies_len -= (2 + ies[1]);
+		mbssid_len = ies[1] - 1;
+		profile = &ies[3];
+
+		while (mbssid_len) {
+			u8 profile_len;
+
+			profile_len = profile[1];
+			next_profile = profile + (2 + profile_len);
+			mbssid_len -= (2 + profile_len);
+
+			profile += 2;
+			profile_len -= (2 + profile[1]);
+			profile += (2 + profile[1]); /* nontx capabilities */
+			profile_len -= (2 + profile[1]);
+			profile += (2 + profile[1]); /* SSID */
+			if (profile[2] == arvif->vif->bss_conf.bssid_index) {
+				profile_len -= 5;
+				profile = profile + 5;
+				ath11k_mac_setup_nontx_vif_rsnie(arvif,
+								 tx_arvif->rsnie_present,
+								 profile,
+								 profile_len);
+				return true;
+			}
+			profile = next_profile;
+		}
+		ies = cfg80211_find_ie(WLAN_EID_MULTIPLE_BSSID, profile,
+				       ies_len);
+	}
+
+	return false;
+}
+
 static void ath11k_mac_set_vif_params(struct ath11k_vif *arvif,
 				      struct sk_buff *bcn)
 {
@@ -1374,18 +1452,26 @@ static void ath11k_mac_set_vif_params(struct ath11k_vif *arvif,
 		arvif->wpaie_present = false;
 }
 
-static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
+static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif)
 {
 	struct ath11k *ar = arvif->ar;
 	struct ath11k_base *ab = ar->ab;
+	struct ath11k_vif *tx_arvif = arvif;
 	struct ieee80211_hw *hw = ar->hw;
 	struct ieee80211_vif *vif = arvif->vif;
 	struct ieee80211_mutable_offsets offs = {};
 	struct sk_buff *bcn;
 	int ret;
 
-	if (arvif->vdev_type != WMI_VDEV_TYPE_AP)
-		return 0;
+	if (arvif->vif->mbssid_tx_vif) {
+		tx_arvif = (void *)arvif->vif->mbssid_tx_vif->drv_priv;
+		if (tx_arvif != arvif) {
+			ar = tx_arvif->ar;
+			ab = ar->ab;
+			hw = ar->hw;
+			vif = tx_arvif->vif;
+		}
+	}
 
 	bcn = ieee80211_beacon_get_template(hw, vif, &offs, 0);
 	if (!bcn) {
@@ -1393,9 +1479,12 @@ static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
 		return -EPERM;
 	}
 
-	ath11k_mac_set_vif_params(arvif, bcn);
-	ret = ath11k_wmi_bcn_tmpl(ar, arvif->vdev_id, &offs, bcn);
+	if (tx_arvif == arvif)
+		ath11k_mac_set_vif_params(tx_arvif, bcn);
+	else if (!ath11k_mac_set_nontx_vif_params(tx_arvif, arvif, bcn))
+		return -EINVAL;
 
+	ret = ath11k_wmi_bcn_tmpl(ar, arvif->vdev_id, &offs, bcn);
 	kfree_skb(bcn);
 
 	if (ret)
@@ -1405,6 +1494,23 @@ static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
 	return ret;
 }
 
+static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)
+{
+	struct ieee80211_vif *vif = arvif->vif;
+
+	if (arvif->vdev_type != WMI_VDEV_TYPE_AP)
+		return 0;
+
+	/* Target does not expect beacon templates for the already up
+	 * non-transmitting interfaces, and results in a crash if sent.
+	 */
+	if (vif->mbssid_tx_vif &&
+	    arvif != (void *)vif->mbssid_tx_vif->drv_priv && arvif->is_up)
+		return 0;
+
+	return ath11k_mac_setup_bcn_tmpl_mbssid(arvif);
+}
+
 void ath11k_mac_bcn_tx_event(struct ath11k_vif *arvif)
 {
 	struct ieee80211_vif *vif = arvif->vif;
diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 039df4847108..16bc4d16c7d2 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -1730,6 +1730,7 @@ int ath11k_wmi_bcn_tmpl(struct ath11k *ar, u32 vdev_id,
 	}
 
 	cmd->buf_len = bcn->len;
+	cmd->mbssid_ie_offset = offs->mbssid_off;
 
 	ptr = skb->data + sizeof(*cmd);
 
-- 
2.39.0


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
