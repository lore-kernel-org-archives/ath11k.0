Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6B1606A325
	for <ath11k@archiver.kernel.org>; Sat, 28 Nov 2026 17:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4rN43+eP;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=oJTVggdQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DMbvLhVt9/6Byoyb38QB8bC7RSl2nRVkt3CkxY9/jJY=; b=4rN43+ePoYyQ7M
	1hYiyTIh7/d9+OtsFixemsbLmyipHvGKm1z7KNrZNxNZ7n7TuD/ntWpcbC/qWPLIZLBuvi+eOxVGf
	Zp51IB9I2Wdda8bGWhyGTKI0k7/dWwYfkifaa2sI8oRhiXnQnZSI4kcBYuAQB6aX7E2HC27yzKuKx
	aBhSy0WGH/f7HDOqbknl+3FR9m2WPJbBjJxpy7DwcsnfUNIHW9nOGmrplZ//SgyVgF8dpiLUyerAx
	rmQ0uvuBfEmJOFBxDkZlqg7ipeCHwTshg/xQsMYzsobx/C+dwXLrkjCl3MvyhYoE7sM83vY+SWc4q
	aVJRVqIJxEVqYQEb1s0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM89-000000011Ai-198k;
	Sat, 28 Nov 2026 17:22:33 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM83-000000010vM-1VLJ
	for ath11k@lists.infradead.org;
	Sat, 28 Nov 2026 17:22:30 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so1505011266b.3
        for <ath11k@lists.infradead.org>; Sat, 28 Nov 2026 09:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886545; x=1796491345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMbvLhVt9/6Byoyb38QB8bC7RSl2nRVkt3CkxY9/jJY=;
        b=oJTVggdQSzycktPYSaI0aN7LBW8b2LMCJGLvP8UIBtYW8pGnpxAwXnGlBI0zXbfixy
         nh/O2D5rDFcbSNlAXBHsK00ySA8ieverBJgtqyX6Cx6/zmlPswalV7DsxtwyVOnZP6c8
         3uPAb0D/k1KbZ517gKFnpdKy7StA2LwiyIMZ1IlLGvM9ioPYHDdwHlDiJJbXQ3w0MKnY
         kOqTqAdlUIpyBwAKqm9qBJ4jQts6rXbG+sH4cESy+MJsmvVPR1WU0ntlsBHrXL8LIcxC
         vx9ldgxREH3gVeMqbIZxjqNKCebk677MFXwlFIX5hltVugnJ+YPkDjp04q/ZGTQwNPQf
         gHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886545; x=1796491345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DMbvLhVt9/6Byoyb38QB8bC7RSl2nRVkt3CkxY9/jJY=;
        b=bpSrSET4LE+n7htVmW/qdAIaQFYPEocPAXOCyzb/LOnskI8GkweYv4D7PxO/TG61JW
         U4iDMP3MwCzcowfdUoJu2/zzj+BUUht8RIK4ncYHeUoUnYQmee40WfXXwuborjZCrI0f
         gXb/GBRxeZK9kATF+d0WXxNPi2NccwFCjetIZGuZCV3GNaI7QEmQ8VdeUy9GIbM35LMS
         lN1uFXOfpqLOe18xpZb7B/VBKXYV6bo0WpvllScYHHm1TBstB60ET/fna0vnh1TC0vZk
         ZFG+Vfsch90Xd+SUEUtMQtcHkXYoqhoMwNmNyffWHy1hDtAOKV/7Ws1ciZ6VslFgcb/n
         Ki7w==
X-Forwarded-Encrypted: i=1; AL+hErGdCSd8Ksgji9+IK11fQ+6gnFVscwVDIUZTBNJTEeG4OUtT+A7EJRkkzmj8TNmOpJopbCGGH04=@lists.infradead.org
X-Gm-Message-State: APuU4Z8HeYLRCFlaDf3BBHW6UbaSDMGxT17YpGswOyqisKFToJsMCrHQ
	xCkA9bdHntNZnowB+ZFYty9vXy5GKJUrkU6tK/hWsxfCu8z+r54xT2JN6Q4MSjQR6A==
