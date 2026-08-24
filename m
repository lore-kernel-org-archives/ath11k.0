Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F11C61CE2
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 07:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4iOAeD/vez7o1BoFsDFbdz2zh1sUHtZ1x5O3PJ3hJw=; b=G5umWG10Y/Vp/89ryuZ+9u+C4S
	STx3LpCY5VrnAS+2emk3Vtz0EHN42CttqZCeZ0rNKXUO42Husm1rYxlny5GSBv6qHArItnNrwyp/S
	5VGOmg64feaRZDP6S4PMEIynNL0HHMpHcDQh4XDMMjqVoZQslj59/fd1R2ChAv1tlOJM6CGLMZ8A2
	M013ALv9ZU3UqQk7v+EILqKz4HuKvXETdMpOv+9nBpjR9Fwdi9pdrfI0qgmwJhtkAfSAwDKFKdTD8
	IDPNs61ulkC4UilIQTUnCWEkotrq4ioQjpa0QPRarcU5ugb/GAE8tlYrfZMk3KTCdZxRhgvhHBH9W
	V/FG1g/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKh-0000000G7IR-130Y;
	Mon, 24 Aug 2026 07:43:03 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKe-0000000G7Bs-17dQ
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 07:43:01 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c1670dad7a8so546278266b.3
        for <ath11k@lists.infradead.org>; Mon, 24 Aug 2026 00:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1787557378; x=1788162178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4iOAeD/vez7o1BoFsDFbdz2zh1sUHtZ1x5O3PJ3hJw=;
        b=wL5ePz8gRYgkQrAUsy8E8saCQoh+vvNb1jL33aBubVY7jvPxDZLx1FAESAz+TS7TYo
         YDdCzq6Nkh5bEA6Pia/btpt/rSEe02R9FRa6UEwNRdG/eE/RboBDPX7y8IwANnKYs4pi
         87ia6877GO4ADLpeoXlPPlsBmmcC4XUN/2fCToEuDUToqXe9sM/t1cfQx8pzRX+TaCsh
         EA9fhR6qy8ySeIPotixG2krIOOg3QfJW2b2K2SRmTLbzOenyfmWEjD53K7dtagsVWPfM
         rjCHrQdaWbF+/2xklPmzH9iJOBt4ASKvO2ycfobwyeu0SOKlx5psAZHyXjvFfNfXffnA
         HoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557378; x=1788162178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b4iOAeD/vez7o1BoFsDFbdz2zh1sUHtZ1x5O3PJ3hJw=;
        b=CwNRS5yjr4sHme6PY8raCQkjymYuex9BhWUMysse8uGrpABkQjm1/Nkt0t+kbCuoZb
         nmh97AF2r56uOkKBytCnNMJX8MBQVrQDkyUFIgTJcfb1gltP3He8aLtZpagBP3E7XhnN
         l4Z+yFWoFd3IP+Dw/3wqBZXDRBD2XbYNQZ+luiE3cLZpW8w6EfJ1YR3YEUfvcY+bULB5
         86Wy0dNHM8ZrNTM1mJ/I2rbYF2DY3Q/XA5cAzyRHS/vYvU9ns7R4QYex6PKq3sRfmIsi
         QWXhC+dciJGliKGL2d3JZ4dRfZImeNjESon2P88NRAVv/LawlcZxtSAp0n/tQCuyvJ+o
         zgXg==
X-Forwarded-Encrypted: i=1; AHgh+RqiME5BLIaLQpFmmhDX8mRK5RfcNAL2jM4m3asIucV+9Eqy/Q+wfTBT7Qo5G0w/dX05b2uAR9s=@lists.infradead.org
X-Gm-Message-State: AFuF++kyG1u7FLDiih3M+rn5Yx5Qr0P8OQUqeH44LEFOEkP7SvN8wttn
	l4LkhcZXPVf01mpecHItRw9I7EmUkKFinBC2zqBYxpix04fLFTcZrAQIPfJvA36yVQ==
