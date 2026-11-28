Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4FA606A681
	for <ath11k@archiver.kernel.org>; Sat, 28 Nov 2026 17:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EJOrIxdb;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=k4/2he3W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PO4i6qUcXTERLvTBrnvj9bYRokOWmfKRjAdgWippNcE=; b=EJOrIxdbzo8Bh7
	IrDBF9vq2EvTy0tDHHc5T2komLj1ehIztNf/qfXqvQBWZ6fpamOKXOnaccCvrDOOhuBnpSJB6yv4e
	6iucxw7zCcSBf37+kuWybkihWpviWPVKtzttBmHu+BCIoAajiIdAHazSsYJCdFmYBye8+KLZGD4C5
	UDDV2rWYWXywa4as7LssjFREgTySRsQkAITZmgNQ1UAB1XpnDaFbzGntE7k66lIE1f4ZNPJgGoJ5p
	dDe08XKzJ/A+yed9Z8EReDgRwmhe/m1Y6FIjwEdtVY2M6aM/T58vJcZZKtlROAuKXHmfyz+EW9zP5
	eorFg90SYGsra6rlLDgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM83-000000010zb-3tls;
	Sat, 28 Nov 2026 17:22:27 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM7z-000000010tA-1RJo
	for ath11k@lists.infradead.org;
	Sat, 28 Nov 2026 17:22:26 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so1505004666b.3
        for <ath11k@lists.infradead.org>; Sat, 28 Nov 2026 09:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886541; x=1796491341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PO4i6qUcXTERLvTBrnvj9bYRokOWmfKRjAdgWippNcE=;
        b=k4/2he3WRXwNWXSTesrqaZYwYCguJmX2eQcvvISN/qvX/MFihteQCF3W6DxAequiGZ
         1XmdvEJjsJcYVOwwpqwYmEUaL21yYwbg+GhBSBu4KO3jfwGi6RnWQej623TiPrXsDM6u
         ky7V9ECs9iingtFGecglyGyu+GFJubUdOA079SG+5zh2s8WT/l6Y5o+QDNYk2HGsAUjX
         Ir6Kgc8R+lD1IsUHmWtTYsMIY8Wa+Oge/0O4jC2UUv8VBR+aRWbQ/riWh9Z2huNsvJKQ
         YLtkcsd7rb781ALFhafR2jNn7KYDJdbqt7Y0OWpkM8DFrBgqbQV0ghXlkckDc93q4OHl
         w0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886541; x=1796491341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PO4i6qUcXTERLvTBrnvj9bYRokOWmfKRjAdgWippNcE=;
        b=y81zArBmOTQyLQre8PD179ySTrMKpTJMJLAl5XoEUrHdcrRMQ97UO2OSXhByAwK+Nk
         9+/dQgLHROQPo4r5JgyrN3OFj5qiTICAv/1YTf9JVAtBKIdLcXH/+apD+BLgA0vMzk3Z
         jvC+U16k5AEd83QG42JqctrztFs8+U2IZXRMCy3eRdeqBpBiGX3KCipQcv2m68XKzNhJ
         aiY+zl8Kunl5YdDCFx5IpJovUL3UgFogtTbQ6cRhUr7/JH296jxs5L6OJ39aieHb3rj1
         D67UH+zr3gsF+roZyWsHeGW4y1gs2OXWvKa5VOPXTcUejFJnLrj3n87eHifCnjX5JhgW
         dNjQ==
X-Forwarded-Encrypted: i=1; AL+hErEEhjLcU9lLQ4Y8C2r5IJCxiqs1P+C+sDlvXvx2/DhEoxaQ8W+u1vyPQMa+99BHzv3TjtfFrcE=@lists.infradead.org
X-Gm-Message-State: APuU4Z9HM14YHKdL0LAPqUgxQI9tByWngWuQgAxAL7ydTyvhJ2rUbZ1+
	CKlftWQCoSuam/hL5qgg9rQWZsRRHTlaY7pl2bUwcYe3Ag2sQdQqtDTNkE9eq61KYA==
