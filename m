Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76910606A33A
	for <ath11k@archiver.kernel.org>; Sat, 28 Nov 2026 17:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FE1nE5qR;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Od++zzPQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z5Vrk1NamYvHsdPTKlCxcj9SSbrY8eS2EY9Q9H61SH0=; b=FE1nE5qRknSOcZ
	Mb8OSCdzNU6udDePjZlOsZUqEo/5TmjlRZ9NX4Tt2oFuPj88MsUQA2lJEKT2PChke9kgBbfV1wPNz
	NSlaH0vK8TWoMBqxPyiKJBQHVLzDocNSocg1A5wr1XPRekJGagp8coXtUNjHsG4sxvFxIJ8HgnPlj
	quDdGljaxvjkI43U39PgrcemDlSpu+dIb8r2XkiGsMiRLa0m+W8HLArPZkwiv7j5wDATA1y9HNs+F
	CsMbhkplLySLyTAZw0KhP+v2/Yb99qdpn+Ol0NThfw7RBrrsGoJUY4v5+EQ5e8GoyG0Dw+W7Mqdpm
	QmnoYEKc5yNqrlollUEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM86-00000001147-0Sss;
	Sat, 28 Nov 2026 17:22:30 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM81-000000010uK-1Ymx
	for ath11k@lists.infradead.org;
	Sat, 28 Nov 2026 17:22:28 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c51a02ad3acso671299666b.1
        for <ath11k@lists.infradead.org>; Sat, 28 Nov 2026 09:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886543; x=1796491343; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5Vrk1NamYvHsdPTKlCxcj9SSbrY8eS2EY9Q9H61SH0=;
        b=Od++zzPQcG5+vE4fyKGP+LjHJ29oW8mzr9b93vmYw5xGZG8mCZPInxqx756rTJUT/5
         f/2kP7KtUaedqp0WlOVhObVsGdb7Uxo9+4E9yMrd5s24b08cqoGXldvJSvpQ2gchJTRu
         wJ0Pcm3MuLrSpL53vC8KN2iRZyTyAxUPSmgqQHwlI4L+vCr82oTN9z7HqB3xfnJU2VAM
         Gzm+Z57DxTM1s4lFazA+yTNYbxWHZdd0hos4N4EnQsMhNnuaU+79AQRHvEfH2rqdJOs1
         3yZBoTZkeG/BTcuir1f/m/y9FhIQQM8JBmvzEm8+7qJ4BhlsHZbnZwc5qeZFh2Xxfh/Z
         G84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886543; x=1796491343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5Vrk1NamYvHsdPTKlCxcj9SSbrY8eS2EY9Q9H61SH0=;
        b=LG4jGD27MeivSFnhx2ycgqWrCg2nS8intizvcpcP5x2PuYu2FuYH0I/Yc662gBi6re
         KRx/FHZsfdiJPKVxu2aUXAlr9GFFpXMcNmAr6WAbUme5SC/nezfm6v+/Z5JDmFkXyECU
         bUEAP/AhPYJIvZuxT8jZOJcwzxI9uKnAmn0NIPA6SPtUv5AiV4xPEovUIxjHScBnjZg1
         WeZjOXi48HphuhCtECLeAydw1aiBBE/ZxUnxRKPntsVH1axKwiS97PLbp5RIaGGzn62w
         uNvBG51V6RiuZPb4g+04Ykl1KRTaIwO5/6eD+Y4rUtPJk8n1cNHaeEV1eEz42Hp6HroB
         8TtA==
X-Forwarded-Encrypted: i=1; AL+hErHG6/0x4QpvvZSal+dWvzTca5pvRcUAssxpZ8UI1KMFkaqKSHKX57Mdux0kxCR98OStwFCL2Bk=@lists.infradead.org
X-Gm-Message-State: APuU4Z+TmrpQbbtrjISfkjdxhYO5ayD1RgYtE6kLfJbYuyG+O2iqvEKZ
	+pNUVudLTTscQ3KT3T5mp2d0DjoM3SvOfb/6dxNKC6rwCZrYl76ke1D0H6bVw1RFTQ==
