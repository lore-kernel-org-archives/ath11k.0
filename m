Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F65660A381E
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 18:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=khMBwdML;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=lDGUJuhh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=S6XF6A4HETfjGyZFbXlO8ZHE9ly/RMXooaBmSQIOc3Q=; b=khMBwdMLli/ANgJjdmVNDsy1Yp
	ZoDDdaJO5W0BJAMmC+zIvV9ixWiWUQ3TJQ19PvMncx4br/mRIX+R0jwipG7IlYUwWeX7Mk/873M1G
	YWWZu3awMdfpmWJODJqQUI3aIp3jMDs7UgE8CqVZH5upEw7/8ETb/E+HpsYS0xDVQTrpVkr0YHGSR
	rqkDTsfKSznygc0Da6nXuiWBqoV3tUFX0jBV2lC7i9+mnbDQOcZjQU8nOcE5HZUx06qyEstaE4ObI
	Jd7/3SfrEC0ovn/r2RxFttpman+Ko0HNH0vCQR+ywjlkue5LOvR/U9MDMgtz17g/5q0NJ8nYqHYmb
	w8mQCnUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2Z-00000001UF7-49U3;
	Sun, 22 Nov 2026 18:11:51 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVC2U-00000001UBn-1B1E
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 18:11:50 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c516a194350so73158766b.3
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 10:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795371104; x=1795975904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6XF6A4HETfjGyZFbXlO8ZHE9ly/RMXooaBmSQIOc3Q=;
        b=lDGUJuhh69CUv4M9YoRfdEp1IxkEr4mqy+D3Wb7COebsEJl5MczspyWU8fYqaFUr2B
         4rnThuVTwn2Lfyx106nRaxjEowlHfNOS9xwMAstXbiBAYuoib0fbPt1ZmGs91x3SRONV
         fHt1hljE92D67pkyX9XlpzXQ/HJBwWyrc8uiY+foYFW4wmfJXJND+pL6YX9RSll7qc3e
         X8gT3YKiKFO7ZEIW8kp1hoFgXq8O827yugk/k+gu5qzqspb2ylSBKebmiFf5F/ZSaXvS
         wTRK0QW+oWOozVL/BjP41MQ3k+EsFaeii3xALdKeCJWmYvP9a3yY2NgUhwuLIKsNV3kF
         qNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795371104; x=1795975904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6XF6A4HETfjGyZFbXlO8ZHE9ly/RMXooaBmSQIOc3Q=;
        b=K21Uxo1WLF1rxZJZUKsDaUAJ2eFak9tSLJK6kJnbjNUUozdmoe9NlbXq0sljJLD80o
         1e9nzaip+4dXBNzgbSg4Hzq0pCvyj4eIqUD7SM+YUnEDFzgidRYrjjKET5Vt6f7jOSxi
         SSfKHnr5srFusAfY6OEvLpm/e77IwSG0bwuZh/uaOmdWWyjbVB8pr540M0tWtg7tNpWV
         5MbLIR5zsf810huCB7uxTXzRJ+iWEp7eR0/jHR9UiZmeE32nYczIhrFqcdPKiLLBC+t1
         X62na7ykpaR9XwVWl2Y8pYiRd1c5GGN3BfNQ9om7+cA3Ke511slABkYA64VOL7r+58rQ
         z/hw==
X-Forwarded-Encrypted: i=1; AL+hErFzbnQ55a7DjNnbWAXE0S2EZ5n6Lv9fyjTfH/NCg55OLHPEEHTE6Af0oIdLQJsQRp9XpNFKXfo=@lists.infradead.org
X-Gm-Message-State: APuU4Z/WgOXW7CcdGXRT33iuVrdDc2PTBfYPdPWU9m3e+tzaNx7FQH+B
	VXtpQXXSRFnBA7Q/HN2WWiGw+M3I9DtF/pZn3zvRl57AXs53eMleruCILxV6OkNldg==