X-Gm-Gg: AZFdTZdS4h9dUsAQ7dBVflS72VagaFD25BqB8TZjLa/ZLgjFHWhcNQcpvyGXxLBLyLf
	ZIsCG1hNTosxFwtmTL3Ro0ZXBfSO7f1JF03I+zsC1zyO1wpL4iGE01OwfOf/gCVQtZP5Oj7/npb
	M1bqBcFyULq5yh91qzqiU86KrxoIWg+XyEk0NtBmKuqvJZOghEEpiT1HLhaxROeePuO4zHg3WNP
	VpopZ132OWvr3elLXOKWWq50Jt1Vd2zipFQ3CXMc5z2b72+R1ry2WUVfuEclHD4A+aQCZdqBRfw
	ztom1uSr0Slfixgtai6ux8d/nqEFlpH1Mz3OEoS0YZKGLQCa1nP3uHKmRXfFDg/3VIDhBRuBs6e
	00eF21fNjiAqGgDwAwysIE08/ZEInWmSCAh7+15+yL8TQJ61KtsmQ+6eQFIPm6UaxA/F7OG/7fG
	huKqlp2TbK/QVtiXdGillPKIvaIKJyuvGLT0J/aJz4F9G99Ijzx2F2ViCo9UFN1b6VCcoDhDjVY
	PsU3+vpOfIou3/Sdg8BS5p0tOy1vRWkY12RXGMnQrm+llVhSGbbD4mmHXHKzMMmvjaHig/tVKON
	mfDNy+vOTqW9Y+TnthnTumj1lRzPXtRjNM2B3Anpi+6uJU5pBKxB3ww2Z8fQ1pspJ6SXRkMYwKA
	LjO5glGc+7kyhrA9+0ZESLym4ZnAJeFK3P3rn40GWD0VBy3E2+vaL7eBnQFo5ciIOAVmqVg5CNW
	DabB/0p2URp7/ZzZazi4lEIIqB8FStVumsmz68dvUuwn/w78CkewnEU5y7b7Y6fxNK2Pdwk0uRD
	/upGMNPGtGvsJXMjD8B7GnUDSxHEPw0M5OlH05t77lUdAz22xkIlBM4eXZV2V0fhvfdR00Xyh1M
	E+iouufWf4ahkQ==
X-Received: by 2002:a17:906:365a:b0:c46:50c6:f737 with SMTP id a640c23a62f3a-c513a88d971mr1837729166b.31.1795886541449;
        Sat, 28 Nov 2026 09:22:21 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:20 -0800 (PST)
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
Subject: [PATCH ath-next v2 2/6] wifi: ath12k: only trust the RX checksum of a frame the hardware checked
Date: Sat, 28 Nov 2026 18:22:16 +0100
Message-ID: <20261128172220.922376-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128172220.922376-1-julius@bairaktaris.de>
References: <20261128172220.922376-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_092223_443077_19BC85AE 
X-CRM114-Status: GOOD (  15.13  )
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

ath12k_wifi7_dp_rx_h_csum_offload() marks every received MSDU
CHECKSUM_UNNECESSARY unless the MSDU end TLV reports an IP or TCP/UDP
checksum failure. Those bits report a checksum the hardware computed
and found wrong, so both are also clear for a frame whose transport
checksum it never computed: any protocol other than TCP and UDP, such
as ICMP, ICMPv6 or GRE, a TCP or UDP frame whose headers it did not
parse, and an IP fragment, which carries only part of the datagram its
checksum covers. A frame that ath12k_wifi7_dp_rx_h_defrag() reassembles
from 802.11 fragments keeps the descriptor of its first fragment, of
which only the MSDU length is rewritten, so its flags say nothing about
the payload of the later fragments. icmp_rcv() then takes the checksum
as verified, and a UDP datagram whose IP fragments all carry
CHECKSUM_UNNECESSARY keeps it after reassembly.

