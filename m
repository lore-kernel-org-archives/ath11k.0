Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD588606A327
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 21:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2B4lc/1V;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=BLZGL2V0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZrC17kLP85VhrLnJZWnSDitIpYddK+4irtfGQwA3Jes=; b=2B4lc/1VTT4gK0
	9IUVsQ/T5N9U29TjIdDMvkCRGdnI1KjcoAMWI49bLl/OejFU+ia9+pZ2/41wTnimBqyWh57OdDfTm
	kmq6LWkGP1WwqV1ykjvCQ0G2VhiGP7944YbJCDxUPawUuNGfPmLmSWMRin/+jX6M1go5IFci3eBxv
	wHO3l2OwgKJqlUtLGDZpfjw88C9Jf8L2uPfMzUodphgyDG7vTT71mLmEQE0NJhnsoeYxg/3cbByP6
	3ENaEt5GM+WUHCvlwcZxpNDuzF3XzkNEOWvJBgoPjtgHV63FWgYwSAe9ncmCZ2eiGprekGkd/9yd4
	+z+yi23QKn150fMQAwiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEkn-00000001l1m-0liN;
	Sun, 22 Nov 2026 21:05:41 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEkh-00000001kqU-1nsP
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 21:05:39 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c515369b627so211196066b.1
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 13:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381533; x=1795986333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrC17kLP85VhrLnJZWnSDitIpYddK+4irtfGQwA3Jes=;
        b=BLZGL2V0VmqkhSgJyhn/D8yZhPJ55zX1XVGYJTnLKvgj8orhBvoCnKGPxIdl5l17+t
         YP2PPNXAqQOhmAZhGiqCIeGyubHs4eNqiIn5s3XI71q0fgx5HDGYoZ1cvQtPQWAq0tq1
         jHyFwM7uk+8jyRpbuJ3jl1i0N4NUufEph3+HQsMA1K1q8DUTg4TF/JiNmjV0FtpxepTS
         GtNL0/ghAeIJsVQMnSt87+Nb7PlJBQ0eoB6PiamEG8eX4LaoZDQZ4gmo9KgfvUECnmnt
         Iwts97Nv42j7m64vC1h8eXLJzOr8YKV3YGfQOGzPr4r9TJxg9ZxL6AFCUT8QQBOnZfJH
         scSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381533; x=1795986333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrC17kLP85VhrLnJZWnSDitIpYddK+4irtfGQwA3Jes=;
        b=M9Ztlt/Za+VCaLjFgvYcw9wuKJosgjCEFVQrbDCLcu2udKuvRVKXlpdl0J0PDa2mg+
         etbtRlI/qtH0FQ1TmWquHcrlET9NjozyzX3gkgOO6AaUhNcsceZMeIRsazhFVbZbAoWl
         Vz2K0FjU/63L25Qaz0x6o959kqei7mMYg8z3r7ddINfYgzq/qICTUguIC5VF11CZiC9P
         +NFwnXx+k0CMbvXXJW2RYDeQlkBAA39Kyi5eirjsd0toCWKeop4U93tSsXXtZHMXreRx
         FsXH1wP3coRJajZepQ+bLCY4ryUp+e4w1VmzwDtBl+pFCPHHN7S89r07zwEjp3/HqLzn
         C2KQ==
X-Forwarded-Encrypted: i=1; AL+hErGL7G+BI9mgy44JGNCFdjmYUHyALQfgiqLrufya4ApofMLvfPuMI90hMbLH4MzRcAm/V5qEPV8=@lists.infradead.org
X-Gm-Message-State: APuU4Z9RPjRPY+0tc61ht41l+yTuErFLq3jujh/YqMra0BGgry6WxpWY
	3sJkp/TnNjp/cU0Pr3CO5NHjn9gmTwUTcc3+9WLd3voqeMj/DRUHUMV+8hf6+c6siA==
X-Gm-Gg: AZFdTZdF5fUDn8YFQLPHDNFqjL4OV5h2sp/cChfnw4bGx+74QoDPKxHP8wPFcYuO4FC
	aWp91O4CQefR6ovUQp646bpFhwqqBlyOCCbDrz2AJ+7JTodHUG9Wsm3WRM86ko/LJtaFS2y4lld
	njpGuGIKGulOu14vQ9p9MDIw/kBjF+pgnPxbMNpxX8ZT7YskaaDU+qH9v1ilq48Kiug5A+Exud8
	ML+OTq6EjDXidDXgsCrWBl09xiEewH/Qr4MSVJwv/CWTTu2MR3dI5IJO68731A/gOFKtUcZ/Nx3
	X6kjpzzTZBUEp17OQePxACGJnLaKxNjduGoIoaukmDmzpCLE+qEu/UJJ3PqOxyhMW/oG5Kghb5G
	LfO4aCBxQoiMoIw8ULe9rjedsH7ElzEXlWpBUhPdXbZIRJDRQ5hfjOHWm/GEHa2AIqlWnx6uLkV
	hR/evme1HhXCksOsDR8LBA0VUv28J4uhx70x28t+K8aBD83e2pfYdsY/M1xjO5xNZT2Pw3hBrzk
	vJlJHUzHb15Z47Ri7iy82Qn4VXCJdkr1ECjpNA8Cki0FPOQx+pcDx+k8IkLjzH1m0vzJx0Qt61t
	Xb4+oL8YK5jVB6oXgQEGri+Q+RsUtoZkeJT9XGCrzz9ew/sTLsN+fAgSa9Ld6fJNk3DTotelwwP
	g2TU9zlrUSZvDLgohgauI5soicP+mBxhyanBf6vxyXkJSXtbUMjfCGDLq6wNmcm3iRiLADF97JS
	DPrqGxq/aq1dkw3M+SfOtN+kHw25HzPpB2MfV3epPcAJDekFWrbgoOl5kKb+gkWrrUXeNWVQLwm
	popemNBEtdO2W74Ghmig0p+qskNGKzyg2T8o6fW9WSJbDnydWvEmWgPhuhFYjgfFOF3Jqx8PgfP
	fZcVPGUlGQwfHIUfu1SR9nbqeCQKPnoxqzUimOlS5Yrp8fNY6gNBLV7eGZuvn8aC/2SskSSEnp0
	=
X-Received: by 2002:a17:907:6e89:b0:c51:59c8:a4ec with SMTP id a640c23a62f3a-c5159c8dc3bmr396957066b.1.1795381533567;
        Sun, 22 Nov 2026 13:05:33 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:33 -0800 (PST)
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
Subject: [PATCH ath-next 6/6] wifi: ath12k: clear RX_FLAG_8023 of the receive status for each MSDU
Date: Sun, 22 Nov 2026 22:05:25 +0100
Message-ID: <20261122210525.2076058-7-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122210525.2076058-1-julius@bairaktaris.de>
References: <20261122210525.2076058-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_130537_392745_36810BD6 
X-CRM114-Status: GOOD (  10.55  )
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

Found by reading the code with an AI review tool.

Fixes: c4aa897fe234 ("wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023 type in Rx path")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
index fac60041d3ec..1d52eab418a1 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
@@ -414,7 +414,8 @@ static int ath12k_wifi7_dp_rx_h_mpdu(struct ath12k_pdev_dp *dp_pdev,
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


