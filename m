Return-Path: <SRS0=4fK3=PO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94631C433FE
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 03:42:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BEB36023D
	for <ath11k@archiver.kernel.org>; Tue, 26 Oct 2021 03:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BEB36023D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ygh2Bj6HSGcyvKlp5Up+9J3L+Wp1NMW2AeH1EPPDIrE=; b=aclQr9XvMInTAD
	aGFM59H29tv9ts7Fkv3eS7PyUUsTRlzSGn4Pgs55wTJJKWH7O4gbcbqNFCf17Krnrpeg3WQYIP/6S
	34BX24PCT0RMTwvCPI4J8m1QuQuuJnOIRs6G9gebNaWGjny7lmp5xbVMlyMCGnTSz2ktnNRWO1QDs
	Ct9PBQ3OyG43Ck303+qKl5qIL6lE39lxGsOgi+zd9cKAdDIB/zVgkE9W31lJtzFnDabh+xSM8Oii+
	kcOnNf8dsaUML/nwb91PaFMIkux6ShRUpxy5btk+zN+b1iQqBp6NT8bi5NsQwXXVnhKYvS4DU0X3u
	peR0HzmpFSoRCu5wzF9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfDM4-000XlW-4Q; Tue, 26 Oct 2021 03:42:28 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfDM2-000Xl8-26
 for ath11k@lists.infradead.org; Tue, 26 Oct 2021 03:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635219746; x=1666755746;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tgjIXkcJNIgcCKFxZBM8JWNb2fyc5Xq+lQuSFXBsnmA=;
 b=tICUEALXfhzfcvr/yo3INTTmd6d/BsUly3h0YnejiEs5UenE2aCLVEFP
 lQ68seugNs0N5kBDf4oQbQ8vQ3mZI5qQJtOpb2QfvwpS+smsxvh2LE8KT
 WP1WhgzGvdnf/zitFHMQ2xRYCRy2ghkQu/3TWiikeyiyuv1AIiCPUnAzL c=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 25 Oct 2021 20:42:25 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 20:42:25 -0700
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Mon, 25 Oct 2021 20:42:23 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH] ath11k: calculate the correct NSS of peer for HE capabilities
Date: Mon, 25 Oct 2021 23:42:11 -0400
Message-ID: <20211026034211.27650-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_204226_162530_E6F47B68 
X-CRM114-Status: GOOD (  13.52  )
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
 drivers/net/wireless/ath/ath11k/mac.c | 40 +++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 2fc5a1b29d34..212c73fedec4 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -1458,13 +1458,49 @@ static void ath11k_peer_assoc_h_he(struct ath11k *ar,
 				   struct peer_assoc_params *arg)
 {
 	const struct ieee80211_sta_he_cap *he_cap = &sta->he_cap;
-	u8 ampdu_factor;
-	u16 v;
+	u8 ampdu_factor, max_nss, rx_mcs_80, rx_mcs_160;
+	u16 v, mcs_160_map, mcs_80_map;
+	int i;
+	bool support_160;
 
 	if (!he_cap->has_he)
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
 
 	memcpy(&arg->peer_he_cap_macinfo, he_cap->he_cap_elem.mac_cap_info,
 	       sizeof(arg->peer_he_cap_macinfo));
-- 
2.31.1


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
