Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9FF606B52C
	for <ath11k@archiver.kernel.org>; Mon, 23 Nov 2026 13:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xkiHG3xc;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=o5hbmeX6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yu7J9cI4J6eMRXfImtI0cKipkxIOsOHsH3WCb0gS3hM=; b=xkiHG3xcSL6qMF
	lJ3G7g2TZf5vZDB3LMQcL+WbeUOiZ0EKLC0f7qMEuIdBSv7wTrMTqR17nsPJ1s5GM+PMJO2Cxj6by
	cBLoRggPcFlhgCAXB46pCm15zjKmQV6E2uotCTORyao0EXzxCfh1a68NQRtlF7m0fDG1CYDPOawWU
	MiCVRy++C0xz2ZK/jwVKNw8w2V+xMRW4TYBsEOUID8REmBX1F34HElemtOGJ5+3aIJECvm2qFBiyo
	WNjhl7kS0u00BZ9YpppBS6bcGGVKN7yUa49NKJewJEgtwZz0lOLLAuYoBOHD3bjcdmZ5qwCnyDorz
	X9Ztzm2NWJ0IauBqQVdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUIl-00000003bwg-2kix;
	Mon, 23 Nov 2026 13:41:48 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVUIi-00000003brB-3CwG
	for ath11k@lists.infradead.org;
	Mon, 23 Nov 2026 13:41:46 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so4419480a12.3
        for <ath11k@lists.infradead.org>; Mon, 23 Nov 2026 05:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441303; x=1796046103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yu7J9cI4J6eMRXfImtI0cKipkxIOsOHsH3WCb0gS3hM=;
        b=o5hbmeX68M+Gs+1AMHkJTrpuPD53bxbCg/jzp/PzwbOLBcPJ2wHf3D68JvbQdr0y02
         6/8aY7t+uAtTrtf1GbPvgLYEI+tHFKqvtUCY5dEVmHt2IplCEsPgJHRwxWKwDSdaGyvi
         i1uI822rMXDj5qXaRs9dktud3j3wCegWfOy3EPQPqyOrdXUK3cA4sjqa9JgpvRLXPBph
         oJ/HeWbd+pAV4GDrSpNokhPWyH/H0O4Sdg/bLxySbyGKVFCngO9Gah9EhqTUMPHtKtC1
         bFWBkK4coYxugpjXceS+eXpZiAOEuABTPZVvuThGr8rqYBdfeJuzYqqLo/Doko6L6Gr/
         DWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441303; x=1796046103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yu7J9cI4J6eMRXfImtI0cKipkxIOsOHsH3WCb0gS3hM=;
        b=vXP4TutZMh+54mGmczxeqK+e69uBJFlzY3iekwnMncd3zGZM+VHqrkss4KI4WJTZCw
         c6ZkKiPwYH/7YaGDSZPQYu9yG8G+qXQ6mr3rPheWSGRHC8Q8BiWaIS9N0NH6YO8FzmWa
         brnav3GTD4wsQ++UQ8/PGVvhHFCZwkh7BR0MrzX6oh6CK4D77xXZxsHnBkHI2LRHXaU0
         iZEbca6ZWHzpEN8P50OvjnajSgkiRVWsze8DHSbDv9BsD5Wc9TWGfEhCixXB9+NR25mL
         oChlp6aGADrCfBccRQDwz74euApINbnD2+s5JDTNcRipAKdxT2B4mpMY16MdmF/aw6fa
         zhrw==
X-Gm-Message-State: APuU4Z8Lduz7y2IjLyXJrSPAYTHJ3dxJ8InP9FnTz8j4D0/ImJhHFCDI
	PDMd2StK5MQZ9EQ/4UMV3fxokmwQ1EUBj4Hwq8tBigDKMbvLbVh8FczQXsmcxbvQrA==
