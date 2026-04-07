Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D981FB5184
	for <ath11k@archiver.kernel.org>; Tue,  7 Apr 2026 02:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Os/4pn0L/ASajHM2IP5+TXjMdCaPJ2tuIwT9Dt1v7s0=; b=Mx3CTf9C8Z1P9xDZsgRZEzBZQx
	8GxDTwtf2gol3Fi0A9LQ3kqyULxFEKmROL3MqhyAbLJ8q20QBFpQCbUoCCrCIkDlmZ4LSmNRR8gn0
	AmSUoTC9penu78WvRKRgKa7pPxP/d8ZkRUAxPZIS3ekyWSYteSDxPb5yDSvYPGZwhRv3R+DDk2wIi
	ozFsRT0Qf5P2IzwRckgrEO1MjQZKMN5RIFZUW7/e990MaHunlSCOHouAuKUCLaPGPs8ruxArPOgoY
	YIO9oEPGjPGOFouJkWEKBLmpdY8vGY0eua9KJoRfBLI43d4ERe955vtDAxoef+5lFOal165FH1Rem
	7w+L4spA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9wUo-00000005ml9-1yo4;
	Tue, 07 Apr 2026 02:48:54 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9wUl-00000005mkl-2Y64
	for ath11k@lists.infradead.org;
	Tue, 07 Apr 2026 02:48:52 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-64e87a81639so4306009d50.0
        for <ath11k@lists.infradead.org>; Mon, 06 Apr 2026 19:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775530130; x=1776134930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Os/4pn0L/ASajHM2IP5+TXjMdCaPJ2tuIwT9Dt1v7s0=;
        b=e3yDQMJpAmWYKn4m9THUQBPUuQ1E3prQO9IIIcpavjTzlYsHIipJdAr9u6d7FIEnzA
         o+xE3bjkDq6JSBKn6LGSoUQWnsLL+0UD+kEowrDa+nhKJSG0OxkV053eZTkxkG6z2N//
         tfaLbwNc/kj72rdwM51mSIKAdTeOsYjrECWybnmCNOhD1jQ7jHn27v9ZMWw6aLTqFJ3I
         3Ec+rkVdDEFYXt87RRuE60tGjTJnqQvpzc6S1ShkOMs5OSC8bSvazIxGWODsNseAwUVi
         4ku4AopiQnbtrr4azK2xL0M3lw/F603j/qdVtRCcSeLhZ4yGYbDpOk+jItdK1WxMr4nK
         GHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775530130; x=1776134930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Os/4pn0L/ASajHM2IP5+TXjMdCaPJ2tuIwT9Dt1v7s0=;
        b=parTbQnooy26DbRfcGKEsvEyjIMuXp48kIcDiZ4VxBCYu77+iW3+ZMOeGTc258bDIX
         MG8W60M/g+8cduHDctB0rkWTgKBD/X2qfBb6eWN/qrtQzTvvbhqCdJqlPU7KVRltvWJQ
         vlt6avHzxKadkxI7mrcqwj2pOKhtXOGt3sFCpUpC6VDXZTA0/YYdp7fHDTB03ptMWZQz
         RkpDI5mq6YiMJP9RcRyy8AgTMKzNO9GuUIcte/sRs7CdNrZBxj/VrqRipsGX1SM34KIi
         e3JzndVfw4nbLj2iUvL0KKZlL6vKQ57wWLVxKdKK7mB8VPszrR6T8guWrlknCAZQbLWc
         92ug==
X-Gm-Message-State: AOJu0YxtXFpsCRX/FTF/w8KMJsCqi7HiAujfU/5VdQLO5IMVo5KG4wZ/
	FIg2KFtE532Iu8nVDWJhgKYWlZPxwW7z4PD/RafKeWmyeY2Ku6Au9eZ6
