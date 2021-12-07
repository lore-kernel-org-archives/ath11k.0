Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18CDC4332F
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 14:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a7wXF6wfZ4V9dT2qqbn7ZBNiYJhG8y966t5HEtwPq64=; b=HZ+DNU4obSnpDT
	g9VX9b4AOnW2naznO/ybWHNLnWanO9j/O8i2s9NZNUHDx5YEJKPGGybpPHHmFWp/BEEa/49BF694a
	r6XpM480tj6shjFziNag6YtPpGUlG24gtNIHegDlYc2q20wY17ER+LSyCxXYG/+NsqfvIQ4qB/xTa
	usS8p88NvxnDPEel8Wpdjfpk4KxvaJxK5FdB6GwXKcucOozJSCZEzzhnpXV53wcWbF0vFBE2DQaYg
	CLxYv++VxYsfrz37pieLL8N0qELcyULSMTrwYgPOE4f8TRwmFEjxNlvNmLh8gfcwxw1EejjvTLeIS
	dsDTWWxCUuDvSmglpJLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mubu8-0093J8-De; Tue, 07 Dec 2021 14:57:16 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mubUK-008waz-SY
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 14:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1638887433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=M/6VW7i7W+xthc4rrARhEy/BbZdY9QLtRROjfHQerbo=;
 b=UzoljNDWkgQnQwRzMb4XekfUMSiDgAsdMPdJhoqkHCuIkUdlVBnh/SqIbGLiNg8hBSNC9Y
 BL6JAUVjz6FgCYWG5guqnc4QvA9CdSuaaiVl/4WStufgvwPnxaSNgHMubcSDjkjsDb10U5
 HTORV6os2TbTUmEcrHvUZzHqk74QZ0Y=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Wen Gong <quic_wgong@quicinc.com>,
 Sven Eckelmann <sven@narfation.org>, stable@vger.kernel.org
Subject: [PATCH] ath11k: Fix buffer overflow when scanning with extraie
Date: Tue,  7 Dec 2021 15:29:13 +0100
Message-Id: <20211207142913.1734635-1-sven@narfation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_063037_151538_BDA6BAE6 
X-CRM114-Status: GOOD (  15.61  )
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

If cfg80211 is providing extraie's for a scanning process then ath11k will
copy that over to the firmware. The extraie.len is a 32 bit value in struct
element_info and describes the amount of bytes for the vendor information
elements.

The WMI_TLV packet is having a special WMI_TAG_ARRAY_BYTE section. This
section can have a (payload) length up to 65535 bytes because the
WMI_TLV_LEN can store up to 16 bits. The code was missing such a check and
could have created a scan request which cannot be parsed correctly by the
firmware.

But the bigger problem was the allocation of the buffer. It has to align
the TLV sections by 4 bytes. But the code was using an u8 to store the
newly calculated length of this section (with alignment). And the new
calculated length was then used to allocate the skbuff. But the actual code
to copy in the data is using the extraie.len and not the calculated
"aligned" length.

The length of extraie with IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS enabled
was 264 bytes during tests with a QCA Milan card. But it only allocated 8
bytes (264 bytes % 256) for it. As consequence, the code to memcpy the
extraie into the skb was then just overwriting data after skb->end. Things
like shinfo were therefore corrupted. This could usually be seen by a crash
in skb_zcopy_clear which tried to call a ubuf_info callback (using a bogus
address).

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-02892.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Cc: stable@vger.kernel.org
Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
 drivers/net/wireless/ath/ath11k/wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 6da16d095e37..d817ea468ab5 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -2115,7 +2115,7 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 	void *ptr;
 	int i, ret, len;
 	u32 *tmp_ptr;
-	u8 extraie_len_with_pad = 0;
+	u16 extraie_len_with_pad = 0;
 	struct hint_short_ssid *s_ssid = NULL;
 	struct hint_bssid *hint_bssid = NULL;
 
@@ -2134,7 +2134,7 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 		len += sizeof(*bssid) * params->num_bssid;
 
 	len += TLV_HDR_SIZE;
-	if (params->extraie.len)
+	if (params->extraie.len && params->extraie.len <= 0xFFFF)
 		extraie_len_with_pad =
 			roundup(params->extraie.len, sizeof(u32));
 	len += extraie_len_with_pad;
@@ -2241,7 +2241,7 @@ int ath11k_wmi_send_scan_start_cmd(struct ath11k *ar,
 		      FIELD_PREP(WMI_TLV_LEN, len);
 	ptr += TLV_HDR_SIZE;
 
-	if (params->extraie.len)
+	if (extraie_len_with_pad)
 		memcpy(ptr, params->extraie.ptr,
 		       params->extraie.len);
 
-- 
2.30.2


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
