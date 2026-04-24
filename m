Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462DAFE51F3
	for <ath11k@archiver.kernel.org>; Fri, 24 Apr 2026 09:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mMo0bm/KHf9B+Wgcz67cJXTPtP310kPIOtQb4AW44qY=; b=JUuXCP9b1Hf5hGCxU+qaXe4qAv
	oz4Vpuy6Rh7YLgYhYyqbGn5eVW2EQUf98ud8ic+B6vnkjyZFAIk3bXj0MR0Ojn1WiZLofr7oIt2gW
	+U0ecyNlvlu7L/cRwMEi9NE46OAgfMSU4sRffx0BWzxPW2vSDsPwwDU1MXUnXBykgn71fksIPDtVB
	qBQdW12c829SF2H3SFOzHwwtT9tL2uEJSMiZ5/AOXgPgmXdH63yh4TPfmvEAgE0iunQU/5Ue3kbRR
	BsFNXm68E3X1rei9vvv0M0gtmqSrkQVZ7hP48E0hF0d8O/0GCv1NWUSL0QEnAU8tgz/1DZGV31mRs
	bpsJ9qig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDBm-0000000CxZc-13zR;
	Fri, 24 Apr 2026 09:51:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDBj-0000000CxZC-1OdJ
	for ath11k@lists.infradead.org;
	Fri, 24 Apr 2026 09:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777024262;
	bh=EK10yGwkXVQnZj51E7ttz818C88LRbsuydqLz2WzW7E=;
	h=From:Date:Subject:To:Cc:From;
	b=kveuvuCzBee3QivjhV4pxyXkhdCXE/uMSmzTYDnXm1Okw0XpA7Rw0eRuJRm0BHbJt
	 waNMq53DXKOv07GkSHHvb/Y+CSjJ303VMFfViyGEX1neYY+JrqpP8rSDnpE57hTfTV
	 GIT8wJtuUT+J5qI56X0S/Z6STIEQpTLbVZRPiJUrLtaT6T91YLWht+zn9zaQb3pGkd
	 1Rekms+ZEPrfgPr9YfODxcJNPGxRZo2Uf7Uiy+FNPwVzMUOKVU4Sg8AFGmJmZDUcVr
	 zW6wR7gFHAuyLVkD+0RIC6WPejzUb862/wsueuXLwZWEI0JhlRevhoxUdcDpXDIBti
	 3MO5NUbTu/HUA==
