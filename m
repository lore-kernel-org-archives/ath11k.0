Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7824C606A33F
	for <ath11k@archiver.kernel.org>; Mon,  2 Nov 2026 05:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kE0P/ZP5;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XS2sL0cz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0ggQvw09iPL5Urt/5zaC/WmW/k5FcSA219ACP9yk0DA=; b=kE0P/ZP5I2+CjjSJF0BFOGlsUm
	sgYXiM/dTVbzHaDKBalrnmuxJYz4Za3RXH2F2sTOSnm/4gGxTVm/cjmGaiLErH7y8SyCDw5dNoPYS
	V23ViWDlsghCM7ZbEtv5OOnrU/fhr2ousFNfOMv5gDlovdrvdYFHWPa6IarmrH92LaeQg/fUKVd0s
	4FIlU3+cQw2OlTv87Pxi9YZD4GF893L71CoE9FMQmPMHtErJqz5YAHb1dAms4TEp/wKWUb9Tc788Z
	jKFLgZPpg+2Ykd495L8OYJJG7UuvOugiFnsoPpGexn0po+wHIwvTGQs88W6F0KbaBuJ4ein47/Ovz
	/n+LlaAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkN4-0000000FXyi-0Ta3;
	Mon, 02 Nov 2026 05:14:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNkN2-0000000FXx3-1MSR
	for ath11k@lists.infradead.org;
	Mon, 02 Nov 2026 05:14:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 39E876062B;
	Mon,  2 Nov 2026 05:14:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793596450;
	b=lDmRqVHFV0ccJNe0kYQZa/XEkWgUCYCHgIjh6Hk26SuaWsYXCf/ohACjeAXZXOpTffhl
	 djM4+nTZVpLjhvgjuf8d49BErwxVQ2jYmf52LZt5sza6yyjdh+az8R7D+TcaqgB4rrXl8
	 65YjQnhtkxjMFugA1uWsuS/mkmK14XwolBlY+sB13johKAGZ8+sgEUJ6SzgQFtoApxP9E
	 wCxZGj7+8LS12NSuitywBwtGhCMPh57TjflYukE/3IdjBMS7wrX/AyO+qhZ9Urog9nFP1
	 Vht5Up7XhApdSkRrKC97atf+b68s9zTsmiZ+yC4nIIo2HJ1q8MvhmmHnMtOXhMcfOSg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793596450;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=0ggQvw09iPL5Urt/5zaC/WmW/k5FcSA219ACP9yk0DA=;
	b=EeVYKCdBPnW1dGCEAOi9nDkDtJXWYUOz7u4z/2zj6nAsq48VBaCg68zQsfOedT/HET1R
	 H/mUac/Al8gXNx/I+SBft7B1UX5UTmRBh0P3LOW7USg/gIoQHFyb1ybEa+qGepMgSPKUB
	 lhJwmhqHTAWdeBRkSMRepntFuVefH+FZS06/AxDhUSyNG2nItBR5Qkg0mTheVjegkI5Ei
	 C3Av7aSZ6U2DkumqH94FnzqtewdtnOH8hCwBNGvQWIZbIDFsQIiiKyCiDnNhrhtbHw33E
	 WiECLPXZjnw2S02sIC9UHM6XlCqsJWQs+7rIVIVe1uNdUvqSGg+y77/u7o/yu8zcIRw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A7CA21F000C1;
	Mon,  2 Nov 2026 05:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793596450;
	bh=0ggQvw09iPL5Urt/5zaC/WmW/k5FcSA219ACP9yk0DA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XS2sL0czj+K/nYZvseHUeCsZNxT4InGz1XmcnaatY3U2eIKq8ZGv+gI5DUHErgN23
	 lQupHDpV2uqXlaYTzI6Nh++PoVHXvdLgrUh05GphrFfDfx1p3h51aos+YFtptd8g3y
	 Ulj3q6CrPczeBjpi+AaREte2Q/xIiJIt7kMYmKHo5BGLVkrCkloYUmAMtJya6zDapR
	 6uac2jQ+FXsY4/uEMiUQXzsPmH0qHjRmk3yl2QCXvDaE5OZgKzStKWNEajzLofVI6p
	 Zx5pWcLsSB8qNcO1xhBK5g52KZdDeSvYua7jkluryCEP0y1k+1MRqf6LTXsJklY7Vb
	 nmdv2igXU6a0A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 19BA84637E;
	Mon,  2 Nov 2026 05:14:09 +0000 (UTC)
