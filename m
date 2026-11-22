Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA495606A6A3
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 21:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2PCZQ2cf;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Vz23vfco
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QCEpjMx3kdrE6DA4xpjKx+hhlCUfgttQ3iyKZdx+PN0=; b=2PCZQ2cf0X4Nns
	NIb/yveArrx8lpIEC80HgMoitomsjlA4PxWR+0pwhmubi/62O2X2tysELzZZ8OMXk9aFZWVOo2S3F
	9UzxaZvtdmS4+DI9IrAerdmFKIO7joFKlyqtRRX9bHQzR5mwKQD8gRLv03V1YnnJOeGQcCmUt4ji2
	MmNU78Trrx7opVPUW7C4wy6V46c8dm4LfNWIDyxBGvuv5kOuobH5wh923r4/A5+NYnzejFs73vcjs
	9TpKFqsmgm0UeJH6fcUGPCzRWS1nYujJfSNivj5gCigGYr35Vkdu+CMfX7fRMkheFjrcZb5ie+afl
	D5/jDuUxvt/7x9tnvDlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEke-00000001knO-239c;
	Sun, 22 Nov 2026 21:05:32 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEkY-00000001kg6-3iZw
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 21:05:29 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c4d28f75d62so440914166b.0
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 13:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381525; x=1795986325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QCEpjMx3kdrE6DA4xpjKx+hhlCUfgttQ3iyKZdx+PN0=;
        b=Vz23vfco7F4zoTrfeWZbRu7TbDzbOZhd+h7koX3Gi4gdcfWbAbbv58EKF0i2umsyfR
         arXzLmNqN5uGu3Rv6aQP3lOczK3hZyj9ZpWr3OyesUkEZYkAz0Q7zGHAqpegWfpnb1bJ
         l1smFcFMiz4E+5BLLHouUVLuUHX4qNGCBR9mR4gUQ+Kk3GvaPLbIcUmWUmkadH3dewTg
         YqjZlvTRWqwY9CSNW41VGCVh0gx2tVXzfDhT1hIxJD7Gzf//GLSSY9ayu6OmYGA+9XLY
         F5rOxCd36airCiYInR9U9c68nXn17hiJbzPuNdaZs91Mj2iwvuxMGmVqluyeIdmCu3T8
         yg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381525; x=1795986325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QCEpjMx3kdrE6DA4xpjKx+hhlCUfgttQ3iyKZdx+PN0=;
        b=GyjQjDb1E3hjRk6yqzlxRQLY0i+yLUP8D1m+IUcr4CmGwP70B8LLscUi8SudAzKBxz
         nbKxS0AA8Z/v3Srk6kJD4dOPqVCfk4iPV/df5ypEGtXp9aVTUunEnYEE10tbSUae/o+f
         i/JRCV3sXObf/ubanXxedModKIHoa5JbO/01sshH2zxTDWcabKjIC1UwAfdB2/DEqYhd
         eJnb/60sBWz+6dm/Xgcg0d38tsNCJAr6XmxncJnQ1h/+pKq8+/J9CwS3k0xNXKfn55mU
         9TY5ueFDWsRU5hlUceCylG1/IFAb4GQPIfNmdHyZd9Vxiv8Hc1LPrKxrTqWHUzG7tdNn
         DEFQ==
X-Forwarded-Encrypted: i=1; AL+hErE2sNT8HmRkLPYD5w1CR9VV9NmFb7VCDiHfw54UBBedwJmhvTB1QBgJb3eoQYy6O9A7j2cHv0w=@lists.infradead.org
X-Gm-Message-State: APuU4Z/+mTQPSf+ho2844KEkn/MwRku/k2WgPC7aiVMLFQSF8F9Sd60e
	ET8K9J8iEujHzawc5x07YqAUnTU0KOcum8Zj//C3daLQwfnrcy5EN7Sk/T/TOEIwyQ==