X-Gm-Gg: AR+sD13GpcHqXlfi76YmBd5fmnUkPafEf2et0rdziDn/ArfL6MRoTWgT5yr2jxmBa/5
	bESYcngeR8McK+O3zJWzsEfSgLL5EWixNXOCAeVMttAxBX23LDIWybHpUCY2ZoFd7JvC+ClOg6L
	lkuh5+YUQ01poJoYFXd2aogsYAkzakEqIArkVNj38Qhhx9/ItqewJZwdL68rhZr5ci+YDhRch2S
	kfGYxGQZ0+cqE8piuim+prg/1nLUBHflKHCKGm6z9Byw5yAi6DeOiRhofms1zdV84ocpUs6ITvB
	hK/jYpPwFHpkvTX2+4CHYK6q1dSkc60z9Zr8TIqE/b8u6L898D8vNdzE6i3NMhIXlkgt3YPBxi2
	4yFIfd8i7yEmrh0naQkie9Tl3MqKOVAJVOKC3GWHpnf149cnCVasRZ/MmSWFC8dkKU+Wv4VzjRw
	2TQQZv1Yy54ISBoh5pkd3hh7axfp3KF2T7eyzMqFFlsWCiB+OlT0Vm50vWs9kBxJ/I4g98+GffS
	XtbeFqU5RPi7Gg/diHb97IeSAH4Mz1q0LnzVZGf6xll8lwpEYAsDm0E2JPxSmbIXCSj2szOC/Ie
	7trc9bDE676K2F8D1Fe/jH+PZNlM2k1Y0d/I6nf8IdFm/tUnDgaMVJLh8xCMoN8ENXnsUvkfgtA
	4dv23Gfjc1pi26aQ25tlhKbK9j9ZhSXsOgyWutmCA+u6ivMR/Qrg9xITIqFudsMyyA5+SY5gqtf
	p6fC+1Flu11G87lQ==
X-Received: by 2002:a17:907:3d56:b0:c1f:e9d6:2a6f with SMTP id a640c23a62f3a-c2469f9991dmr2918228666b.0.1787557378200;
        Mon, 24 Aug 2026 00:42:58 -0700 (PDT)
Received: from Desktop (p54affeee.dip0.t-ipconnect.de. [84.175.254.238])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249685ef7bsm1261549266b.52.2026.08.24.00.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:42:57 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH ath-next v2 7/9] wifi: ath11k: charge received airtime to the station deficit
Date: Mon, 24 Aug 2026 09:42:26 +0200
Message-ID: <20260824074228.2114579-8-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260824074228.2114579-1-julius@bairaktaris.de>
References: <20260824074228.2114579-1-julius@bairaktaris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_004300_384407_73EF09E1 
X-CRM114-Status: GOOD (  16.11  )
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

mac80211's airtime scheduler is configured to account both directions:
local->airtime_flags is AIRTIME_USE_TX | AIRTIME_USE_RX, and
ieee80211_sta_register_airtime() adds the received airtime to the same
deficit the transmit side subtracts from. ath11k passes zero for it, so
an access point serving a station that mostly uploads charges that
station nothing for the medium it occupies, and the deficit that decides
whose queue is served next describes half the traffic.

Register the duration the hardware reports for each received PPDU. It
arrives in the RXPCU PPDU end TLV on the monitor status ring, which is
subscribed for every radio, and ath11k already accumulates it as the
station's rx_duration. Charging it once per PPDU matches what the
transmit side registers, whereas an estimate rebuilt per MSDU counts the
preamble and the interframe space once for every subframe of an
aggregate: measured against one HE station, the per-MSDU estimate from
ieee80211_calc_rx_airtime() reports 16.9 s of receive airtime where the
hardware measured 6.8 s.

A PPDU that reports no TID is charged to BE, matching what the transmit
side does with a frame carrying no QoS control field; the value cannot be
masked into range because ppdu_info->tid is ffs() of the TID bitmap less
one, so a PPDU reporting none leaves 65535 and masking would select VO. A
PPDU from a peer with no station entry is not charged to anyone.

Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Assisted-by: Claude:claude-opus-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/net/wireless/ath/ath11k/dp_rx.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
index 05fb34e70889..d0da72b04aec 100644
--- a/drivers/net/wireless/ath/ath11k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
@@ -5343,6 +5343,26 @@ int ath11k_dp_rx_process_mon_status(struct ath11k_base *ab, int mac_id,
 		arsta = ath11k_sta_to_arsta(peer->sta);
 		ath11k_dp_rx_update_peer_stats(arsta, ppdu_info);
 
+		/* The airtime a station spends transmitting is airtime it takes
+		 * from the others, so the fairness deficit is charged for it as
+		 * well. This is the duration the hardware measured for the
+		 * whole PPDU, which is what the transmit side registers too.
+		 *
+		 * ppdu_info->tid is ffs() of the TID bitmap less one, so a PPDU
+		 * that reports no TID leaves it at 65535; charge that airtime to
+		 * the same access category the transmit side gives a frame with
+		 * no QoS TID.
+		 */
+		if (ppdu_info->rx_duration) {
+			u8 tid = 0;
+
+			if (ppdu_info->tid < IEEE80211_NUM_TIDS)
+				tid = ppdu_info->tid;
+
+			ieee80211_sta_register_airtime(peer->sta, tid, 0,
+						       ppdu_info->rx_duration);
+		}
+
 		if (ath11k_debugfs_is_pktlog_peer_valid(ar, peer->addr))
 			trace_ath11k_htt_rxdesc(ar, skb->data, log_type, rx_buf_sz);
 
-- 
2.53.0