X-Gm-Gg: AZFdTZei0RPMLEcjZZZFhzWE9XU7Bkg3S+O2L2Zg0hIoCeyDUo3v6/T4WtY5hDVhvJp
	fIKe3HpEfJvd6mUx2FpN5z7wGZhY7TWg2J+ZqK1rYdiRDxIU3904AkhVLNEx4WhMcjAjjU7QAZl
	9/Q+rLYiR8Zz/0U0+C4N0Z/cEW1cBhGzh3sBLa6fjK//m1LPB3lJo29LhU6QwABgRNXh4L4Y3oN
	d1k4kHpQV50A2LatN9ymYpUCrdylOirM2orV8yeYcE1ejiKEmbKsg1ekyEGxmcFs0Nn14XGOTEm
	OoxfZ24zuHz4OopqovIrygqNjtkquFBywRSk6cxhXkeVqsIJqzHl1rAKagUgJTDdMfk6RFsnxLX
	ivwTAv8Qyd5ecI/72/82kz46bnDPfqxXKPkt9LHua5GdsYl28bZb3twje/JZFA2dUMcpgZt/jZi
	ga5/mW9OqsA8IVL4MeVaH+GU0dJf6Pzz1SO+sKO7F3XCz1COhuzMQxMPfrqCaLH/l75boNNSSY3
	iuHk5gJfAwyowOtHyMEQ7nQkvHkl3HZNkKsmXRjZ6Zh8f1a249sEiofgJ45VBkEBDqSeqGZoAv/
	yFWjahUEfR8DL1WIaROOTNYILZPQ/3r4AylK+wczgqiMIZdpDA6d1rYit7zWHNNgy/Wh4UFG9hv
	2hMUs5gefu6OZ83YoYrKQ8AEm0Z0qO9NHzFbVsfTVdiqid/IgNA/UTNWHfSmvd5w25/7r5t1tWW
	BaLQmSRK0M4dsM3wy5oMW8KshRk02VGXld2Rj6fXX8lYlaLapI9kmkMwfk8Gw3wV3O/R2zbLG4J
	3HES/BC09R2qY4d5kONA6v6+dPORauJU/Oi+4xHSE4NttMhC9n/NZTarnKOyCRKY6dqDhYU2Rgv
	2tOU4MKU5NUQq0vWsocJDvav0PsgnjuxUS+1QNlAD039kedfLjeo5oWDyLe3n9nam32QoUIuhg=
	=
X-Received: by 2002:a05:6402:1f4d:b0:6ba:3f4e:79d8 with SMTP id 4fb4d7f45d1cf-6ba3f4e7a62mr7747627a12.36.1795441302373;
        Mon, 23 Nov 2026 05:41:42 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fbf0esm5339576a12.23.2026.11.23.05.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:41:41 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Praneesh P <praneesh.p@oss.qualcomm.com>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Mark Ruvald Pedersen <wabsie@gmail.com>,
	Rosen Penev <rosenp@gmail.com>
Subject: [PATCH ath-next v1 04/10] wifi: ath11k: set the skb hash of a received frame from the hardware
Date: Mon, 23 Nov 2026 14:41:31 +0100
Message-ID: <20261123134137.718575-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123134137.718575-1-julius@bairaktaris.de>
References: <20261123134137.718575-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_054144_923340_FC432C2E 
X-CRM114-Status: GOOD (  15.45  )
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mac80211 picks the TXQ flow of a frame by skb_get_hash() in
fq_flow_idx(), and RPS and the queueing disciplines on the output device
do the same. ath11k never sets the hash, so every received frame that is
forwarded or steered is dissected again, though the receive engine has
already hashed its 5-tuple (flow_id_toeplitz in the MSDU start TLV, with
the seed ath11k_wmi_pdev_lro_cfg() sets at random).

Use that hash as an L4 hash for a frame whose descriptor says it is TCP
or UDP, not an IP fragment, and with the fixed IP header and the TCP/UDP
header parsed. A zero hash is not used. A boot random value is mixed into
it, so that it is not a function of the packet alone and a station
cannot choose the flow queue that a flow of another station shares.

The field is at the same place in the MSDU start TLV of every chip
family; read it, and the word with the flags, through two new hw_ops.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 36 +++++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.c    | 22 +++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h    |  1 +
 3 files changed, 59 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index b3b8afb82a78..b027b76ea3f3 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -6,7 +6,9 @@
 
 #include <linux/fips.h>
 #include <linux/ieee80211.h>
+#include <linux/jhash.h>
 #include <linux/kernel.h>
+#include <linux/net.h>
 #include <linux/skbuff.h>
 #include <net/page_pool/helpers.h>
 #include "core.h"
@@ -2057,6 +2059,39 @@ static void ath11k_dp_rx_h_csum_offload(struct ath11k *ar, struct sk_buff *msdu)
 	msdu->ip_summed = CHECKSUM_UNNECESSARY;
 }
 
