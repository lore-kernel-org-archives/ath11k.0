Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E97F606A68F
	for <ath11k@archiver.kernel.org>; Sat, 28 Nov 2026 17:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rUCTdNDL;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=X8ayZoz/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sYnLslG0vGfNapeKl06yr4lRqve9qB4fEnPycqLuwWM=; b=rUCTdNDLocFmR5DBVHoE/ZGwlg
	3wjqO5G/Az0Yw308+fd2QPY+V7hl+RkZpW2t3tbbRc+ENdcW7ZbAfyciI64V2wUGIXie7TmLscjX6
	7lojtGWNnfEzPo27/DzXKY/A9E02JVK4Yevlnm7hO/sJbXGbKjzj3mBVxQFxvUiPwPHT/JyEiAjLh
	pkykDuiA1A6dYKba4Oa09MlGtOYD1pKyJptkUuiMpfOIjc6IeTHa9okqjzkute9OXcFSlIW+dGotT
	mqGoUS1J5u5m+pl7s3mGJSkU/h8s/gwGWssrZMlgi0l6UWcKmjzFXo/BO+O+ZKGeVXiJ/o7iGGGza
	ZUSqMyDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM7y-000000010tE-3F7G;
	Sat, 28 Nov 2026 17:22:22 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM7w-000000010rd-0BbZ
	for ath11k@lists.infradead.org;
	Sat, 28 Nov 2026 17:22:21 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c511c0e2826so1039569266b.0
        for <ath11k@lists.infradead.org>; Sat, 28 Nov 2026 09:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795886538; x=1796491338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sYnLslG0vGfNapeKl06yr4lRqve9qB4fEnPycqLuwWM=;
        b=X8ayZoz/xTmb3saBW5WQ3c/D1sNXv+QZ5uOGcPK0bLMUX4oHlyaVtcwxXkpI2FPO2K
         6lBXIrg7SKEYD0nFWfmCP/05ryBFGgYfXNRb9QKslPNIPkipqc0obmuq5IjQhrCB8nEQ
         1LVSonzqT+sNLmkdy9Q4CCn+0D2Wfx7tihv/D1GCyYY6pAgFDVcRLEDw2rrbJlJzhGrK
         tit9m5xD8plern4J8oA8kgB5fBndYNUhZIE2qJ9p+cf8f8heunkhwD3EGYw1S5iJFPzP
         Zm+PpumPBmfd7G0HuhDH4oCl7t7fNnO2jFyb+eG9mBoBzsA6zXvBE/s7P+Enf495yuuu
         4YwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795886538; x=1796491338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sYnLslG0vGfNapeKl06yr4lRqve9qB4fEnPycqLuwWM=;
        b=Jzxhic19VDRaYs13SSjT+jcpxY6P1iZ5aEgGaWP073jo/akfxPQHGH0V8n4OCDh842
         k17oKohwwzCbSoIWfT12o9XlHomYnT78vQb4BTg5y1FpTPLm2jtx1ylwMYKFweLTT4OF
         RPjOHQjxWzwVGtbKRl/2Un3sRmlMvLvJhCQ5BCwyEWqZSq2VsrnqAY0VA4qxa02CbqLM
         mGhQKhWmJASD7pmuA1ybRFJ0nFRKfuCAxuubdSsEfm6aByLV7n2Z5xGHvteh040Yrq3S
         YktrsHz8wpXLLSqfbVxvi5HyanWKeBY8tj8mTRn2w5WAYqiaasuQXzpS/ggvRWR+AZKF
         CLqA==
X-Forwarded-Encrypted: i=1; AL+hErFu2GaaNuGRKRRGKChYozAnYSiFrNPKXbXepge6KX5nIHLZnE8Vmbfk4ESuHrwgSP6A+R6DPaE=@lists.infradead.org
X-Gm-Message-State: APuU4Z9L4/G2zUUGETS7JoazERkKviItlpkLqOY6ooelU5deZgcHplvc
	dtwl5S9IOIRaFooE655rS1U4QG8hE4qFfOp8qghUJymIy7DOg/UPTxsX0ZRWQcR+kQ==