X-Gm-Gg: AZFdTZdVZorekDzKVEdTsY0w4EOn6GcXm8MdU9xr9j7/yW4Cw1596ER+1i2xOWP6yrI
	zVphHkduvhDJHTE/Z39UrkSkLNuyTPaNCYbGc6msogAmKGup+0VnJUs0XVrayyTbv43QHGCVjVp
	xPNfrE+bk+jcPP0Tpfo6zafZu0spEs8RDDJFH76dBqSSOU77iQ1M8c+tl6QVrC7HUol6FFfuMSr
	09AINj1Eei6/8brybNmwOCncRHWbrY5Bn9my0g13K66cIK/+OyRQVWPWWtXOoI9BDi4PEohJBb/
	UvsI3xm/Z7Yn77HePhrZ0HV3yiz9fv9ztH1rXkDKjse/jj/USXdkDbFzc18YT9/Q2WfNl7pjbsL
	a1oWTmDYLvNtxWtoqXkc9uxQimHp+Y2wBuJPdwp0CUYUBR4Zf0IegFD/Y6TCCa3pEe4p5pv94AS
	oCszYVDZmylbAtxQtKjZV+2MxgXutapDaAFNDx/RSDRgdRVzJDqCoWvchCMIkRd4401LzHblmHQ
	cGU+ML+3z4IIK6KIuUNIGm7boyFIV+6SLYdiWmV1VgWdcZ3A1nCd8tI9u7N6Yn38eRRffzosK32
	60Zs6SvT37NJ+VScO0Knm+02x5J4D0FeAKiKsx3W3NMsbl8xYjsDt+TnvfVDWfxGjUyjWqGlP0l
	ZfvHoHrp0iFHm5SSdjC3BcaLV8mho2ys4inJLlir1U/K+y+NBN9LjUqvELP56o6of1qP0h1lrt0
	n/RbIgSCIZWbQ7FMiUmgcwPMUDG0hF5SoBGEIz6yLpfL0pOLSIF1PwQrhTJbYtoEN6WQouZ/1j+
	wjrpFnuseEI5sgHEy2TaUENwJT43eicfej03AiEhfZecxqQZHm1WGFR0Yi0p97Q939v1v9URa/R
	uohrt+cBfwakJ2568y6qbq2jCS83VQxF0y5kfLaWB+XY9AtEqaDZyh3+30WjJhi8WCJYepva5Q=
	=
X-Received: by 2002:a17:907:1396:b0:c48:a838:c16d with SMTP id a640c23a62f3a-c513ab4925bmr529622866b.30.1795381524970;
        Sun, 22 Nov 2026 13:05:24 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:24 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	John Crispin <john@phrozen.org>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Jouni Malinen <quic_jouni@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>