ath11k has the same check. Extract the protocol, fragment and
header-parsed flags of the MSDU end TLV with the other descriptor
fields on each chip, from the last buffer of the MSDU like the other
MSDU end fields, and mark a frame CHECKSUM_UNNECESSARY only when it is
TCP or UDP, not a fragment, its IP and TCP/UDP headers were parsed, and
it was not reassembled from 802.11 fragments. Unlike ath11k, ath12k
needs no case for a raw A-MSDU: nothing in the driver sets
ATH12K_FLAG_RAW_MODE.

Found by an LLM review (Claude) of the code.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2: also leave a frame reassembled from 802.11 fragments to the stack
(Sashiko, on 1/6); read l4_csum_checked from the last buffer, like the
other MSDU end fields since commit 1e678e37ff13; discovery line
reworded.

 drivers/net/wireless/ath/ath12k/hal.h               |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c       | 11 ++++++++++-
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c | 11 +++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c | 12 ++++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c | 12 ++++++++++++
 5 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 343e1636b4cc..003baf0d3ea0 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -732,6 +732,7 @@ struct hal_rx_desc_data {
 	    is_decrypted:1,
 	    ip_csum_fail:1,
 	    l4_csum_fail:1,
+	    l4_csum_checked:1,
 	    is_first_msdu:1,
 	    is_last_msdu:1,
 	    mesh_ctrl_present:1,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 473887ed4bb1..fa591a03ecef 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -344,7 +344,16 @@ int ath12k_wifi7_dp_rx_tid_delete_handler(struct ath12k_base *ab,
 static void ath12k_wifi7_dp_rx_h_csum_offload(struct sk_buff *msdu,
 					      struct hal_rx_desc_data *rx_info)
 {
-	msdu->ip_summed = (rx_info->ip_csum_fail || rx_info->l4_csum_fail) ?
+	/*
+	 * The failure bits only report a checksum the hardware computed, so
+	 * they are also clear for a frame it did not check: anything but a
+	 * TCP or UDP frame whose headers it parsed, and an IP fragment. A
+	 * frame reassembled from 802.11 fragments keeps the descriptor of its
+	 * first fragment, which does not describe the later ones.
+	 */
+	msdu->ip_summed = (ATH12K_SKB_RXCB(msdu)->is_frag ||
+			   rx_info->ip_csum_fail || rx_info->l4_csum_fail ||
+			   !rx_info->l4_csum_checked) ?
 			   CHECKSUM_NONE : CHECKSUM_UNNECESSARY;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
index bad2b60409d9..10a8e3e78fdf 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcc2072.c
@@ -347,6 +347,16 @@ static bool ath12k_hal_rx_h_l4_cksum_fail_qcc2072(struct hal_rx_desc *desc)
 			       RX_MSDU_END_INFO13_TCP_UDP_CKSUM_FAIL);
 }
 
+static bool ath12k_hal_rx_h_l4_csum_checked_qcc2072(struct hal_rx_desc *desc)
+{
+	u32 info11 = __le32_to_cpu(desc->u.qcc2072.msdu_end.info11);
+
+	return (info11 & (RX_MSDU_END_INFO11_TCP | RX_MSDU_END_INFO11_UDP)) &&
+	       !(info11 & RX_MSDU_END_INFO11_IP_FRAG) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_FIXED_HDR_VALID) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_TCP_UDP_HDR_VALID);
+}
+
 static bool ath12k_hal_rx_h_ip_cksum_fail_qcc2072(struct hal_rx_desc *desc)
 {
 	return !!le32_get_bits(desc->u.qcc2072.msdu_end.info13,
@@ -421,6 +431,7 @@ static void ath12k_hal_extract_rx_desc_data_qcc2072(struct hal_rx_desc_data *rx_
 	rx_desc_data->msdu_done = ath12k_hal_rx_h_msdu_done_qcc2072(ldesc);
 	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_qcc2072(ldesc);
 	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_qcc2072(ldesc);
+	rx_desc_data->l4_csum_checked = ath12k_hal_rx_h_l4_csum_checked_qcc2072(ldesc);
 	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_qcc2072(ldesc);
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_qcc2072(ldesc);
 }
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
index 0f85ae69b5e0..659d74a85764 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
@@ -872,6 +872,17 @@ bool ath12k_hal_rx_h_l4_cksum_fail_qcn9274(struct hal_rx_desc *desc)
 			       RX_MSDU_END_INFO13_TCP_UDP_CKSUM_FAIL);
 }
 