X-Gm-Gg: AZFdTZc5ZG4Zz8oqbCKrLW2GvYR1W5wdc+4/uRb/6MM2j6+iOsOgZ24gpNwlXN+z7JY
	WKbCILAmRVQJgwWMqzqx9jzM2dLBUYa8JeRfZA3/G99N53twgGN3XzwvzHpLiBEWlS6HEf9+jnC
	cDs/kSURkQjzS7z4ydIGjAvEwIfGL40ZgxGMeaHzzs0aoNyrj4YeNFsCQ6RaFyKRQ9GzZJOohCL
	TryUWgitftxJmNqkKjHBFf9XRMMSsqxILiBANk7dehUvM2Ws4U+chO2AUI5ph3WspbvcRb/ZcBz
	H1gj/FFIL9w4lrG0Mmdd6iRMAeHkOBQ1y4ANQGiHiRiG70ZS5rrya4ltA4BZEa/DQi4eJwag4cj
	SM/444HD9VskJzSIBtdeqeBg7rSKmtGmH2JR+3LDe9TxxeJ+IGbAOUdHbZIJ+OdSSF2rdCSkIoD
	rkhxIDW2nTLclrytlNM/bOaeHTW8KDntqe2Rum2Vfc5vsz0K4MJ6rc5luBgNnJfSa5kE3PiGL/V
	aLvKnaznqJHFU9LwEptiXB3kvRLID2trq8vJOlvOSLiDUjUxldc+3JBxD35dY61zI3Gyi4xJmUb
	wsN0E7CyV83LMB94l8MDlTTCKuyNYjuK3U/LvcezetsgWCWISKuz+oP5iDyw5NNx5/Du1/uXvBR
	mI5hutB7coXj4qaLg8/y3d7+0PETKQlJgLGhTZ6CiBMdnjrvMjJCv5lpLwgf/IC0pN+EW7S5eIl
	IJTQIj4DZqg9xk7GwiC+I4SEHsmHoJPQJ9YcnPeOKdERn+0sgnVvTZnDgYAcBtx3nFOTL61BFhM
	Jh8YvnqklrdsT7E38LX+iT6091/ockURN/NqNkke1wi0qwDMfGCyxlHDSKpz6YvtZwYWaeu6+cA
	rIHpPWZStY3MOg==
X-Received: by 2002:a17:907:6091:b0:c51:51f7:c9e3 with SMTP id a640c23a62f3a-c5151f7fd77mr1878504366b.34.1795886538067;
        Sat, 28 Nov 2026 09:22:18 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm981388866b.80.2026.11.28.09.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 09:22:17 -0800 (PST)
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
Subject: [PATCH ath-next v2 0/6] wifi: ath11k, ath12k: RX correctness fixes
Date: Sat, 28 Nov 2026 18:22:14 +0100
Message-ID: <20261128172220.922376-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_092220_130467_44D4E129 
X-CRM114-Status: GOOD (  13.48  )
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

Six RX fixes for ath11k and ath12k. "The hardware" below is an
IPQ8074 hw2.0 with firmware WLAN.HK.2.12-01460.

1/6, 2/6: checksum trusted for frames the hardware did not check
- Trigger: an associated peer sends ICMP or ICMPv6 with a wrong
  checksum, a UDP datagram with a wrong checksum in IP fragments, or a
  TCP or UDP packet with a wrong checksum in 802.11 fragments (a station
  sets its fragmentation threshold below the packet size).
- By the code, every ath11k and ath12k chip and frame mode.
- Shown on the hardware with OpenWrt's ath11k, 50 frames per case,
  1 run each: with ath-next's rule the AP answered 50 of 50 ICMP echo
  requests with a wrong checksum and 50 of 50 fragmented UDP datagrams
  with a wrong checksum; with this series it answered none of either
  and counted 50 checksum errors each.
- Impact: the stack accepts such frames unchecked (icmp_rcv(), UDP
  after reassembly). CVSS 3.1: 3.5,
  AV:A/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N.
- Workaround: none; mac80211 offers no switch for RX checksum offload.
- Found by an LLM review (Claude) of the code.

3/6: ath11k delivers frames under a forged source address
- Trigger: a station associated to an ath11k AP turns on 4-address
  mode on its own side and sends data frames with any source address.
- Reachable with frame_mode=2 (Ethernet decap) only. On the hardware,
  an ath10k station sent 200 broadcasts with a forged source: all 200
  reached the AP's bridge, which learned the forged address on the
  Wi-Fi port. One run.
