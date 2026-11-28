Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B10606A323
	for <ath11k@archiver.kernel.org>; Sat, 28 Nov 2026 17:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ML/Xii7z;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=BGdo49j+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KclniKzng5yC2OmTSrt2pbDLszPr3jSxN0jyx81WHng=; b=ML/Xii7zSASDWn
	GslihJGtZHlwc9MkafqzULXu8J4pIAR0ZnYxNv2y/FCKkmO2sRjVgAg9btd+5S5UkgyuaijJy9bWY
	TX6gXck/dJ1JhYMtXqXjbtIjdyjT7ZWj9vbkJIyAhTqpyYHuobpRhgqBtRud69yZl9KBW0dPgPrCj
	O8u73q8wVphazcQHmcbkkq5viA6W2u2Qo/BwaJlVrZ1jgeYgZqcUv8nD8fg+oR3q/cfNXZ8pbeLkG
	kDPpTSMiwCs3Fyh8JRe2nHa8JpScAi+HageHKqDeVQjCvnQveTLHz5WQrRHswNjyLKdc47CS/XEvP
	tejb1L4bH3BftrU+gXlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM88-00000001183-1bU8;
	Sat, 28 Nov 2026 17:22:32 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM82-000000010uh-1nmx
	for ath11k@lists.infradead.org;
	Sat, 28 Nov 2026 17:22:29 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c4395d31228so1555213366b.1
        for <ath11k@lists.infradead.org>; Sat, 28 Nov 2026 09:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886544; x=1796491344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KclniKzng5yC2OmTSrt2pbDLszPr3jSxN0jyx81WHng=;
        b=BGdo49j+byzMEGyQBEyyQU8Kh98x6aiQJCWIwL3Z5rzU/H8LcM0I4DRXUc85esBgDQ
         Twn42KVmj2RiQrmiuG6p6sgWTVtIXFpT0nxfuF7J2WMm6ojYzWDSKRYAgpzjN/mIOg+W
         6ixbTVBxhGEhd2Rij4rZEV80D/+3d44zv6BXu+zC7wgU6M2YfBGpickHx8GmRF6KVlG3
         QSwCqD5VMir7ZjkZwXxcXJfZ+TmauHFLJhxBeHRkVAq1BReJcMnOvuiS3I9V4vQ0WN6z
         Ab+rBt//GgYnyEt4sZaYqq1fDlBlNg4KeypmdwPxZYh7VCNp8xmxXubDlAf0D4f6RtaS
         eV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886544; x=1796491344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KclniKzng5yC2OmTSrt2pbDLszPr3jSxN0jyx81WHng=;
        b=JYdGertdfTczlArLWnZX24Fe5ubzZHahRQdKv19Tc9e6sRRdsFIBqTaLC6jwaFapHK
         xGDroLwqTs41pG86dI4j8ZNY7np/Fxi3TQ0ikpsgj70336FCJEPLDrUoDB/HBtoAh+CN
         ZpGY1TC/+tWavIgcdgx8t9KJ5siRiSDntVU9vwSjSAyeY0S3wRCDsIf5sir0JwKwZrEa
         SWkzm+MDwpmV67fysCMZFfzbLungDUVIf+MEvoHHyWf31dPZHh2Q3K+k2WgYIAOc6vug
         jJ/WT6iSbJ4pdB6d3ZzphmSMXWjogPSwNvam72Ry6jyrT/zBaRgsM9WLQ4LGc+DMNgOO
         Qa8w==
X-Forwarded-Encrypted: i=1; AL+hErHU/CgjPbtY7h3TwlUB+obwiKAvNqH4UYHo8Koa+AzNMC20zbwKdLy4Mx6KVi4AROpfdAndMWY=@lists.infradead.org
X-Gm-Message-State: APuU4Z/uh6w4nIhKqNGRbtLGOjfrNKoDL80Ulx2jWaKC5jJTteQIcAny
	TAQ9l5Fgi0eEXh4x0VcKyrjMS6YgElZdz44M9LuaCG7fooyXhrTBQMTwPrU/rxo7Dw==