+static inline
+bool ath12k_hal_rx_h_l4_csum_checked_qcn9274(struct hal_rx_desc *desc)
+{
+	u32 info11 = __le32_to_cpu(desc->u.qcn9274_compact.msdu_end.info11);
+
+	return (info11 & (RX_MSDU_END_INFO11_TCP | RX_MSDU_END_INFO11_UDP)) &&
+	       !(info11 & RX_MSDU_END_INFO11_IP_FRAG) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_FIXED_HDR_VALID) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_TCP_UDP_HDR_VALID);
+}
+
 static inline
 bool ath12k_hal_rx_h_ip_cksum_fail_qcn9274(struct hal_rx_desc *desc)
 {
@@ -1042,6 +1053,7 @@ void ath12k_hal_extract_rx_desc_data_qcn9274(struct hal_rx_desc_data *rx_desc_da
 	rx_desc_data->msdu_done = ath12k_hal_rx_h_msdu_done_qcn9274(ldesc);
 	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_qcn9274(ldesc);
 	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_qcn9274(ldesc);
+	rx_desc_data->l4_csum_checked = ath12k_hal_rx_h_l4_csum_checked_qcn9274(ldesc);
 	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_qcn9274(ldesc);
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_qcn9274(ldesc);
 }
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
index 2d66d71d1b9b..6e103f49bb9f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
@@ -485,6 +485,17 @@ bool ath12k_hal_rx_h_l4_cksum_fail_wcn7850(struct hal_rx_desc *desc)
 			       RX_MSDU_END_INFO13_TCP_UDP_CKSUM_FAIL);
 }
 
+static inline
+bool ath12k_hal_rx_h_l4_csum_checked_wcn7850(struct hal_rx_desc *desc)
+{
+	u32 info11 = __le32_to_cpu(desc->u.wcn7850.msdu_end.info11);
+
+	return (info11 & (RX_MSDU_END_INFO11_TCP | RX_MSDU_END_INFO11_UDP)) &&
+	       !(info11 & RX_MSDU_END_INFO11_IP_FRAG) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_FIXED_HDR_VALID) &&
+	       (info11 & RX_MSDU_END_INFO11_IP_TCP_UDP_HDR_VALID);
+}
+
 static inline
 bool ath12k_hal_rx_h_ip_cksum_fail_wcn7850(struct hal_rx_desc *desc)
 {
@@ -638,6 +649,7 @@ void ath12k_hal_extract_rx_desc_data_wcn7850(struct hal_rx_desc_data *rx_desc_da
 	rx_desc_data->msdu_done = ath12k_hal_rx_h_msdu_done_wcn7850(ldesc);
 	rx_desc_data->l4_csum_fail = ath12k_hal_rx_h_l4_cksum_fail_wcn7850(ldesc);
 	rx_desc_data->ip_csum_fail = ath12k_hal_rx_h_ip_cksum_fail_wcn7850(ldesc);
+	rx_desc_data->l4_csum_checked = ath12k_hal_rx_h_l4_csum_checked_wcn7850(ldesc);
 	rx_desc_data->is_decrypted = ath12k_hal_rx_h_is_decrypted_wcn7850(ldesc);
 	rx_desc_data->err_bitmap = ath12k_hal_rx_h_mpdu_err_wcn7850(ldesc);
 }
-- 
2.53.0