X-Gm-Gg: AZFdTZeEpCupu4CirNFNZRMb/Sqlg1VasFXwUIZyKeEFwylsnpPqQEEgSrIu7SJHdW8
	tqdqt8iVmvd2C6T544xpumc5PDlNvU3VuampZcCOP7+urY3ywkcJ99vDqv4waTtxsMdc6haQVjB
	OmiDoOkLg5m6LQ1wNMWY0AXvd9cTnn3orryj/vohdnzsVf/GdIyk0L83QgVtdsd6On6jiQhWyuo
	3dKcqH70Jp6AxAIXZSx7ZuQrio4nbxZ7D3lYfHROFZFLPWmR3qRl7fzJ3/rmrY2cjdOG3ZIasjE
	RZhygd8bEaqwoQYDIc1Hunbc539Z5kBepjIP3jXZqLWxoDcEhW2M+aqKbHvRjZOxJqHTclRGhNr
	xpR3+u5RucBY0XkZN0i2tV3ePgh6GclI+miA++NJnYtsU7RbxJB+6vCnG8Pme8LmUNsPsjJTtXS
	dAHVZ0Ii8452/aecN8PCW0mFXO5EaMED1bn3qy8/exSXzOLX+CXkG+Uy8ELB2ZjLKNBLHZDszWu
	CPwRqmRZF/LXXIly32rrJK6rVYReTDQGb+gLhzH/fdKtvpYl5rDsaBqxTdDvNZWA75L9HPq8/re
	9eaUwQlv6605hkY1R2vExBlB5Cz2dr8HTJXGE6EZ45WRh/uOTlNjW5i1N6EhvjOne5xahNW61I1
	LOg8Q6OEFbbfIW+yV+FoihB+fwdi8s7GV+1ZL/J47BZ6ESrodFHWOKftl8TGR6DdRN0FcukgC8E
	9ru9bQwPX/ykwvuTf4RkrpvMmPwFpcLdXHYwPHWrZgpBlW2p4eA0tNZDsskfI046bgyz1Vqh/t1
	mW7B18TjzKFR6tVhLnX7fWYqrFIz2XcDyIGOJo+mpFjqJ84Bq+A2UhKD4+HUDHGz/JeoOh/hVyB
	q3ysYIfEs3+pi2my+Kqkc0UOO7LQ0kKufzb1qL04ux+Qvr90X2G+NyR4G5PjRp9d4WpFKbiL3Gv
	wU3jNaVNDOTfv2v++pQs=
X-Received: by 2002:a17:907:c13:b0:c49:df95:fd0 with SMTP id a640c23a62f3a-c513aae2c7dmr781438066b.48.1795371103982;
        Sun, 22 Nov 2026 10:11:43 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a700f1770d5b08d979ed.dip0.t-ipconnect.de. [2003:f2:4713:a700:f177:d5b:8d9:79ed])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae88143sm325931266b.32.2026.11.22.10.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:11:43 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
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
	toke@toke.dk,
	Christopher Griffin <christophergriffin05@gmail.com>,
	Julia Lawall <julia.lawall@lip6.fr>
