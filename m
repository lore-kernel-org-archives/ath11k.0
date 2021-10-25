Return-Path: <SRS0=kw9f=PN=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7555FC433EF
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 12:16:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 406BF60FDA
	for <ath11k@archiver.kernel.org>; Mon, 25 Oct 2021 12:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 406BF60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sm+TQiVHAHP0yTlrBPit0xxxC6K5tkG9K1bwNhY4/Zk=; b=KNrkMR11RG/gsO
	+AxHyWwmxSUTk8uMfM/Ba4gYYRTAKL1RtoImQjQNBtUhPOZrFy4IpFFeOmj8PihSNBapTnmj7DE7L
	UJVQ3HHiPytQ1nC5DwdsI/xyPlfuopYi2vLIEPtsKZaEaT9mRL0gE1UgJhwheo303ybOQEYEAHk4S
	A6VTJiL8D9IFLbNDVDofjar3DboL70Cd/83LY/2a+QyUODDWehQY6sjGXbUB0XZZT21h1oo9Dq6Ny
	9bkYyCCn2PBtOUfenlMJQ/QH2lZ/94rta0kN7RaI08LfJ2gH/byEx5HceUuaZZl94bP7pJG/cQUUD
	/abXG1J0mEcrsGxVAl6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meytm-00GNrF-LO; Mon, 25 Oct 2021 12:16:18 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meytj-00GNqU-Ss
 for ath11k@lists.infradead.org; Mon, 25 Oct 2021 12:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1635164176; x=1666700176;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=fNkXmNG4QtVHw0/e61QNdNqge1zf/SQk2d174RRSZqA=;
 b=gQ99NjJWsPZVWxa5QKMSl3aAPOsIH9IPqrGJFh+FsOGhSXkUp6JsfQVw
 6KoPlrxV/blUDkIDir4JuMlxZRZo1G1HxpGPQV1/bpSIjZoPIk9o92IBF
 vej09Ty0Y0GYIBJF+GxmiOYGDS4Zy3yYD5q1ow4hPdk+aro1w64VATMPe g=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 25 Oct 2021 05:16:14 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 05:16:14 -0700
Received: from ppranees-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; 
 Mon, 25 Oct 2021 05:16:11 -0700
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH] ath11k: fix FCS_ERR flag in radio tap header
Date: Mon, 25 Oct 2021 17:44:20 +0530
Message-ID: <1635164060-18423-1-git-send-email-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_051616_024151_36BA33C3 
X-CRM114-Status: GOOD (  11.37  )
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

In radio tap header, BAD FCS flag is not updated properly because
driver failed to update FCS_ERR flag in monitor mode.

In rx_desc, FCS_ERR information is available in rx_attention
structure and presence of this field indicates corresponding frame
failed FCS check.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01695-QCAHKSWPL_SILICONZ-1

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 1232bbe..63b1e87 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -4825,7 +4825,7 @@ static struct sk_buff *
 ath11k_dp_rx_mon_merg_msdus(struct ath11k *ar,
 			    u32 mac_id, struct sk_buff *head_msdu,
 			    struct sk_buff *last_msdu,
-			    struct ieee80211_rx_status *rxs)
+			    struct ieee80211_rx_status *rxs, bool *fcs_err)
 {
 	struct ath11k_base *ab = ar->ab;
 	struct sk_buff *msdu, *prev_buf;
@@ -4835,12 +4835,17 @@ ath11k_dp_rx_mon_merg_msdus(struct ath11k *ar,
 	u8 *dest, decap_format;
 	struct ieee80211_hdr_3addr *wh;
 	struct rx_attention *rx_attention;
+	u32 err_bitmap;
 
 	if (!head_msdu)
 		goto err_merge_fail;
 
 	rx_desc = (struct hal_rx_desc *)head_msdu->data;
 	rx_attention = ath11k_dp_rx_get_attention(ab, rx_desc);
+	err_bitmap = ath11k_dp_rx_h_attn_mpdu_err(rx_attention);
+
+	if (err_bitmap & DP_RX_MPDU_ERR_FCS)
+		*fcs_err = true;
 
 	if (ath11k_dp_rxdesc_get_mpdulen_err(rx_attention))
 		return NULL;
@@ -4929,9 +4934,10 @@ static int ath11k_dp_rx_mon_deliver(struct ath11k *ar, u32 mac_id,
 	struct ath11k_pdev_dp *dp = &ar->dp;
 	struct sk_buff *mon_skb, *skb_next, *header;
 	struct ieee80211_rx_status *rxs = &dp->rx_status;
+	bool fcs_err = false;
 
 	mon_skb = ath11k_dp_rx_mon_merg_msdus(ar, mac_id, head_msdu,
-					      tail_msdu, rxs);
+					      tail_msdu, rxs, &fcs_err);
 
 	if (!mon_skb)
 		goto mon_deliver_fail;
@@ -4939,6 +4945,10 @@ static int ath11k_dp_rx_mon_deliver(struct ath11k *ar, u32 mac_id,
 	header = mon_skb;
 
 	rxs->flag = 0;
+
+	if (fcs_err)
+		rxs->flag = RX_FLAG_FAILED_FCS_CRC;
+
 	do {
 		skb_next = mon_skb->next;
 		if (!skb_next)
-- 
2.7.4


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
