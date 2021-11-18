Return-Path: <SRS0=Pndp=QF=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF3EC433F5
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 09:55:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02A8C61A3D
	for <ath11k@archiver.kernel.org>; Thu, 18 Nov 2021 09:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02A8C61A3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jck9NiJnnFE/FaL2ClqjEt7nxM8knVFbeLElcRrweTM=; b=BboEdaqMDNtgH9
	/l6MCZLRhfOciVJCIaeKaqOzJuP0iBni8wF9FMU4J4mMF1339z2nJ7dethLfIYzpu93HDFAp2jBWK
	/bdL3Y4WqjvjnvWbHhtZ45HHM3C1zQ2ka7Om1nkj8CRIGBV+mqkccCZjhxqElJWkmUTiRTUfhaIfS
	tSsZocvxkEwQc9yGRko4noriUEgMgJG11SA4K0U31DvDqiaKC4bWbSb/6op88NEgEqRNqbLEDvd9d
	GwrRQpsCoRuAnYskUL9fDu1b3LRDg+QKLfIeiOx9cGdQ7XqJC6NVbwPYn6PwdItJjQ1RkBriMmjkY
	gZ4TfIX3VK/USI3kLLuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mne8N-007Nv3-8C; Thu, 18 Nov 2021 09:55:11 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mne8K-007Ntk-6z
 for ath11k@lists.infradead.org; Thu, 18 Nov 2021 09:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637229308; x=1668765308;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+2YcXvbKXsgQOVRTcnssEEZkpO2fAVhU0O91Vbuky8Y=;
 b=oQgUTxFFgwdiNq+Kt+t/3jaem/+i0JZSKN8v3M3yGB+Nd57qcMmYJfCN
 Ut/H2WFOGAp7O5JrNDuuDAR09B+aToox9Co3X+P4PLPvwfQGUTe097SA/
 YAGhfnQ/oQu3F1Plf9vEv1MthckoY0NtYGftinAK20tEeQU21KdOM/GMh Y=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 18 Nov 2021 01:55:07 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 01:55:07 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 01:55:07 -0800
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 18 Nov 2021 01:55:06 -0800
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v2] ath11k: calculate the correct NSS of peer for HE
 capabilities
Date: Thu, 18 Nov 2021 04:54:53 -0500
Message-ID: <20211118095453.8030-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_015508_311457_63B47EC1 
X-CRM114-Status: GOOD (  13.49  )
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

When connected to 6G mode AP, it does not have VHT/HT capabilities,
so the NSS is not set, then it is 1 by default.

This patch is to calculate the NSS with supported HE-MCS and NSS set
of HE capabilities.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01280-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
v2: rebased to latest ath.git master ath-202111170737

 drivers/net/wireless/ath/ath11k/mac.c | 38 ++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 292b2b7eab11..580a3404dc4b 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1920,7 +1920,6 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 	struct ath11k_vif *arvif = (void *)vif->drv_priv;
 	struct cfg80211_chan_def def;
 	const struct ieee80211_sta_he_cap *he_cap = &sta->he_cap;
-	u8 ampdu_factor;
 	enum nl80211_band band;
 	u16 *he_mcs_mask;
 	u8 max_nss, he_mcs;
@@ -1928,6 +1927,9 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 	int i, he_nss, nss_idx;
 	bool user_rate_valid = true;
 	u32 rx_nss, tx_nss, nss_160;
+	u8 ampdu_factor, rx_mcs_80, rx_mcs_160;
+	u16 mcs_160_map, mcs_80_map;
+	bool support_160;
 
 	if (WARN_ON(ath11k_mac_vif_chan(vif, &def)))
 		return;
@@ -1942,6 +1944,40 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 		return;
 
 	arg->he_flag = true;
+	support_160 = !!(he_cap->he_cap_elem.phy_cap_info[0] &
+		  IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G);
+
+	/* Supported HE-MCS and NSS Set of peer he_cap is intersection with self he_cp */
+	mcs_160_map =
+		le16_to_cpu(he_cap->he_mcs_nss_supp.rx_mcs_160);
+	mcs_80_map = le16_to_cpu(he_cap->he_mcs_nss_supp.rx_mcs_80);
+
+	if (support_160) {
+		for (i = 7; i >= 0; i--) {
+			u8 mcs_160 = (mcs_160_map >> (2 * i)) & 3;
+
+			if (mcs_160 != IEEE80211_VHT_MCS_NOT_SUPPORTED) {
+				rx_mcs_160 = i + 1;
+				break;
+			}
+		}
+	}
+
+	for (i = 7; i >= 0; i--) {
+		u8 mcs_80 = (mcs_80_map >> (2 * i)) & 3;
+
+		if (mcs_80 != IEEE80211_VHT_MCS_NOT_SUPPORTED) {
+			rx_mcs_80 = i + 1;
+			break;
+		}
+	}
+
+	if (support_160)
+		max_nss = min(rx_mcs_80, rx_mcs_160);
+	else
+		max_nss = rx_mcs_80;
+
+	arg->peer_nss = min(sta->rx_nss, max_nss);
 
 	memcpy_and_pad(&arg->peer_he_cap_macinfo,
 		       sizeof(arg->peer_he_cap_macinfo),

base-commit: 63ec871bc50a306aac550e2d85f697ca2d5f5deb
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