+static u32 ath11k_rx_hash_seed __read_mostly;
+
+/*
+ * The receive engine hashes the 5-tuple of a TCP or UDP frame whose IP and L4
+ * headers it parsed. mac80211's queue selection and the queueing disciplines
+ * would otherwise dissect the frame again for the same hash.
+ */
+static void ath11k_dp_rx_h_hash(struct ath11k *ar, struct sk_buff *msdu)
+{
+	const struct ath11k_hw_ops *ops = ar->ab->hw_params.hw_ops;
+	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
+	u32 info2, hash;
+
+	info2 = ops->rx_desc_get_msdu_start_info2(rxcb->rx_desc);
+	if (!(info2 & (RX_MSDU_START_INFO2_TCP | RX_MSDU_START_INFO2_UDP)) ||
+	    (info2 & RX_MSDU_START_INFO2_IP_FRAG) ||
+	    !(info2 & RX_MSDU_START_INFO2_IP_FIXED_HDR_VALID) ||
+	    !(info2 & RX_MSDU_START_INFO2_IP_TCP_UDP_HDR_VALID))
+		return;
+
+	hash = ops->rx_desc_get_flow_id_toeplitz(rxcb->rx_desc);
+	if (!hash)
+		return;
+
+	/*
+	 * Make the hash differ per boot, so that a station cannot aim
+	 * collisions at the queues of the others.
+	 */
+	net_get_random_once(&ath11k_rx_hash_seed, sizeof(ath11k_rx_hash_seed));
+	skb_set_hash(msdu, jhash_1word(hash, ath11k_rx_hash_seed),
+		     PKT_HASH_TYPE_L4);
+}
+
 int ath11k_dp_rx_crypto_mic_len(struct ath11k *ar, enum hal_encrypt_type enctype)
 {
 	switch (enctype) {
@@ -2524,6 +2559,7 @@ static int ath11k_dp_rx_h_mpdu(struct ath11k *ar,
 	}
 
 	ath11k_dp_rx_h_csum_offload(ar, msdu);
+	ath11k_dp_rx_h_hash(ar, msdu);
 	ath11k_dp_rx_h_undecap(ar, msdu, rx_desc,
 			       enctype, rx_status, is_decrypted);
 
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 096366b85849..40a9fae52e84 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -283,6 +283,11 @@ static u8 ath11k_hw_ipq8074_rx_desc_get_mesh_ctl(struct hal_rx_desc *desc)
 			 __le32_to_cpu(desc->u.ipq8074.msdu_start.info2));
 }
 
+static u32 ath11k_hw_ipq8074_rx_desc_get_flow_id_toeplitz(struct hal_rx_desc *desc)
+{
+	return __le32_to_cpu(desc->u.ipq8074.msdu_start.flow_id_toeplitz);
+}
+
 static bool ath11k_hw_ipq8074_rx_desc_get_ldpc_support(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MSDU_START_INFO2_LDPC,
@@ -465,6 +470,11 @@ static u8 ath11k_hw_qcn9074_rx_desc_get_mesh_ctl(struct hal_rx_desc *desc)
 			 __le32_to_cpu(desc->u.qcn9074.msdu_start.info2));
 }
 
+static u32 ath11k_hw_qcn9074_rx_desc_get_flow_id_toeplitz(struct hal_rx_desc *desc)
+{
+	return __le32_to_cpu(desc->u.qcn9074.msdu_start.flow_id_toeplitz);
+}
+
 static bool ath11k_hw_qcn9074_rx_desc_get_ldpc_support(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MSDU_START_INFO2_LDPC,
@@ -647,6 +657,11 @@ static u8 ath11k_hw_wcn6855_rx_desc_get_mesh_ctl(struct hal_rx_desc *desc)
 			 __le32_to_cpu(desc->u.wcn6855.msdu_start.info2));
 }
 