X-Gm-Gg: AeBDiesEerkciWoV3kWJbmRrzDKPGrL4tgy3DOaEGp0RnLddrjfsJ75fATv5Xs18ltf
	leQ0Uj4+3mSMk5v+JriM5Cy8TCDjVTMoXPPX64pc1wJHfy+AQIleBzVeCnY6L3daw8NLf1opVr/
	sfBEo6U19reUIHMyLfvAlVj8Hph7Ciba5jVun2FCHXnpFEUIlQyv4a46z2y9+G2oXlylK1wrJRi
	gvACWH8k+IoEGCjiEhJ/s9t08ItHEFh38jvUai0N5urgot++FlL2xvfiqNK6vDCJFU50Yul3MTx
	+gzUfhqEC9DA4/3VY/RLwF87zbDj5h4neZ06PuVDtNGd8zvYHB1G2JK1ElldPhZ3lcMtvYaUBMI
	ljJaMOyX7WCCp2DxKxdRiaIHgGD93NyyuFyYTibK5ZQqtI9Ug9xa0asABRiBdEHMuEk15R6SbXx
	aifSRGxI3Sc15uyUx06qDrlSn3GRrQ2HEpCCm30bbqZw6EOwehCF0rI75g791B
X-Received: by 2002:a05:690c:39b:b0:79c:c51c:7f41 with SMTP id 00721157ae682-7a4d556e135mr148205687b3.29.1775530129831;
        Mon, 06 Apr 2026 19:48:49 -0700 (PDT)
