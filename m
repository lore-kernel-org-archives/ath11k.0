Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C6FCCA490
	for <ath11k@archiver.kernel.org>; Sun, 18 Oct 2026 17:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCxxJcbhpSt1i5F/1qHiqoph9gxQorPREPwC1lnzTjw=; b=CAIoomTtICtnquHWPXUphpaBHp
	Bpca/Qd98jM+H5nAUhjNHy9+ZuXU97REIceljy/35YpqZN6kESnMaFnweBfJ+09sKgP66PLJjhCth
	24jo29vGSbWk/RTqmM90BZrAqi14kbk+WTbnFQ+w7OTYYSR85bui/WB+vo3yxfCCqfW9YYTf2Cn9n
	uXFtDGX0vBRvXqEs2W0wwKW4U+uLGFyvHtfXuKfRsV2vkts3jZBpexqTSh/dhkRQDZscwz/WiehFa
	rY1A/qMHcMxhfCjCB/DWelfbRen5jJBULunCIbOtIeWARppsPn5a6CsJzTr06SFqsZpL7/mVocXq6
	xkaPRQOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIV0V-0000000675G-3HVl;
	Sun, 18 Oct 2026 17:49:15 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIV0T-0000000673O-425G
	for ath11k@lists.infradead.org;
	Sun, 18 Oct 2026 17:49:15 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso189927066b.2
        for <ath11k@lists.infradead.org>; Sun, 18 Oct 2026 10:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792345752; x=1792950552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCxxJcbhpSt1i5F/1qHiqoph9gxQorPREPwC1lnzTjw=;
        b=u8ttgXzCnfoDP1lkzPq/e2p6iphs/jKPoDj4O+Gq0NtcCP4BQpzpz81vMm3o584qYL
         EVboNSIzgfh11x9lTF0Tj6j8pdnOnW2P/DFHs9HbcvaYntwycWouXJph8T/MF7Gz0JHa
         1cUtJwpKlOgZZkjGWpiKA64xKyUXh16DMj2snjCGVDcDssKWo5RTfiRc0uMcBjxYbaHc
         CXifAH5jmbwW98jdO5BOC6fwU7YtRvZ7yBADn2s71gYyOV3NELs7eBhKKHCyguQZWNz2
         0tiewdtReha6R0z+c8r5lXP6EpeEDYljrJke7g28NfyDVU0J8B5ciCjVh5xZMWbq5KIa
         cUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345752; x=1792950552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZCxxJcbhpSt1i5F/1qHiqoph9gxQorPREPwC1lnzTjw=;
        b=jLqZTUZ3PmpLvGrPwRNpFOdaBQaaSQf91JIOr/ckJlIMlq0spgWnQqSiuf0ARdZOOf
         W22VDXRnpuRpFegS8/6MrzdMQqMwIcKibCIqmV/4N8LOZIFjqoSen8x6k5MuU/t6oyuz
         nRUOXP9t+/AY3mICCzgp1SxxsTr00uaLnqiP2B73XkDjVw/89+ma7c1CBpyJDN8BZsua
         T13b66KHlfb+5V8k7h9nam7KHojg4Q5TRMTqkuY+K4UQ/JkLL+x+SMAyt6x6j0fpfD3J
         wAGP/Di19AoCZN76E9B6s5sBkTTibXXB8j1OlZhV7yyPt70j9sH2+wZuR23GA1OOQ6J2
         HaTg==
X-Forwarded-Encrypted: i=1; AKwUvBxyIIqJT0tEnkMNzpalR9VdmlUFBA6fpAqQ8kAlrocVtcYl8guiGCJ1uu6Jn09dki/VNjfnbr8=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ1oTqTgqcBVJu9+f2s6ydONEprsIDFkhi9SG6+rH6OiJPgDwtd
	Ziw0osPHRjLKiO8usr3z6plMbhSuYbe4InKmPOu6w0BNYGKxxYedq9dWTjbKmP+u3g==