+static u32 ath11k_hw_wcn6855_rx_desc_get_flow_id_toeplitz(struct hal_rx_desc *desc)
+{
+	return __le32_to_cpu(desc->u.wcn6855.msdu_start.flow_id_toeplitz);
+}
+
 static bool ath11k_hw_wcn6855_rx_desc_get_mpdu_seq_ctl_vld(struct hal_rx_desc *desc)
 {
 	return !!FIELD_GET(RX_MPDU_START_INFO1_MPDU_SEQ_CTRL_VALID,
@@ -930,6 +945,7 @@ const struct ath11k_hw_ops ipq8074_ops = {
 	.rx_desc_get_decap_type = ath11k_hw_ipq8074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_ipq8074_rx_desc_get_mesh_ctl,
 	.rx_desc_get_msdu_start_info2 = ath11k_hw_ipq8074_rx_desc_get_msdu_start_info2,
+	.rx_desc_get_flow_id_toeplitz = ath11k_hw_ipq8074_rx_desc_get_flow_id_toeplitz,
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
@@ -971,6 +987,7 @@ const struct ath11k_hw_ops ipq6018_ops = {
 	.rx_desc_get_decap_type = ath11k_hw_ipq8074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_ipq8074_rx_desc_get_mesh_ctl,
 	.rx_desc_get_msdu_start_info2 = ath11k_hw_ipq8074_rx_desc_get_msdu_start_info2,
+	.rx_desc_get_flow_id_toeplitz = ath11k_hw_ipq8074_rx_desc_get_flow_id_toeplitz,
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
@@ -1012,6 +1029,7 @@ const struct ath11k_hw_ops qca6390_ops = {
 	.rx_desc_get_decap_type = ath11k_hw_ipq8074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_ipq8074_rx_desc_get_mesh_ctl,
 	.rx_desc_get_msdu_start_info2 = ath11k_hw_ipq8074_rx_desc_get_msdu_start_info2,
+	.rx_desc_get_flow_id_toeplitz = ath11k_hw_ipq8074_rx_desc_get_flow_id_toeplitz,
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
@@ -1053,6 +1071,7 @@ const struct ath11k_hw_ops qcn9074_ops = {
 	.rx_desc_get_decap_type = ath11k_hw_qcn9074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_qcn9074_rx_desc_get_mesh_ctl,
 	.rx_desc_get_msdu_start_info2 = ath11k_hw_qcn9074_rx_desc_get_msdu_start_info2,
+	.rx_desc_get_flow_id_toeplitz = ath11k_hw_qcn9074_rx_desc_get_flow_id_toeplitz,
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
@@ -1094,6 +1113,7 @@ const struct ath11k_hw_ops wcn6855_ops = {
 	.rx_desc_get_decap_type = ath11k_hw_wcn6855_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_wcn6855_rx_desc_get_mesh_ctl,
 	.rx_desc_get_msdu_start_info2 = ath11k_hw_wcn6855_rx_desc_get_msdu_start_info2,
+	.rx_desc_get_flow_id_toeplitz = ath11k_hw_wcn6855_rx_desc_get_flow_id_toeplitz,
 	.rx_desc_get_ldpc_support = ath11k_hw_wcn6855_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_wcn6855_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_wcn6855_rx_desc_get_mpdu_fc_valid,
@@ -1135,6 +1155,7 @@ const struct ath11k_hw_ops wcn6750_ops = {
 	.rx_desc_get_decap_type = ath11k_hw_qcn9074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_qcn9074_rx_desc_get_mesh_ctl,
 	.rx_desc_get_msdu_start_info2 = ath11k_hw_qcn9074_rx_desc_get_msdu_start_info2,
+	.rx_desc_get_flow_id_toeplitz = ath11k_hw_qcn9074_rx_desc_get_flow_id_toeplitz,
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
@@ -1177,6 +1198,7 @@ const struct ath11k_hw_ops ipq5018_ops = {
 	.rx_desc_get_decap_type = ath11k_hw_qcn9074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_qcn9074_rx_desc_get_mesh_ctl,
 	.rx_desc_get_msdu_start_info2 = ath11k_hw_qcn9074_rx_desc_get_msdu_start_info2,
+	.rx_desc_get_flow_id_toeplitz = ath11k_hw_qcn9074_rx_desc_get_flow_id_toeplitz,
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 8725e119707b..925785c9f688 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -250,6 +250,7 @@ struct ath11k_hw_ops {
 	u8 (*rx_desc_get_decap_type)(struct hal_rx_desc *desc);
 	u8 (*rx_desc_get_mesh_ctl)(struct hal_rx_desc *desc);
 	u32 (*rx_desc_get_msdu_start_info2)(struct hal_rx_desc *desc);
+	u32 (*rx_desc_get_flow_id_toeplitz)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_ldpc_support)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_mpdu_seq_ctl_vld)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_mpdu_fc_valid)(struct hal_rx_desc *desc);
-- 
2.53.0