From: Christopher Griffin via B4 Relay <devnull+christophergriffin05.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 23:14:09 -0600
Subject: [PATCH ath-next 1/3] wifi: ath11k: size monitor MPDUs by the
 chip's rx descriptor
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261101-b8-monitor-frames-v1-1-f0a43d9630e5@gmail.com>
References: <20261101-b8-monitor-frames-v1-0-f0a43d9630e5@gmail.com>
In-Reply-To: <20261101-b8-monitor-frames-v1-0-f0a43d9630e5@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>, 
 Jouni Malinen <quic_jouni@quicinc.com>, Kalle Valo <kvalo@kernel.org>, 
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
 Julia Lawall <julia.lawall@lip6.fr>, kbuild test robot <lkp@intel.com>, 
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>, 
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>, 
 Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>, 
 Anilkumar Kolli <quic_akolli@quicinc.com>, Miles Hu <milehu@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Govindaraj Saminathan <quic_gsamin@quicinc.com>, 
 Sriram R <sriram.ramachandran@oss.qualcomm.com>, 
 Shashidhar Lakkavalli <slakkavalli@datto.com>, 
 Rajkumar Manoharan <rmanohar@codeaurora.org>, 
 Christopher Griffin <christophergriffin05@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793596448; l=4542;
 i=christophergriffin05@gmail.com; s=20261024; h=from:subject:message-id;
 bh=A4A9iBgn+H+lp5REIyv/F4O/tf6R5XCCM4Z11kdHy5w=;
 b=AavwHSr+3kshmLM+ZxJ3/rk3ost96GccyiyjZevVa+7h4ZAXMRVU4XiKgJYwiN4tT4O2bP3qT
 lEwPl9Jdrt5DGPCMGUeGzlyNEAF1VvTZ8f2WJiwDLnqJvD2Zve3Ss8U
X-Developer-Key: i=christophergriffin05@gmail.com; a=ed25519;
 pk=oa9tkTNpiGoFWdGvpDHXLSobApmsh9BfrJRJrRJAvWA=
X-Endpoint-Received: by B4 Relay for
 christophergriffin05@gmail.com/20261024 with auth_id=1309
X-Original-From: Christopher Griffin <christophergriffin05@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: christophergriffin05@gmail.com
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christopher Griffin <christophergriffin05@gmail.com>

The monitor destination ring path sets each buffer's length from
sizeof(struct hal_rx_desc), but pulls the chip's own descriptor,
hw_params.hal_desc_sz, off its front. struct hal_rx_desc is the union
of the descriptors of all supported chips; it is 392 bytes, WCN6855's
size. IPQ8074, IPQ6018 and QCN9074 use a 384-byte descriptor, so on
them every MPDU a monitor interface gets ends with 8 bytes the hardware
did not write. After the RAW path trims the FCS, a frame still carries
its FCS plus 4 stale bytes, and the radiotap header flags neither.
Wireshark shows such management frames as malformed.

ath11k_dp_mon_set_frag_len() uses the same size for the payload of a
continuation buffer, so the last buffer of a long MPDU is another
8 bytes too long for each buffer before it.

Use hal_desc_sz in both places, as the rest of the rx path does.

Seen on an Arista C-360 (IPQ8074 plus QCN9074): a monitor capture of a
management frame had the FCS and 4 more bytes after the body.

Fixes: e4073430ee1d ("ath11k: add dp support for WCN6855")
Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.r4-00683-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 31faeda461acf..4e0b717b6f06d 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -4524,10 +4524,13 @@ int ath11k_dp_rx_pdev_alloc(struct ath11k_base *ab, int mac_id)
 	return 0;
 }
 
