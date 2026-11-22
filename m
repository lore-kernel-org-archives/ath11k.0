Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66657606A31D
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 21:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xV/m3phV;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=aABNvU3W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Sfonz9sz93lcK5gtS/Li+RwUHjpeRem/YyxXweufjn0=; b=xV/m3phVRFRSt8
	lnSRqqt5hKOG5Yoe0FGUOCzFLOo/i69fymcV5waVsrXqsQsixqRzLB4oKloMdi9QpXq3G7Wmoe5mm
	Oaqqqyq9+9MmPGZUybOblHyqONjoT11LiJowO8vfUPxM0J0eeHgqJkVFHKtlxVaEvxJscjKUfg+Pq
	Cx+bUcliauf6uCrciexCbswZB+xGJaFoWrdaiS/mb0q4/tC/PFoRILvJ6yl/LnPvcJUdDxyRq55Rv
	Ov/UFXPiGE674gqgyV4hx6uCeqzC2a51U6j9BvvzgRXA1bLqM544cIgeXo0qTZ+21qHpPHPJLt70T
	jbchbwo4mjvldZh02Pmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEkl-00000001kyG-2wF2;
	Sun, 22 Nov 2026 21:05:39 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEkg-00000001koW-2NDu
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 21:05:37 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c516a574bffso94221766b.3
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 13:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381532; x=1795986332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sfonz9sz93lcK5gtS/Li+RwUHjpeRem/YyxXweufjn0=;
        b=aABNvU3Wckla6ij77NpdGJ42uwlST+uJHY+kTA2oNGYBME80ukvmGVxj7/9ZG3tA1V
         ehShHubnLH0lRnEqW6FYeAanjQtYXZDYVJj3incLi+VTcnfiLP5vZPCbvLlglUxFq6gD
         mQ89gl3uFs0UoRoey5MwuMLsvAI5mm4/6qUviFvbv+KT8mNCyF51ClwWNt2mLrVC6scX
         lI9Lb7IF0a5InNR/EjLUXUm+4v0KeXH30LIDWX7gs3T1ZOC86D4E/HsANsXW0Q/32lkd
         RLV/s7rlEUIYFRKvgXCUZL5YHur/5v5RgppxhYnWNGrYRfEi6LyEIA0ucCBw0Zyidknn
         pk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381532; x=1795986332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sfonz9sz93lcK5gtS/Li+RwUHjpeRem/YyxXweufjn0=;
        b=n92UVQRpkKdmI5Bh4bWSBEahB6jdxn025XnonO2u7yixDEYVaif68Al+bjyjsRMsyK
         NxB9sv81GjCJNiXFMLcXpslDfk7KSsyHRV5WQh8BtdVVe9VdVH+IGbqZqLy1jtU3+5Nd
         I74rZhAfwGXvqvdngh8wKYxyvkcRemXc/9aLmTGCO1VJu9B9MKLFTmgLZlukB4XurP+y
         WQjV1gDBfeoxT00FYdFKKvQfnGpx5UTL6VPYZcn8sTSM7ILYDrbi2BHpgxFmfdjiqAfh
         dv504RWMpd4avzgw/ENeiMkN7hAOBXdEOuhEiIfrG8MuXhWPHvkaqOmlsEqjkzi5VXdx
         c0kQ==
X-Forwarded-Encrypted: i=1; AL+hErGz6DWLBap/IQsSGB7YJscKe4cSN5cIZwem4KQxAOmFfn5Dbuf5/PTlsuwCafF4SA8kFOdkzbw=@lists.infradead.org
X-Gm-Message-State: APuU4Z9l86rCi+UmkbEt6LohflGaaL0AMIIrLHBZKrFRjcC3NPahgNJX
	/k/OLV3oRExjV2u1u6DH58U+Y2DKItQ0oWpc1kXw9hfUaTjR4kNGSBfPBQxF8VVsPg==
X-Gm-Gg: AZFdTZcKslaXqBCJ/XkzSCdrbLtzDMc7gT6JDHVYfYIltwIfKMUUqiVoMZIs/EXFv4I
	9j3ETYeSZfU52Xz1fPP70kOyKcbyzYg09tPsNcc5IPPe1Acwvqrep+wEZuc8cdLf8eeFcL2h0FQ
	HbM74SY6SFjeac9PSqXWHMNecGGen0hDMJW5hurSH1foGfVZMtT4txRKz36Rl7x1xJLoXLnizK/
	4SZTPD/5c9UJNj2R6WyQ6/HXGA2b8bf76cy7X4sp8lUr16JeVReWy6jtswCpmsYPQ8+e5i/ODg8
	WeX/eBSdDoeGVwnSKehA5RUefKDK/cBr0uqCNHDhSns3nkqtjHFQVG11TPhfaa09uDVs01cUNcJ
	AsyzQKydOpi7VWFKz7RiHeZwvMHDlNFnFZpH/waSeG98L+ARWtMDxGrrKRkvFxQPUBRAdygitLR
	fa+1dq6F7TwSNcp5PEABfu7mXTbPV3xr2ZsMaSxXJppEd6+/uw7ZD1R2MLtZTOnNPpMNvAhghWh
	ZVYYOTMa9JcAEAN70LkKSh+zIMLqcn3lydDtbzu1+CWfkijEwU4uGOgW/eDErzc5+e/OQ+G0MLJ
	jOLpkpno3HqduSOHvptBuNLBvUJ/Dtq1bDVNyUM2l2SgwpA2ImqouaDn5vKbdhxnYyjLMGSYAXg
	seNajkrJ+o+qxYHO9Vi9nw/guuWeoQ0YZdet5Clz6SAixOWY0aWzESK25CkBsIyEOR8k9ZFBhHb
	ZQWP3Ut/nd2NWS31/r9pZXzRgmmzAZMs5uktnhkwV5OzroKbVqZpGWaRKHYxLxatsGpyaW5vuN1
	dDibDkyeKXzz39Sxgih769h9lUp4ZIxIirqoFXYcMZsww83suqvVNsJhTLzn9RAyQtFL4Z33miv
	tVKQNP07Bgv+iAW9kYzoyiQLL1pA3PC3Ef2bJG3T1l77JADTeq4La+G1ZGKitTpY3HJltHPX4Q=
	=
X-Received: by 2002:a17:907:d1d:b0:c3f:8c92:3b51 with SMTP id a640c23a62f3a-c513a47e325mr894924966b.4.1795381532562;
        Sun, 22 Nov 2026 13:05:32 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:31 -0800 (PST)
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
Subject: [PATCH ath-next 5/6] wifi: ath12k: clear the crypto flags of the receive status for each MSDU
Date: Sun, 22 Nov 2026 22:05:24 +0100
Message-ID: <20261122210525.2076058-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122210525.2076058-1-julius@bairaktaris.de>
References: <20261122210525.2076058-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_130534_711912_2B173224 
X-CRM114-Status: GOOD (  11.08  )
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

Found by reading the code with an AI review tool.

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index 4a57d89669ab..fac60041d3ec 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -411,7 +411,10 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
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