X-Gm-Gg: AZFdTZciibgDEMDfXoSvHt1OmDaaz0HAOStLevQ2wqkT4tMI2Ofsjj59VSnr9HPURnd
	7VOxnmW51zikWEW4oBFYX+z3SlATzd5Adn0HAQsFe8Pe3cTIpGaiw7rjSysuPBIgeVA4cwqpArX
	Ic5KuWIGPyDHAl0NKZz5VTTZT4IOhh/lIVk1hHqgK3dolNCUf6Fo/fwrQK98DLtYTKmP3QzepTU
	UB+7wsir4K657SrfMsAIuUhZSjCAOaSQhH1qOkGZ/p6BgEdcauZE1HeeSc7HhEqLoGx+zyNCObm
	0j2CGiItOmHv1g26VwlZUzRfRpr2TdSJ/H480N2YwDmimiCx4Vwq/g77Z7lO+plYiSXGkAL9ddc
	6e07cx9atSeZ0SZeQMh32J8uDd9LdkNMEwy4B9VDBe79F5hLp5JiFcL56e386TKu1PRA6kbQ0X2
	Byow3DWQMncQL70FBeZQn5fJJ07CZVNp22HHns+Bu1WV9Z97fw2yvH8/HDFUNw7wCEBoLvFMEhz
	65AD3/w2TNhO36OV8yJo9pQ2jFrKMpYrxmy8BC3en33GbanKcDEg8Po6lrTgotcbPpnkE+B94gp
	5dMn4N+GRb1dXQ4+C5kzCAffvLgIFLeqgBKBv00cr72dZC52IqxNtbH/CmchaCH6v9jLG4MO3+N
	tpMp9FHuIdhYj6N92SSGdZMiuoHYjpGJdA5pX4j265wreH/3winEMe3X9ONFVXcQLmBM3Ns1shR
	ucpqXhwBDl1lhkkX5wJgqws80ulo+nl7VEzLxKaB1zdpK1d0Qnue2E/yBRJBgx6JZIjDraWrSU1
	rSl3uJONge9PDRZVkpXTnUWpW5FxcQn5LLaVt+SIOJhcoOZJGMD119ZxD8nsoGCaCS4YmLAXsar
	r3zq6VORR4f0ZQ==
X-Received: by 2002:a17:906:9c03:b0:c46:2987:2169 with SMTP id a640c23a62f3a-c513a84c864mr1823750566b.24.1795886545446;
        Sat, 28 Nov 2026 09:22:25 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:25 -0800 (PST)
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
Subject: [PATCH ath-next v2 6/6] wifi: ath12k: clear RX_FLAG_8023 of the receive status for each MSDU
Date: Sat, 28 Nov 2026 18:22:20 +0100
Message-ID: <20261128172220.922376-7-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128172220.922376-1-julius@bairaktaris.de>
References: <20261128172220.922376-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_092227_420674_77D2E4D4 
X-CRM114-Status: GOOD (  10.41  )
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

Since commit c4aa897fe234 ("wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023
type in Rx path"), ath12k_dp_rx_h_undecap() sets RX_FLAG_8023 in the
receive status that ath12k_wifi7_dp_rx_process_received_packets()
keeps for all MSDUs of a REO reap. Before, ath12k_dp_rx_deliver_msdu()
set it in the copy it hands to mac80211. Nothing clears it, so every
MSDU after the first one delivered as 802.3 reaches mac80211 with
RX_FLAG_8023, including those that carry an 802.11 header:
ath12k_dp_rx_h_undecap() rebuilds one for EAPOL frames, for decrypted
group-addressed frames and for frames from a 3-address peer with both
DS bits set, and native Wi-Fi decap delivers one.

mac80211 hands such a frame to __ieee80211_rx_handle_8023(), which
drops it when the station has no fast-RX state, as before its 4-way
handshake completes, and otherwise handles it as an Ethernet frame
whose addresses and EtherType are bytes of the 802.11 header. An EAPOL
frame that follows a data frame of any station in the same reap is lost
this way, and so is a decrypted group-addressed frame.

Clear RX_FLAG_8023 with the other per-MPDU flags in
ath12k_wifi7_dp_rx_h_mpdu(), before ath12k_dp_rx_h_undecap() sets it.

Found by an LLM review (Claude) of the code.

Fixes: c4aa897fe234 ("wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023 type in Rx path")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2: discovery line reworded.

 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index e37353445749..b74ffcd94a87 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -417,7 +417,8 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
 			     RX_FLAG_MMIC_STRIPPED |
 			     RX_FLAG_MIC_STRIPPED |
 			     RX_FLAG_ICV_STRIPPED |
-			     RX_FLAG_PN_VALIDATED);
+			     RX_FLAG_PN_VALIDATED |
+			     RX_FLAG_8023);
 
 	if (err_bitmap & HAL_RX_MPDU_ERR_FCS)
 		rx_status->flag |= RX_FLAG_FAILED_FCS_CRC;
-- 
2.53.0