-static void ath11k_dp_mon_set_frag_len(u32 *total_len, u32 *frag_len)
+static void ath11k_dp_mon_set_frag_len(struct ath11k_base *ab,
+				       u32 *total_len, u32 *frag_len)
 {
-	if (*total_len >= (DP_RX_BUFFER_SIZE - sizeof(struct hal_rx_desc))) {
-		*frag_len = DP_RX_BUFFER_SIZE - sizeof(struct hal_rx_desc);
+	u32 hal_rx_desc_sz = ab->hw_params.hal_desc_sz;
+
+	if (*total_len >= (DP_RX_BUFFER_SIZE - hal_rx_desc_sz)) {
+		*frag_len = DP_RX_BUFFER_SIZE - hal_rx_desc_sz;
 		*total_len -= *frag_len;
 	} else {
 		*frag_len = *total_len;
@@ -4675,7 +4678,8 @@ static bool ath11k_dp_rx_mon_comp_ppduid(u32 msdu_ppdu_id, u32 *ppdu_id,
 	return false;
 }
 
-static void ath11k_dp_mon_get_buf_len(struct hal_rx_msdu_desc_info *info,
+static void ath11k_dp_mon_get_buf_len(struct ath11k_base *ab,
+				      struct hal_rx_msdu_desc_info *info,
 				      bool *is_frag, u32 *total_len,
 				      u32 *frag_len, u32 *msdu_cnt)
 {
@@ -4684,11 +4688,11 @@ static void ath11k_dp_mon_get_buf_len(struct hal_rx_msdu_desc_info *info,
 			*total_len = info->msdu_len;
 			*is_frag = true;
 		}
-		ath11k_dp_mon_set_frag_len(total_len,
+		ath11k_dp_mon_set_frag_len(ab, total_len,
 					   frag_len);
 	} else {
 		if (*is_frag) {
-			ath11k_dp_mon_set_frag_len(total_len,
+			ath11k_dp_mon_set_frag_len(ab, total_len,
 						   frag_len);
 		} else {
 			*frag_len = info->msdu_len;
@@ -4826,7 +4830,7 @@ u32 ath11k_dp_rx_mon_mpdu_pop(struct ath11k *ar, int mac_id,
 
 			rx_desc = (struct hal_rx_desc *)msdu->data;
 
-			rx_pkt_offset = sizeof(struct hal_rx_desc);
+			rx_pkt_offset = ar->ab->hw_params.hal_desc_sz;
 			l2_hdr_offset = ath11k_dp_rx_h_msdu_end_l3pad(ar->ab, rx_desc);
 
 			if (is_first_msdu) {
@@ -4855,7 +4859,8 @@ u32 ath11k_dp_rx_mon_mpdu_pop(struct ath11k *ar, int mac_id,
 				pmon->mon_last_linkdesc_paddr = paddr;
 				is_first_msdu = false;
 			}
-			ath11k_dp_mon_get_buf_len(&msdu_list.msdu_info[i],
+			ath11k_dp_mon_get_buf_len(ar->ab,
+						  &msdu_list.msdu_info[i],
 						  &is_frag, &total_len,
 						  &frag_len, &msdu_cnt);
 			rx_buf_size = rx_pkt_offset + l2_hdr_offset + frag_len;
@@ -5458,7 +5463,7 @@ ath11k_dp_rx_full_mon_mpdu_pop(struct ath11k *ar,
 
 			rx_desc = (struct hal_rx_desc *)msdu->data;
 
-			rx_pkt_offset = sizeof(struct hal_rx_desc);
+			rx_pkt_offset = ar->ab->hw_params.hal_desc_sz;
 			l2_hdr_offset = ath11k_dp_rx_h_msdu_end_l3pad(ar->ab, rx_desc);
 
 			if (is_first_msdu) {
@@ -5471,7 +5476,8 @@ ath11k_dp_rx_full_mon_mpdu_pop(struct ath11k *ar,
 				is_first_msdu = false;
 			}
 
-			ath11k_dp_mon_get_buf_len(&msdu_list.msdu_info[i],
+			ath11k_dp_mon_get_buf_len(ar->ab,
+						  &msdu_list.msdu_info[i],
 						  &is_frag, &total_len,
 						  &frag_len, &msdu_cnt);
 

-- 
2.43.0