Subject: [PATCH ath-next v6 0/9] wifi: ath11k: airtime queue limits, airtime fairness and a driver TXQ scheduler
Date: Sun, 22 Nov 2026 19:11:36 +0100
Message-ID: <20261122181145.1015729-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_101146_378819_2B56B454 
X-CRM114-Status: GOOD (  14.10  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: t <t@t>

ath11k sets neither NL80211_EXT_FEATURE_AQL nor
NL80211_EXT_FEATURE_AIRTIME_FAIRNESS, so a saturated download queues
every frame in the hardware TX rings, where there is no AQM. This series
sets both, registers tx and rx airtime, and runs the TXQ scheduler from
the driver and from tx completion.

IPQ8074 AP, TCP download from a wired host to one 1x1 VHT80 station,
default limits, 20 s, three interleaved runs per arm, measured on v5:

                        Mbit/s              sender RTT mean ms
  auto rate  without    92.9, 94.4, 94.3    111, 232, 231
             with       93.7, 88.0, 93.6    124,  51, 167
  VHT MCS 0  without    21.4, 22.3, 22.6    587, 550, 526
             with       22.9, 22.2, 22.3     44,  42,  43

The v6 changes to 4/9 (the share of a multi-user PPDU) and 8/9 (ending
a round on a full MSDU idr) do not act with one single-user station
below the idr limit, so the table stands for v6. On v6, a routed TCP
download to one HE160 station at 883 to 923 Mbit/s logged no "failed to
transmit frame", six runs with aql_enable set to 0 in debugfs and six
with it set to 1 (IPQ8074 hw2.0, WLAN.HK.2.9.0.1-02146).

On v5, airtime weights are accepted but leave a 2x2 HE160 station at 45
to 49% of the airtime against a 1x1 VHT80 station at 1:1, 4:1 and 1:4,
because the firmware serves every station with frames queued in turn.
Ending the round at 256 MSDUs in flight, as Toke suggested, gives the
HE160 station 65 to 80% at 4:1, but at 1:1 its aggregates shrink from
258 to 100 MSDUs (one run) and the two-station throughput drops by a
third, so the series leaves it out.

An 802.3 frame freed through ieee80211_free_txskb() keeps its station's
pending airtime, because mac80211 looks the station up from an 802.11
header; that is fixed in mac80211 by a separate patch [2].

The series is based on "wifi: ath11k/ath12k: implement TX flow control"
v8 [1], patches 1-3, and applies after them.

I used Claude (Anthropic) to help write these patches.

Changes in v6:
 - patch 1: return the frames in flight to mac80211 on firmware recovery
 - patch 2: report the tx completion rate on single pdev chips, which
   stayed at the 4 us airtime floor
 - patch 4: charge each user of a downlink OFDMA or MU-MIMO PPDU its
   share of the PPDU duration, the duration divided by num_users, not
   the whole duration; reported by Christopher Griffin
 - patch 7: register rx airtime under ab->base_lock; mac80211 frees the
   station without a grace period after the peer drops it
 - patch 8: end a round also when the ring's MSDU idr is full, so no
   frame is dequeued only to be dropped; reported by Christopher Griffin
 - patch 8: end a round only while a frame is pending, and mark the
   access category before reading the pending counts, so a completion
   cannot miss the mark
 - patch 8: drop the management queue from the commit message; ath11k
   has no management TXQ
 - rebased onto ath-next 1983b40acfcb
 - v5: https://lore.kernel.org/all/20261018174904.1757161-1-julius@bairaktaris.de/

[1] https://lore.kernel.org/all/20261021060725.242681-1-jtornosm@redhat.com/
[2] https://lore.kernel.org/all/20261122150541.3117507-1-julius@bairaktaris.de/

Julius Bairaktaris (9):
  wifi: ath11k: free tx skbs through ieee80211_free_txskb()
  wifi: ath11k: enable airtime queue limits
  wifi: ath11k: report the pending tx MSDU count in soc_dp_stats
  wifi: ath11k: report tx airtime and enable airtime fairness
  wifi: ath11k: schedule TXQs from the driver
  wifi: ath11k: run the TXQ scheduler on tx completion
  wifi: ath11k: charge received airtime to the station deficit
  wifi: ath11k: stop a scheduling round when the hardware is full
  wifi: ath11k: budget the tx completion handler

 drivers/net/wireless/ath/ath11k/core.c    |   1 +
 drivers/net/wireless/ath/ath11k/core.h    |   7 ++
 drivers/net/wireless/ath/ath11k/debugfs.c |  10 ++
 drivers/net/wireless/ath/ath11k/dp.c      |  11 +-
 drivers/net/wireless/ath/ath11k/dp.h      |   6 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c   |  34 +++++-
 drivers/net/wireless/ath/ath11k/dp_tx.c   | 140 +++++++++++++++++++---
 drivers/net/wireless/ath/ath11k/dp_tx.h   |   5 +-
 drivers/net/wireless/ath/ath11k/mac.c     | 105 ++++++++++++++--
 drivers/net/wireless/ath/ath11k/mac.h     |   1 +
 10 files changed, 289 insertions(+), 31 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
prerequisite-patch-id: ff44eb6f1d673e75bc013e3ffc870d7d30252c17
prerequisite-patch-id: 2cde5e2a788f79e4b8c858a60ec11cd120b1b97e
prerequisite-patch-id: c86d3c9047c851f45b5d46398850c9d810d82258
-- 
2.53.0