X-Gm-Gg: AZFdTZcwPjD6OQbGXllH0mFfAP4B4k7ZCde3VGNTc/B//M6Ayt37aWQ0vuZN8i2J+JV
	dlqQz56s8qE4gaA7y0KxXNaKty1Pu8GjV/VTvT5pfXcj7oaw6WpVHJsPQhOkefc4VByXQoZxsG1
	+cHr/oVaWHl3cJnWrRgkO2RDYV/yucf4gFDU7V+aFzWN04LyZXZiCxnkkuYC/7/wSnnKbKZekcZ
	sndiCiw8YRT6grK7dBKo3dXz5GJVCHQg9WMoMsfH5JDvOXNoEI58AXUGImVqtRL80/Fs9dAlNQB
	gdPyImT/7pIBNodwio3r6zRTl1ukbTgfnsP90eMrlaI4x1M43Hjehzl1aZgJTZ1uMC2zUuQQihv
	MaockKBs2IvYMlPbcvKFwB2qw8bZ7Njij8XRqQM0qi/dhawKR1VzbDJqDMEwmmkrPo67Fr953av
	jAftyXYvms8+r76RrJrj/udgmFrheRAiPaC0AkwV9ZLNN86UdNC+T1H7YiQu4CYVUs6e2DgiVIY
	rOb4cMNr/sN8A0u2pQv+OY0+u+WREZi682Tg9W0cErCumEbGaYHFqzENYFlwdAvIW7m+cyAy2cT
	9z/Ve0hLst2Jgy6li0fORMBnX+qdKx8KG2x2MoTcSCbbWD+BYJsPCShkITCHrF3HhPlW1UCOj1W
	cxugjZy0xX2qjFGYp9fKJpuUshOlCqFfe2YtZueur9kjmHtX5takVuQPzgBQbSOXCoM9vJe50p1
	1UvOXwmTZeTM5gVoEVNFwPZwPjLUqYMug0tSnzT0+mSD7oxL8xFVJsGnvu2kdjPhht8QoNNZ70/
	Zc4bh1DynrMovoEIR9jyOzvnx7zucCfYiXvL6SnLcq7/YGaIOq30MtsVtmuKvKP5SUUHfzpiVBh
	fEd4X0TNQnHAVw==
X-Received: by 2002:a17:907:2d13:b0:c50:ca93:19a0 with SMTP id a640c23a62f3a-c513aab9bcemr2391973566b.40.1795886543561;
        Sat, 28 Nov 2026 09:22:23 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:23 -0800 (PST)
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
Subject: [PATCH ath-next v2 4/6] wifi: ath11k: clear the crypto flags of the receive status for each MSDU
Date: Sat, 28 Nov 2026 18:22:18 +0100
Message-ID: <20261128172220.922376-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128172220.922376-1-julius@bairaktaris.de>
References: <20261128172220.922376-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_092226_121805_607BF2FA 
X-CRM114-Status: GOOD (  12.64  )
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

ath11k_dp_rx_process_received_packets() keeps one ieee80211_rx_status
for all MSDUs of a radio that a REO reap returns, and
ath11k_dp_rx_h_mpdu() fills it for each of them. It clears
RX_FLAG_DECRYPTED, RX_FLAG_IV_STRIPPED and RX_FLAG_MMIC_STRIPPED of the
MSDU before, but not the other flags it sets for a decrypted MSDU:
RX_FLAG_MIC_STRIPPED and RX_FLAG_ICV_STRIPPED for a group-addressed
one, RX_FLAG_PN_VALIDATED for a unicast one.

A decrypted group-addressed MSDU that follows a decrypted unicast MSDU
of the same radio in one reap would therefore reach mac80211 with
RX_FLAG_PN_VALIDATED, although the hardware checks the PN of unicast
frames only. ieee80211_crypto_ccmp_decrypt() and
ieee80211_crypto_gcmp_decrypt() then skip the replay check of the
group key.

On IPQ8074 hw2.0 with WLAN.HK.2.12-01460 this is not reachable: the
firmware releases group-addressed MSDUs through the REO error path,
with error code DESC_ADDR_ZERO, and ath11k_dp_rx_wbm_err() gives each
of them a receive status of its own, so no reap carries the flags of a
unicast MSDU into a group-addressed one. An ath11k station under
unicast load received 29011 group-addressed MSDUs there, and none of
them entered ath11k_dp_rx_h_mpdu() with RX_FLAG_PN_VALIDATED already
set. If a chip or firmware delivers group-addressed MSDUs through the
REO destination ring, a radio in range that recorded a group-addressed
data frame of the network could send it again, without any key, while
the receiver gets unicast data, and the station or mesh point would
accept the copy.

Clear the three flags with the other per-MPDU flags.

Found by an LLM review (Claude) of the code.

Fixes: 2167fa606c0f ("ath11k: Add support for RX decapsulation offload")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2: discovery line reworded.

 drivers/net/wireless/ath/ath11k/dp_rx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 516856c531a9..9f6872f2c8e1 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2376,7 +2376,10 @@ static int ath11k_dp_rx_h_mpdu(struct ath11k *ar,
 			     RX_FLAG_MMIC_ERROR |
 			     RX_FLAG_DECRYPTED |
 			     RX_FLAG_IV_STRIPPED |
-			     RX_FLAG_MMIC_STRIPPED);
+			     RX_FLAG_MMIC_STRIPPED |
+			     RX_FLAG_MIC_STRIPPED |
+			     RX_FLAG_ICV_STRIPPED |
+			     RX_FLAG_PN_VALIDATED);
 
 	if (err_bitmap & DP_RX_MPDU_ERR_FCS)
 		rx_status->flag |= RX_FLAG_FAILED_FCS_CRC;
-- 
2.53.0