Received: from DEV.lan (c-75-74-152-49.hsd1.fl.comcast.net. [75.74.152.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36e42ff31sm61216267b3.6.2026.04.06.19.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 19:48:49 -0700 (PDT)
From: Joshua Klinesmith <joshuaklinesmith@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org,
	Joshua Klinesmith <joshuaklinesmith@gmail.com>
Subject: [PATCH wireless] wifi: ath11k: fix monitor mode frame length by using correct descriptor size
Date: Mon,  6 Apr 2026 22:48:36 -0400
Message-ID: <20260407024836.53871-1-joshuaklinesmith@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_194851_677394_4912638C 
X-CRM114-Status: GOOD (  13.06  )
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

The monitor mode RX path in ath11k_dp_rx_mon_mpdu_pop() and
ath11k_dp_rx_full_mon_mpdu_pop() uses sizeof(struct hal_rx_desc) to
compute the packet buffer offset. This is the size of the union of all
chip-specific descriptors (the maximum), not the actual descriptor size
for the running chip. The later ath11k_dp_rx_msdus_set_payload() then
strips only hw_params.hal_desc_sz bytes (the chip-specific size) from
the front of the skb.

On IPQ8074 and QCN9074, sizeof(struct hal_rx_desc) is 392 but
hal_desc_sz is 384, leaving 8 extra bytes of descriptor data at the
end of every monitor mode frame delivered to userspace. On WCN6855 the
sizes happen to match so the bug is not visible.

The same mismatch in ath11k_dp_mon_set_frag_len() causes incorrect
fragment length calculation for multi-buffer MSDUs, under-counting
intermediate fragments by 8 bytes and over-counting the last fragment.

Fix by using ar->ab->hw_params.hal_desc_sz consistently in both
monitor mpdu_pop functions and passing it through to set_frag_len.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Link: https://github.com/openwrt/openwrt/issues/16183
Signed-off-by: Joshua Klinesmith <joshuaklinesmith@gmail.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 27 ++++++++++++++-----------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 85defe11750d..c86ffc203f15 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -4511,10 +4511,11 @@ int ath11k_dp_rx_pdev_alloc(struct ath11k_base *ab, int mac_id)
 	return 0;
 }
 
-static void ath11k_dp_mon_set_frag_len(u32 *total_len, u32 *frag_len)
+static void ath11k_dp_mon_set_frag_len(u32 *total_len, u32 *frag_len,
+				       u32 hal_desc_sz)
 {
-	if (*total_len >= (DP_RX_BUFFER_SIZE - sizeof(struct hal_rx_desc))) {
-		*frag_len = DP_RX_BUFFER_SIZE - sizeof(struct hal_rx_desc);
+	if (*total_len >= (DP_RX_BUFFER_SIZE - hal_desc_sz)) {
+		*frag_len = DP_RX_BUFFER_SIZE - hal_desc_sz;
 		*total_len -= *frag_len;
 	} else {
 		*frag_len = *total_len;
@@ -4658,19 +4659,19 @@ static u32 ath11k_dp_rx_mon_comp_ppduid(u32 msdu_ppdu_id, u32 *ppdu_id,
 
 static void ath11k_dp_mon_get_buf_len(struct hal_rx_msdu_desc_info *info,
 				      bool *is_frag, u32 *total_len,
-				      u32 *frag_len, u32 *msdu_cnt)
+				      u32 *frag_len, u32 *msdu_cnt,
+				      u32 hal_desc_sz)
 {
 	if (info->msdu_flags & RX_MSDU_DESC_INFO0_MSDU_CONTINUATION) {
 		if (!*is_frag) {
 			*total_len = info->msdu_len;
 			*is_frag = true;
 		}
-		ath11k_dp_mon_set_frag_len(total_len,
-					   frag_len);
+		ath11k_dp_mon_set_frag_len(total_len, frag_len, hal_desc_sz);
 	} else {
 		if (*is_frag) {
-			ath11k_dp_mon_set_frag_len(total_len,
-						   frag_len);
+			ath11k_dp_mon_set_frag_len(total_len, frag_len,
+						   hal_desc_sz);
 		} else {
 			*frag_len = info->msdu_len;
 		}
@@ -4792,7 +4793,7 @@ u32 ath11k_dp_rx_mon_mpdu_pop(struct ath11k *ar, int mac_id,
 
 			rx_desc = (struct hal_rx_desc *)msdu->data;
 
-			rx_pkt_offset = sizeof(struct hal_rx_desc);
+			rx_pkt_offset = ar->ab->hw_params.hal_desc_sz;
 			l2_hdr_offset = ath11k_dp_rx_h_msdu_end_l3pad(ar->ab, rx_desc);
 
 			if (is_first_msdu) {
@@ -4823,7 +4824,8 @@ u32 ath11k_dp_rx_mon_mpdu_pop(struct ath11k *ar, int mac_id,
 			}
 			ath11k_dp_mon_get_buf_len(&msdu_list.msdu_info[i],
 						  &is_frag, &total_len,
-						  &frag_len, &msdu_cnt);
+						  &frag_len, &msdu_cnt,
+						  rx_pkt_offset);
 			rx_buf_size = rx_pkt_offset + l2_hdr_offset + frag_len;
 
 			ath11k_dp_pkt_set_pktlen(msdu, rx_buf_size);
@@ -5424,7 +5426,7 @@ ath11k_dp_rx_full_mon_mpdu_pop(struct ath11k *ar,
 
 			rx_desc = (struct hal_rx_desc *)msdu->data;
 
-			rx_pkt_offset = sizeof(struct hal_rx_desc);
+			rx_pkt_offset = ar->ab->hw_params.hal_desc_sz;
 			l2_hdr_offset = ath11k_dp_rx_h_msdu_end_l3pad(ar->ab, rx_desc);
 
 			if (is_first_msdu) {
@@ -5439,7 +5441,8 @@ ath11k_dp_rx_full_mon_mpdu_pop(struct ath11k *ar,
 
 			ath11k_dp_mon_get_buf_len(&msdu_list.msdu_info[i],
 						  &is_frag, &total_len,
-						  &frag_len, &msdu_cnt);
+						  &frag_len, &msdu_cnt,
+						  rx_pkt_offset);
 
 			rx_buf_size = rx_pkt_offset + l2_hdr_offset + frag_len;
 
-- 
2.43.0


