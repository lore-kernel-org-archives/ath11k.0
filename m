Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9544C606A33B
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 21:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d9/19iPw;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=iNMcBNGG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RhXLVgSRZBr+TZ8HYB6abPUQ+n+l05u+js/LeXBMczM=; b=d9/19iPwSOR0vU
	80tZ/0I3y6FMiF9yxfpqo6OopMIPVMCs6bmdAJQjn1bYag8+IU+hBFMz/IKTMEG+wq+wuo+T72KQS
	oWjYCyn+qhJJrWfst07rrsAf+3hc2Qsms7icSGkXq+di7jUi+bqLqyn4SmlUoNVxK1epdZ/zN49yt
	CXCG3oHdwsFxl29/wJsuSDhN+ixPCniXRgIe1VTmHeLV3+7qNqQfNFpk09y1SA4Yxk/lwAXSzTQZ3
	IMzfqx3sSdYJ+N2CtDH0RuErm3Amx3u5QS4sMu/gloBr1AoFlGYIxwByW46H9ISIaVY9kCohAfvgE
	8ExDyF9oks68n1fgVAiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEkf-00000001kqA-4BWT;
	Sun, 22 Nov 2026 21:05:34 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEke-00000001kk8-0GL0
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 21:05:33 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c511c0e2826so308970366b.0
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 13:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381530; x=1795986330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RhXLVgSRZBr+TZ8HYB6abPUQ+n+l05u+js/LeXBMczM=;
        b=iNMcBNGG+NkT7CJbw6bMiqOTYptNsjuVh+SAeAfg/0P+ynoWAy/J58mQ7ljeQtwzBP
         OVrsbNA5U3RlLQjeoHIXkZkCgRuBlkAq+Ozp0JbObZgo03l9OnUK8IfQ25H9uM/BZTic
         FPgiHsxGNIP9r7n+9blkDUjBuotjBFWhjzjo8qgREnqbIWJb5iHAzr63fVdsjmYAf4ha
         WzPTQMwy+GSaQRqrq7BKxunuNg8Zr9XgUStIL3Qwj3FwQRdT80krefRntEmB3hNRSmjA
         EQ5j5av/qTdFCtiqFNKxzWRBujb6EDM3fELjV//poSWqy0eOtN+6XTGSqTU2TIJRSdJc
         ZbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381530; x=1795986330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RhXLVgSRZBr+TZ8HYB6abPUQ+n+l05u+js/LeXBMczM=;
        b=HTnhBstfC981BMA9T2E8h1BNtW3J83XDEJmQIL4tXGfHPHBisk6vRPZWilLylWx2P6
         icdzeiWZlBTpbClsDoPeYRY4fPDD63EAClOfQ0r0O697vivjDXEambIYtgSumPDuxL9i
         DBUpYjHKsf3hn4UUocSZiPdiIASlPlqdELBgm7QefkKwYOh8Yffk0BAf6ep1Ln3hJrUR
         yH82Q2j5y6QUpaiiZuVjzX7Wuy2GVc5rj5QiTGARSETwRovdCdfnsGl9Lpo+taJIvbkq
         Gv82M1iOZ+zXAqRwg0xjbV3eZ6PNK30IAvAv6d9sP+G8wltRIgsvwNfI2ynFKIhdjukr
         +3oA==
X-Forwarded-Encrypted: i=1; AL+hErEnYdZGvAoU7T5j8qtvJl4gpjzrq7gS43rslXl4fOpV3X9qKzz/phLmzxYCmb7D8NwIWm1li/M=@lists.infradead.org
X-Gm-Message-State: APuU4Z+inao34Q0iM+pG0RaKiHRYSiJKv1Fb+fAmfnyR+ExSXm6zlZx5
	CuRuCIi6ldTEglEUe9dclJQrRcW88CsxGsS/Mqi3vj6U/YxncY2K2oF2NjAfiroNXg==
X-Gm-Gg: AZFdTZdmtqCbP2oqVnGNy2oJaVgfemHqdbmgY2ohGow6ZNbva8iE+mC3TXNDqgr1IfT
	pl4bWUHZMtejiiP+8XIWG5EyVQN2dVkdQYp8TV53Oe6a3aJUPCHGrjIFarbp0Dzi3ozlQoD5ha6
	PfuJL7K1RCQLGzE7jHnKkOoqFWSREQUjC10VfjEXrkWjdexOgO0ICXp7QQKHM5MH9DNgTGqsxfv
	ypP3GlvlGNSn3SVoq27QP1iSI+SLL7j/vubKyMlDhuIJsNrL39U1vryYthLQlLMrfeq7T3oT/jb
	Jjw3hGG4L7V6N8/fVm4dnSaz8+9Lbvsl0EMmJ9YwSmO+gWXbF+C/MhlFJyt30mA2YDSok8qZ5Q5
	Pqv0iDHdzr6dOezjFddi8MCLYWiBEZ2HNYYDmcYuGf6WMlQoHTZt1dxE4Gx1Tjo5c7FystrvGAD
	88wZAuTpZZICeR1/X+OcinoGxVt66gMgcDoPq1p5kn6c9/OWYRloNrKfwvazcIq9SgXzGXDf5VR
	/Ej4eC1YlE5KXYfhYK3mXtPeCiFATsu+fmPj+Ah9E778k66m814n+KCsG5LHuKhMhEp/E+pkAv1
	vbivYBx09KvRAyQQOljAa+RvPqd0Sj4+/1NcfJe/yB6GRRCZ2Qx14J2VHajvr5xhnQt5wv90pdk
	OUccM2JDDPNrFpD6SdO/a7Gg7VGwLtVqYiwuJRJFTeqrS0VX3y1Se+EeFWrNk/EAkVXtnvmYyCU
	ejnZstkJOrGRfvodPxY7TsHjooHxqhXc3FwPnUA+hZAk+dzVjN2BnbkGhvgbpvQx7teyK13+bs8
	D5tult6jScx1ix3E2zfndJqTQufHUDVhAUTKTxt7AinRKygnYhmZnGylXo+LCV/XDX95o95fa/g
	urLXEvgVHo4AEX0/BBINVGeyL3UTNXXTyALhC/mV37obDHVyVJQ0gEyzLZXgDeQoJn3skiPxjg=
	=
X-Received: by 2002:a17:906:af85:b0:c3f:dce3:20c5 with SMTP id a640c23a62f3a-c513ac496d8mr571307066b.44.1795381530146;
        Sun, 22 Nov 2026 13:05:30 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:29 -0800 (PST)
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
Subject: [PATCH ath-next 4/6] wifi: ath11k: clear the crypto flags of the receive status for each MSDU
Date: Sun, 22 Nov 2026 22:05:23 +0100
Message-ID: <20261122210525.2076058-5-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122210525.2076058-1-julius@bairaktaris.de>
References: <20261122210525.2076058-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_130532_204710_4DC3E622 
X-CRM114-Status: GOOD (  12.68  )
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

Found by reading the code with an AI review tool.

Fixes: 2167fa606c0f ("ath11k: Add support for RX decapsulation offload")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index f8c08b8b6b08..6fdcd2aed7dc 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -2338,7 +2338,10 @@ static int ath11k_dp_rx_h_mpdu(struct ath11k *ar,
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