Received: from goku.local (unknown [100.64.0.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mattl)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8928F17E13B2;
	Fri, 24 Apr 2026 11:51:02 +0200 (CEST)
From: Matthew Leach <matthew.leach@collabora.com>
Date: Fri, 24 Apr 2026 10:50:35 +0100
Subject: [PATCH v4] wifi: ath11k: fix peer resolution on rx path when
 peer_id=0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-ath11k-null-peerid-workaround-v4-1-252b224d3cf6@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OTW7CMBAF4KsgrzHyjJ0QWPUeFYvxTxpDiCM7C
 a1Q7o4DCyq1Eiyf9OZ7c2XJRe8S26+uLLrJJx+6HNR6xUxD3Zfj3ubMUGApJJachgbgxLuxbXn
 v8rHllxBPFMPYWV5iQYC7bQUaWDb66Gr/ffc/D4+cRn10ZljQpdH4NIT4c39ggqX37tYEHLgwW
 NtC5pO6+jChbUmHSBsTzmzZm/ApKiheiZhFJE1Oak0Gyv9E+VvcvhJlFq1QUiBWSlV/xHmeb7L
 xdM2EAQAA
X-Change-ID: 20260326-ath11k-null-peerid-workaround-625a129781b1
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Matthew Leach <matthew.leach@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_025107_588943_C74A5763 
X-CRM114-Status: GOOD (  14.24  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

It has been observed that on certain chipsets a peer can be assigned
peer_id=0. For reception of non-aggregated MPDUs this is fine as
ath11k_dp_rx_h_find_peer() has a fallback case where it locates the peer
based upon the source MAC address. On an aggregated link, the mpdu_start
header is only populated by hardware on the first sub-MSDU. This causes
the peer resolution to be skipped for the subsequent MSDUs and the
encryption type of these frames to be set to an incorrect value,
resulting in these MSDUs being dropped by ieee80211.

ath11k_pci 0000:03:00.0: data rx skb 000000002f4b704d len 1534 peer xx:xx:xx:xx:xx:xx 0 ucast sn 3063 he160 rate_idx 9 vht_nss 2 freq 5240 band 1 flag 0x40d1a fcs-err 0 mic-err 0 amsdu-more 0 peer_id 0 first_msdu 1 last_msdu 0
ath11k_pci 0000:03:00.0: data rx skb 0000000038acd580 len 1534 peer (null) 0 ucast sn 3063 he160 rate_idx 9 vht_nss 2 freq 5240 band 1 flag 0x40d00 fcs-err 0 mic-err 0 amsdu-more 0 peer_id 0 first_msdu 0 last_msdu 1

Remove the null peer_id checks in ath11k_dp_rx_h_find_peer() and
ath11k_hal_rx_parse_mon_status_tlv(), allowing peers with an assigned ID
of 0 to be resolved.

Fixes: 2167fa606c0f ("ath11k: Add support for RX decapsulation offload")
Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.9
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Signed-off-by: Matthew Leach <matthew.leach@collabora.com>
---
Changes in v4:
- Prefix subsystem with 'wifi:'.
- Added the 'Tested-by' and 'Fixes' trailers.
- Link to v3: https://patch.msgid.link/20260417-ath11k-null-peerid-workaround-v3-1-d04302284486@collabora.com

Changes in v3:
- Clarified that the mpdu_start header isn't populated by the h/w for
  all sub-MSDUs in the commit message.
- Fix second null-peer check in ath11k_hal_rx_parse_mon_status_tlv().
- Link to v2: https://patch.msgid.link/20260415-ath11k-null-peerid-workaround-v2-1-2abae3bbac16@collabora.com

Changes in v2:

- Since peer_id=0 is a valid condition on some chips, remove the guard
  that prevented the peer lookup.
- Link to v1: https://patch.msgid.link/20260326-ath11k-null-peerid-workaround-v1-1-0c2fd53202f8@collabora.com

To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/net/wireless/ath/ath11k/dp_rx.c  | 3 +--
 drivers/net/wireless/ath/ath11k/hal_rx.c | 5 +----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 49d959b2e148..ff2c78a4e5f3 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2215,8 +2215,7 @@ ath11k_dp_rx_h_find_peer(struct ath11k_base *ab, struct sk_buff *msdu)
 
 	lockdep_assert_held(&ab->base_lock);
 
-	if (rxcb->peer_id)
-		peer = ath11k_peer_find_by_id(ab, rxcb->peer_id);
+	peer = ath11k_peer_find_by_id(ab, rxcb->peer_id);
 
 	if (peer)
 		return peer;
diff --git a/drivers/net/wireless/ath/ath11k/hal_rx.c b/drivers/net/wireless/ath/ath11k/hal_rx.c
index 753bd93f0212..51e0840bc0d1 100644
--- a/drivers/net/wireless/ath/ath11k/hal_rx.c
+++ b/drivers/net/wireless/ath/ath11k/hal_rx.c
@@ -1467,11 +1467,8 @@ ath11k_hal_rx_parse_mon_status_tlv(struct ath11k_base *ab,
 	case HAL_RX_MPDU_START: {
 		struct hal_rx_mpdu_info *mpdu_info =
 				(struct hal_rx_mpdu_info *)tlv_data;
-		u16 peer_id;
 
-		peer_id = ath11k_hal_rx_mpduinfo_get_peerid(ab, mpdu_info);
-		if (peer_id)
-			ppdu_info->peer_id = peer_id;
+		ppdu_info->peer_id = ath11k_hal_rx_mpduinfo_get_peerid(ab, mpdu_info);
 		break;
 	}
 	case HAL_RXPCU_PPDU_END_INFO: {

---
base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
change-id: 20260326-ath11k-null-peerid-workaround-625a129781b1

Best regards,
--  
Matt