Subject: [PATCH ath-next 1/6] wifi: ath11k: only trust the RX checksum of a frame the hardware checked
Date: Sun, 22 Nov 2026 22:05:20 +0100
Message-ID: <20261122210525.2076058-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122210525.2076058-1-julius@bairaktaris.de>
References: <20261122210525.2076058-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_130527_289983_B7C3E6B1 
X-CRM114-Status: GOOD (  17.60  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k_dp_rx_h_csum_offload() marks every received MSDU
CHECKSUM_UNNECESSARY unless the attention TLV reports an IP or TCP/UDP
checksum failure. Those bits report a checksum the hardware computed
and found wrong, so both are also clear for a frame whose transport
checksum it never computed: any protocol other than TCP and UDP, such
as ICMP, ICMPv6 or GRE, and a TCP or UDP frame whose headers it did not
parse within the first 256 bytes. An IP fragment carries only part of
the datagram its checksum covers.

The stack then skips the checks it would make: icmp_rcv() takes the
checksum as verified, and reassembly keeps CHECKSUM_UNNECESSARY when
every fragment carries it, so a UDP datagram that arrives in fragments
is never checked. By the code this holds for every ath11k chip and frame
mode and
for any frame an associated peer sends.

The MSDU start TLV carries the flags that say what the hardware parsed:
TCP, UDP, IP fragment, and whether the fixed IP header and the TCP/UDP
header were parsed. Mark a frame CHECKSUM_UNNECESSARY only when it is
TCP or UDP, not a fragment, and both headers were parsed;
ath10k_htt_rx_get_csum_state() already leaves a frame that is neither
TCP nor UDP to the stack. The flags sit in a different descriptor
layout on each chip family, so add a hw_ops accessor for the MSDU start
word that holds them.

Found by reading the code with an AI review tool.

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 23 +++++++++++++++++++++--
 drivers/net/wireless/ath/ath11k/hw.c    | 22 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath11k/hw.h    |  1 +
 3 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 6d95f7b343a5..93425ee02774 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -1865,13 +1865,32 @@ static void ath11k_dp_rx_h_csum_offload(struct ath11k *ar, struct sk_buff *msdu)
 	struct ath11k_skb_rxcb *rxcb = ATH11K_SKB_RXCB(msdu);
 	struct rx_attention *rx_attention;
 	bool ip_csum_fail, l4_csum_fail;
+	u32 info2;
 
 	rx_attention = ath11k_dp_rx_get_attention(ar->ab, rxcb->rx_desc);
 	ip_csum_fail = ath11k_dp_rx_h_attn_ip_cksum_fail(rx_attention);
 	l4_csum_fail = ath11k_dp_rx_h_attn_l4_cksum_fail(rx_attention);
+	info2 = ar->ab->hw_params.hw_ops->rx_desc_get_msdu_start_info2(rxcb->rx_desc);
 
-	msdu->ip_summed = (ip_csum_fail || l4_csum_fail) ?
-			  CHECKSUM_NONE : CHECKSUM_UNNECESSARY;
+	msdu->ip_summed = CHECKSUM_NONE;
+
+	if (ip_csum_fail || l4_csum_fail)
+		return;
+
+	/*
+	 * The failure bits only report a checksum the hardware computed, so
+	 * they are also clear for a frame it did not check. It checks the
+	 * TCP or UDP checksum of a frame whose IP and TCP/UDP headers it
+	 * parsed; an IP fragment does not carry the whole datagram the
+	 * checksum covers.
+	 */
+	if (!(info2 & (RX_MSDU_START_INFO2_TCP | RX_MSDU_START_INFO2_UDP)) ||
+	    (info2 & RX_MSDU_START_INFO2_IP_FRAG) ||
+	    !(info2 & RX_MSDU_START_INFO2_IP_FIXED_HDR_VALID) ||
+	    !(info2 & RX_MSDU_START_INFO2_IP_TCP_UDP_HDR_VALID))
+		return;
+
+	msdu->ip_summed = CHECKSUM_UNNECESSARY;
 }
 
 int ath11k_dp_rx_crypto_mic_len(struct ath11k *ar, enum hal_encrypt_type enctype)
diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/ath/ath11k/hw.c
index 93f9a03c48dc..096366b85849 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -272,6 +272,11 @@ static u8 ath11k_hw_ipq8074_rx_desc_get_decap_type(struct hal_rx_desc *desc)
 			 __le32_to_cpu(desc->u.ipq8074.msdu_start.info2));
 }
 
+static u32 ath11k_hw_ipq8074_rx_desc_get_msdu_start_info2(struct hal_rx_desc *desc)
+{
+	return __le32_to_cpu(desc->u.ipq8074.msdu_start.info2);
+}
+
 static u8 ath11k_hw_ipq8074_rx_desc_get_mesh_ctl(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MSDU_START_INFO2_MESH_CTRL_PRESENT,
@@ -449,6 +454,11 @@ static u8 ath11k_hw_qcn9074_rx_desc_get_decap_type(struct hal_rx_desc *desc)
 			 __le32_to_cpu(desc->u.qcn9074.msdu_start.info2));
 }
 
+static u32 ath11k_hw_qcn9074_rx_desc_get_msdu_start_info2(struct hal_rx_desc *desc)
+{
+	return __le32_to_cpu(desc->u.qcn9074.msdu_start.info2);
+}
+
 static u8 ath11k_hw_qcn9074_rx_desc_get_mesh_ctl(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MSDU_START_INFO2_MESH_CTRL_PRESENT,
@@ -626,6 +636,11 @@ static u8 ath11k_hw_wcn6855_rx_desc_get_decap_type(struct hal_rx_desc *desc)
 			 __le32_to_cpu(desc->u.wcn6855.msdu_start.info2));
 }
 