- Impact: a station can send frames as another host, and the bridge
  then sends that host's traffic to the Wi-Fi port, where it is lost.
  CVSS 3.1: 4.6, AV:A/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:L.
- Workaround: the default frame_mode=1 (native Wi-Fi).
- Found by an LLM review (Claude) of the code, then reproduced as
  above.

4/6, 5/6: replay check of the group key skipped
- Trigger: a radio in range replays a recorded group-addressed data
  frame while the receiver gets unicast data; no key needed.
- Both drivers keep one receive status for all MSDUs of a REO reap and
  do not clear RX_FLAG_PN_VALIDATED between them, so a group-addressed
  MSDU behind a decrypted unicast one skips mac80211's replay check.
  Not reachable on the hardware: its firmware releases group-addressed
  MSDUs through the REO error path, which gives each MSDU its own
  status. An ath11k station under unicast load received 29011
  group-addressed MSDUs there, and none carried RX_FLAG_PN_VALIDATED
  in from an earlier MSDU. It would be reachable on a chip or firmware
  that delivers group-addressed MSDUs through the REO destination ring;
  none is known.
- Impact there: replayed group-addressed frames would be accepted.
  CVSS 3.1 if reachable: 3.1, AV:A/AC:H/PR:N/UI:N/S:U/C:N/I:L/A:N.
- Workaround: none needed on the hardware; elsewhere none.
- Found by an LLM review (Claude) of the code; measured as above.

6/6: ath12k loses EAPOL and group frames
- Trigger: an EAPOL frame, or a decrypted group-addressed frame,
  arrives in the same REO reap after a data frame of any station.
- Since commit c4aa897fe234 ("wifi: ath12k: Handle DP_RX_DECAP_TYPE_8023
  type in Rx path") ath12k sets RX_FLAG_8023 in the shared receive
  status and never clears it, so such a frame goes down mac80211's 802.3
  path with an 802.11 header and is lost. ath12k uses Ethernet decap
  without any setting when the firmware advertises
  WMI_TLV_SERVICE_ETH_OFFLOAD.
- Impact: 4-way handshakes and group rekeys stall until retried, and
  decrypted broadcasts such as ARP, ND and DHCP are lost. CVSS 3.1:
  2.6, AV:A/AC:H/PR:L/UI:N/S:U/C:N/I:N/A:L.
- Workaround: none.
- Found by an LLM review (Claude) of the code.

I used Claude (Anthropic) to help write these patches.

Changes in v2:
- 1/6: also leave a frame reassembled from 802.11 fragments and a raw
  A-MSDU to the stack (Sashiko, on v1 1/6).
- 2/6: also leave a frame reassembled from 802.11 fragments to the
  stack (the same finding); read the new flags from the last buffer of
  the MSDU, as ath-next now does for the other MSDU end fields since
  commit 1e678e37ff13 ("wifi: ath12k: fix decap of MSDUs spanning
  multiple RX buffers").
- 3/6: result with the check run on this version.
- Rebased onto ath-next; discovery lines reworded.
- v1: https://lore.kernel.org/r/20261122210525.2076058-1-julius@bairaktaris.de

Julius Bairaktaris (6):
  wifi: ath11k: only trust the RX checksum of a frame the hardware
    checked
  wifi: ath12k: only trust the RX checksum of a frame the hardware
    checked
  wifi: ath11k: drop decapped frames with a source other than the
    station
  wifi: ath11k: clear the crypto flags of the receive status for each
    MSDU
  wifi: ath12k: clear the crypto flags of the receive status for each
    MSDU
  wifi: ath12k: clear RX_FLAG_8023 of the receive status for each MSDU

 drivers/net/wireless/ath/ath11k/dp_rx.c       | 124 ++++++++++++++++--
 drivers/net/wireless/ath/ath11k/hw.c          |  22 ++++
 drivers/net/wireless/ath/ath11k/hw.h          |   1 +
 drivers/net/wireless/ath/ath12k/hal.h         |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  17 ++-
 .../wireless/ath/ath12k/wifi7/hal_qcc2072.c   |  11 ++
 .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   |  12 ++
 .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   |  12 ++
 8 files changed, 188 insertions(+), 12 deletions(-)


base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
-- 
2.53.0