X-Gm-Gg: AZFdTZfzenb/hAbl625qW0i6mPXjNx4g+27amGVIVZYAeSq2RGrfrsgZbdsm+BEYSRy
	g4f9oaCEybFd8Gamg/m8Zk0/bzfDCbpSJufTVlSmrw713Fnhng9G9CSuKfYGpVVbR4GdZcMCF3v
	Ad2smGG6ksBU5n0uqQ4BUfDYeJoIoPLFhIK4D5sguhijBqXMRBjh+IGUSW1UD9acV0kzDKzd0XS
	AYbz1xhEjDlbeGAYF6FYsOB+OKzExFxvb+OoEnaND9QTS3lsU8444EdUbtjN04nvjjCtsn8QRXp
	aLrhxWNAMPuEzRRfzIk5iEhff8dUNQPm3zG500rewavhDA2jCVcnYGkBdv9zEMpwNA1thtfvopQ
	/1CeLOqZ/VoFVWvSVs0sUBrdGmH9rDV2hKiceWXLNpNP2R5dQh1HDmpAOwZ0jmTf7sGSADEPeVr
	dyiRcZqrXhFUFlOhVyxO+qqlrIeJC2R/Qv4XjPFOBRVYL3DyYnr8FvRbA62u6AhDxR1T213pCJ6
	cbpvWYljdY1SN+UNiZ2CaAsLzhtFrU1m5qFB7JYcQIeQWhPefNUIYiLuSbPP1uJeTKj3KTqTqBt
	/2abnXghpUM/dN9GjPyEENrhLa3FwIdfJbJJl+Jz5Pql65GPOahg5ucq6egKvMz/1LrRpmukZJP
	WyXjvq+wyoS7xht+R4bLp/WhPotsj0QAYo8YWri0Ig5ACT2whyxIyDIO/3cEq2S5DWM6E2eiCS1
	L6Zo2glm+VxMNomlTle2Wtt8m6B7B+nJhrnYLTur77OsMf2PAAj1DP7gQKniMnX8qyFA5YtYvbW
	IBWu9UfuiOO9GEQu9TqRfy0auSOfzLMzBdgLN6CyfHdMfBI4wzZutLcC51lpc0FgjJgIcpQmw2l
	1BPyiTP0Zyv3ug==
X-Received: by 2002:a17:906:eb56:b0:c40:36ca:9d1b with SMTP id a640c23a62f3a-c513aab5575mr1784407366b.40.1795886544488;
        Sat, 28 Nov 2026 09:22:24 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:24 -0800 (PST)
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
Subject: [PATCH ath-next v2 5/6] wifi: ath12k: clear the crypto flags of the receive status for each MSDU
Date: Sat, 28 Nov 2026 18:22:19 +0100
Message-ID: <20261128172220.922376-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128172220.922376-1-julius@bairaktaris.de>
References: <20261128172220.922376-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_092226_569408_82745DA7 
X-CRM114-Status: GOOD (  10.66  )
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

ath12k_wifi7_dp_rx_process_received_packets() keeps one
ieee80211_rx_status for all MSDUs that a REO reap returns, and
ath12k_wifi7_dp_rx_h_mpdu() fills it for each of them. As in ath11k, it
clears RX_FLAG_DECRYPTED, RX_FLAG_IV_STRIPPED and RX_FLAG_MMIC_STRIPPED
of the MSDU before, but not RX_FLAG_MIC_STRIPPED, RX_FLAG_ICV_STRIPPED
and RX_FLAG_PN_VALIDATED, which it also sets for a decrypted MSDU.

ath12k_get_dot11_hdr_from_rx_desc() drops RX_FLAG_PN_VALIDATED from a
group-addressed MSDU that was decapped to Ethernet, but a decrypted
group-addressed MSDU in native Wi-Fi decap that follows a decrypted
unicast MSDU in one reap would reach mac80211 with
RX_FLAG_PN_VALIDATED, and ieee80211_crypto_ccmp_decrypt() and
ieee80211_crypto_gcmp_decrypt() then skip the replay check of the
group key. Whether a reap holds such a pair depends, as in ath11k, on
whether the firmware delivers group-addressed MSDUs through the REO
destination ring.

Clear the three flags with the other per-MPDU flags.

Found by an LLM review (Claude) of the code.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2: discovery line reworded.

 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index fa591a03ecef..e37353445749 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -414,7 +414,10 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 			     RX_FLAG_MMIC_ERROR |
 			     RX_FLAG_DECRYPTED |
 			     RX_FLAG_IV_STRIPPED |
-			     RX_FLAG_MMIC_STRIPPED);
+			     RX_FLAG_MMIC_STRIPPED |
+			     RX_FLAG_MIC_STRIPPED |
+			     RX_FLAG_ICV_STRIPPED |
+			     RX_FLAG_PN_VALIDATED);
 
 	if (err_bitmap & HAL_RX_MPDU_ERR_FCS)
 		rx_status->flag |= RX_FLAG_FAILED_FCS_CRC;
-- 
2.53.0