+static u32 ath11k_hw_wcn6855_rx_desc_get_msdu_start_info2(struct hal_rx_desc *desc)
+{
+	return __le32_to_cpu(desc->u.wcn6855.msdu_start.info2);
+}
+
 static u8 ath11k_hw_wcn6855_rx_desc_get_mesh_ctl(struct hal_rx_desc *desc)
 {
 	return FIELD_GET(RX_MSDU_START_INFO2_MESH_CTRL_PRESENT,
@@ -914,6 +929,7 @@ const struct ath11k_hw_ops ipq8074_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_ipq8074_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_ipq8074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_ipq8074_rx_desc_get_mesh_ctl,
+	.rx_desc_get_msdu_start_info2 = ath11k_hw_ipq8074_rx_desc_get_msdu_start_info2,
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
@@ -954,6 +970,7 @@ const struct ath11k_hw_ops ipq6018_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_ipq8074_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_ipq8074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_ipq8074_rx_desc_get_mesh_ctl,
+	.rx_desc_get_msdu_start_info2 = ath11k_hw_ipq8074_rx_desc_get_msdu_start_info2,
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
@@ -994,6 +1011,7 @@ const struct ath11k_hw_ops qca6390_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_ipq8074_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_ipq8074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_ipq8074_rx_desc_get_mesh_ctl,
+	.rx_desc_get_msdu_start_info2 = ath11k_hw_ipq8074_rx_desc_get_msdu_start_info2,
 	.rx_desc_get_ldpc_support = ath11k_hw_ipq8074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_ipq8074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_ipq8074_rx_desc_get_mpdu_fc_valid,
@@ -1034,6 +1052,7 @@ const struct ath11k_hw_ops qcn9074_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_qcn9074_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_qcn9074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_qcn9074_rx_desc_get_mesh_ctl,
+	.rx_desc_get_msdu_start_info2 = ath11k_hw_qcn9074_rx_desc_get_msdu_start_info2,
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
@@ -1074,6 +1093,7 @@ const struct ath11k_hw_ops wcn6855_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_wcn6855_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_wcn6855_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_wcn6855_rx_desc_get_mesh_ctl,
+	.rx_desc_get_msdu_start_info2 = ath11k_hw_wcn6855_rx_desc_get_msdu_start_info2,
 	.rx_desc_get_ldpc_support = ath11k_hw_wcn6855_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_wcn6855_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_wcn6855_rx_desc_get_mpdu_fc_valid,
@@ -1114,6 +1134,7 @@ const struct ath11k_hw_ops wcn6750_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_qcn9074_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_qcn9074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_qcn9074_rx_desc_get_mesh_ctl,
+	.rx_desc_get_msdu_start_info2 = ath11k_hw_qcn9074_rx_desc_get_msdu_start_info2,
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
@@ -1155,6 +1176,7 @@ const struct ath11k_hw_ops ipq5018_ops = {
 	.rx_desc_get_encrypt_type = ath11k_hw_qcn9074_rx_desc_get_encrypt_type,
 	.rx_desc_get_decap_type = ath11k_hw_qcn9074_rx_desc_get_decap_type,
 	.rx_desc_get_mesh_ctl = ath11k_hw_qcn9074_rx_desc_get_mesh_ctl,
+	.rx_desc_get_msdu_start_info2 = ath11k_hw_qcn9074_rx_desc_get_msdu_start_info2,
 	.rx_desc_get_ldpc_support = ath11k_hw_qcn9074_rx_desc_get_ldpc_support,
 	.rx_desc_get_mpdu_seq_ctl_vld = ath11k_hw_qcn9074_rx_desc_get_mpdu_seq_ctl_vld,
 	.rx_desc_get_mpdu_fc_valid = ath11k_hw_qcn9074_rx_desc_get_mpdu_fc_valid,
diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
index 4996536fbd14..8725e119707b 100644
--- a/drivers/net/wireless/ath/ath11k/hw.h
+++ b/drivers/net/wireless/ath/ath11k/hw.h
@@ -249,6 +249,7 @@ struct ath11k_hw_ops {
 	u32 (*rx_desc_get_encrypt_type)(struct hal_rx_desc *desc);
 	u8 (*rx_desc_get_decap_type)(struct hal_rx_desc *desc);
 	u8 (*rx_desc_get_mesh_ctl)(struct hal_rx_desc *desc);
+	u32 (*rx_desc_get_msdu_start_info2)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_ldpc_support)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_mpdu_seq_ctl_vld)(struct hal_rx_desc *desc);
 	bool (*rx_desc_get_mpdu_fc_valid)(struct hal_rx_desc *desc);
-- 
2.53.0