X-Gm-Gg: AYBFou3n/4939YBLO3E0hD0C5Pxdp6h9hDCI3+h2C7tciUschTTzJ4FIEsN2948Cf5Z
	wLuClw9HFn7CbJvAXiq032ELl4fPQEvAuMSYdVpT2iWig+qCIBH7tK7hY3b0/P1iDSNEzJxvhAo
	BwEmns5BFkIGj6Z55XoXzaBD77nkr2wc1trQE8gWGIqMDPMLRRYZpsGdXbrYLywsmlV+tsXNcTa
	StqYQUI84geLTe8dRB5qD8g8HSAuw5TTTNtHxAzDfyIcENZWoc/2wR7kWVgumW59KjgnG2+HNt1
	ubt2Ma+EJzB9qgu33khopQGb+4riCUpG9cHpJQuhx7MH49Wh26HkqqVcMWZas06VI6apX9dHR3k
	lZSnrnz7yVV/cWW5VXUtGYaEu19nTRO1rml02/wV3R4uPgiC+Di6RbWdmfKVcCXhmtwIyBrPod/
	fkleA5IAq5MRV+8YLc2yRXri6LF0aVSo9P5owLJpEvi7Xgim9xOqA9R5hJDaq5drCdKZkhK6wV0
	sVrTPFT/zAgpc86JF8Wup5KkO0DOcuMPCccAHgFyJXKlME7xYBf/Npd7UndFeUSRCp8gG+zEu7G
	R1J6Z+QcOxjr1lEYENL0P08XwYMEl1tgUSucmm65MU6s9RZ0edXnwRsNVFDu88oma+xnI+3Gv6M
	QkKO3zVzJtU65pNxP2WuSYx8No6jOGZnaI7OhgmiBjRVTbkbBDsBecg/d+wNhL9Jc09iHmj/6k/
	HEUvTGWMK7
X-Received: by 2002:a17:907:9707:b0:c29:f5d8:9c6c with SMTP id a640c23a62f3a-c419e93247bmr367634766b.27.1792345752006;
        Sun, 18 Oct 2026 10:49:12 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm291056366b.76.2026.10.18.10.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:49:10 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tamizh.raja@oss.qualcomm.com,
	jtornosm@redhat.com,
	baochen.qiang@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	sriram.ramachandran@oss.qualcomm.com,
	yaojiale02@163.com,
	quic_pradeepc@quicinc.com,
	kvalo@kernel.org,
	sven@narfation.org,
	john@phrozen.org,
	toke@toke.dk
Subject: [PATCH ath-next v5 2/9] wifi: ath11k: enable airtime queue limits
Date: Sun, 18 Oct 2026 19:48:57 +0200
Message-ID: <20261018174904.1757161-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018174904.1757161-1-julius@bairaktaris.de>
References: <20261018174904.1757161-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_104914_015249_BA2F960B 
X-CRM114-Status: UNSURE (   7.64  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Without NL80211_EXT_FEATURE_AQL, mac80211 applies no airtime queue limit,
and a saturated download moves every queued frame into the hardware TX
rings. Set the bit. The estimate uses the rate ath11k reports through
ieee80211_tx_status_ext(), and the 4 us floor until the first PPDU stats
arrive.

With the series and the AP pinned to VHT MCS 0, a TCP download to one
1x1 VHT80 station keeps 22 Mbit/s while the sender's mean RTT falls from
526-587 ms to 42-44 ms (three interleaved runs per arm, default limits).

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 90a0404a101a1..6f4462b7d3f15 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -10652,6 +10652,7 @@ static int __ath11k_mac_register(struct ath11k *ar)
 	ar->hw->sta_data_size = sizeof(struct ath11k_sta);
 
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_CQM_RSSI_LIST);
+	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_AQL);
 	wiphy_ext_feature_set(ar->hw->wiphy, NL80211_EXT_FEATURE_STA_TX_PWR);
 	if (test_bit(WMI_TLV_SERVICE_BSS_COLOR_OFFLOAD,
 		     ar->ab->wmi_ab.svc_map)) {
-- 
2.53.0


