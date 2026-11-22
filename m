Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650E1606A6A6
	for <ath11k@archiver.kernel.org>; Sun, 22 Nov 2026 21:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uenLBhVd;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=EhdDWQHi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=27y/kU2vWPdOKL0QkXcnrWUvBUFwGMg7n99J2f+jkbU=; b=uenLBhVdyblTsGxV5dR7FgEOLD
	6SGdfWJo1ii22erz9DNYvOraINLcdyBh+cG+e9v4H+j9W2fkZNDq1uMMvTbfYwJCBkb/bFtwJp0tL
	DRZTdC8Drnt7jRP9X0pORDWed/7ILTdX7eY8LlyvtoG3a+H22sO0CCtkR3XnDjtRhyQsnSLOCgFHS
	X16bu3kt1eo0Nj2XMFL/gbnV9Fg830DVqlB55kNHjfQCvAAGiw2BQB4Z9PKI2RFG7UE2ru7DMF9NK
	Gl00Fzkz94NkxOh9OGdTodnjnH2eMj1YC1KSuWicSCutI2ubGZc/Rzt/duEXyei4MnnUMsL+MZ6jU
	VzFu6t0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEka-00000001khr-1sMK;
	Sun, 22 Nov 2026 21:05:28 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVEkY-00000001kg5-1GjM
	for ath11k@lists.infradead.org;
	Sun, 22 Nov 2026 21:05:27 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c50e26763a4so486378266b.1
        for <ath11k@lists.infradead.org>; Sun, 22 Nov 2026 13:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795381524; x=1795986324; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=27y/kU2vWPdOKL0QkXcnrWUvBUFwGMg7n99J2f+jkbU=;
        b=EhdDWQHiI0OW7jhtzbWV+T3+VCeD0B7d0Bcdn6ZhIC/e8cRBoCcCjGZ2F92YfoCsPH
         +lnCE0hxfCBQrXQe580JvWctuPu0DUXJKowZWzbUhsgFSV/7A+LApkal106e4WnSDMIm
         sG72yeJtK+3KyDES+IXskRbY76b+62DCHuH0jtlms0fjfEVB1Fjyh9D1kqez+gv2TrdX
         FH3daSL6s8mng9rjwtun80rJaLXQhscx/Kzmgykv3hfWjXSMcBrMuFRCd0BJUX0Dy5da
         vTxX7BgoCvKfZzr7nFrITqZERs1sIws7XaXzLsE5ye9Nt9m4W3RJmAM2pQjFxNH9vpqa
         iyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795381524; x=1795986324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27y/kU2vWPdOKL0QkXcnrWUvBUFwGMg7n99J2f+jkbU=;
        b=qCIMklaT+7X4R53Vr890BPPQFAl6iPqJAtgs2G8Qbp9ZLqEBOdJUV9RvG0sRMkoJKE
         M7CYKktJvdUAJZMAQjurS8h6tiH8ME5S4qGCKZtLc+LLHcfVzc9ZWnMYJl+xAUqdftnq
         xL7un2YEAwFMu2sl0Djc+IybkOcz+XzIhhnR0fjkhDBkdj/cb6NscMv3iPezwsML/tDj
         muKQBiy0yEJF27YaLuj7cduHCVJCOLtI7P+lL0PQn+1mQ4dyL50cltqHQAaFGhOZ9516
         6q6nEKbfXz3TwXXMhq3TUKb3q+O7bIj6Mkt5b7fZiTQXu9gkKIQydDDxzEDz6MHyUkwu
         gfNg==
X-Forwarded-Encrypted: i=1; AL+hErHShOmBaOPqIdGeX9JiRfL5OTD2fsw/QT6Jn1ml7N6r1dVPUVfH8eHBFDfpiUxlI1fMGG+OX6E=@lists.infradead.org
X-Gm-Message-State: APuU4Z93MPlQ0Q7BTDvsyzIkc56Eq36g6yHWjMz2lPoHoyD/hEIKJMEk
	ND+HeWyefXUYGW6twyKoo2cumVOIvifGLg/A0LeVi/NebjfhkHQYMA+hx1gSgfDw5A==
X-Gm-Gg: AZFdTZck9RhUFEK2fGUny2uxopwUObzsHXcEevApM/g4x20BZKDomdCvXzNVC7sLoIy
	Km9R8/7YuRmEwSqBbgG7HlTT7aVmwjLm654nLA0gwIc8dNWMOzSOkXJxX9dRrggZBs0kHkG3uZm
	niNxcjvbefWW87CVE7BktfKYA6U/RT9kj/5NVKC74HU8AYsHTk5Ivn8FVFX6djiSt4xl75ICIpE
	n8n2erv+sQ+DqLFiopP1TqdXBArWNy4GvkSz1flop0zMWgZvpStSAYPgaIaXSi4sOmN+4QYmaLP
	jKfc2IeyYaJPwPa6nb/8KmfY4MzR9s5dD9xLyfV7rKFbq6RZMWRsXvPTxoFtOo3GuszWsTUV7pc
	ZeEU8VrpxjwIdkahwBbPgy+K1dEHDXHHFDEXnI82HHxclAuj3u2fTZww92E8TJ7/JV+1Fiem6hK
	V9TyHtUrKuvdPFntaQSOgu/JWVt+4gBsS2BM2GkgbHm0NirGUBtsmQlZYYzRp9jjMkjIR4Zozzt
	W6zKWeitGTvNZbrVCfhR+oGCbIytxSWLp0Ziq/CFqSCQgfkXuOte8YZiqIPxrT/dyuFyrhU3lGX
	O0UPwcBOMy1uuCWuQnKdaDugdGOGfUKR5vABDaUt/fCYZxMDeJruCJtdcrpce54lacZ7ruYRg3D
	TW857z3C2dr6lQAttjjv/3rrW4q7OH4M2wn7n+vpPJ12dRRK8nwESsFI3XgRMxxExGNqGaJJCZI
	sAF6eOx5LBYH10CKtzTngBxaay/D9O/JUE+eUZrefLIyfpW4GwJiDtzcmA194QfuoT8xDUztbGQ
	poR/z/ahBfLYst16mkXSAutESbRahrY/O1wg9oXRY8N4tGe3LNmP13YgYsTishEt6hrBvpvzzZ/
	MhCBgW0GhWt1KS+9Q/l/S3Pl0XiLnoC12wamIw2NTyy2Bgu3/frBNpUDRJTOUmiTPfj0em0GfoE
	=
X-Received: by 2002:a17:906:b1d5:b0:c34:c5e8:1dc5 with SMTP id a640c23a62f3a-c513aac1dfdmr589785566b.20.1795381524002;
        Sun, 22 Nov 2026 13:05:24 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713d300ad8e04c1718a6e78.dip0.t-ipconnect.de. [2003:f2:4713:d300:ad8e:4c1:718a:6e78])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm339935766b.57.2026.11.22.13.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 13:05:23 -0800 (PST)
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
Subject: [PATCH ath-next 0/6] wifi: ath11k, ath12k: RX correctness fixes
Date: Sun, 22 Nov 2026 22:05:19 +0100
Message-ID: <20261122210525.2076058-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_130526_412406_C50CED34 
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
  checksum, or a UDP datagram with a wrong checksum in IP fragments.
- By the code, every ath11k and ath12k chip and frame mode.
- Shown on the hardware with OpenWrt's ath11k, switching at run time
  between ath-next's rule and this check, 50 frames per case, 1 run:
  with ath-next's rule the AP answered 50 of 50 ICMP echo requests with
  a wrong checksum and 50 of 50 fragmented UDP datagrams with a wrong
  checksum, and counted no checksum error; with the check it answered
  none and counted 50 errors each. Unfragmented UDP with a wrong
  checksum, which the hardware checks, was dropped both ways.
- Impact: the stack accepts such frames unchecked (icmp_rcv(), UDP
  after reassembly). CVSS 3.1: 3.5,
  AV:A/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:N.
- Workaround: none; mac80211 offers no switch for RX checksum offload.
- Found by reading the code with an AI review tool.

3/6: ath11k delivers frames under a forged source address
- Trigger: a station associated to an ath11k AP turns on 4-address
  mode on its own side and sends data frames with any source address.
- Reachable with frame_mode=2 (Ethernet decap) only. On the hardware,
  an ath10k station sent 200 broadcasts with a forged source: all 200
  reached the AP's bridge, which learned the forged address on the
  Wi-Fi port. With an earlier version of the check, which hands such
  frames to mac80211 as 802.11 frames instead of dropping them, none
  did. One run each.
- Impact: a station can send frames as another host, and the bridge
  then sends that host's traffic to the Wi-Fi port, where it is lost.
  CVSS 3.1: 4.6, AV:A/AC:L/PR:L/UI:N/S:U/C:N/I:L/A:L.
- Workaround: the default frame_mode=1 (native Wi-Fi).
- Found by reading the code with an AI review tool, then reproduced as
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
- Found by reading the code with an AI review tool; measured as above.

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
- Found by reading the code with an AI review tool.

I used Claude (Anthropic) to help write these patches.

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

 drivers/net/wireless/ath/ath11k/dp_rx.c       | 86 ++++++++++++++++---
 drivers/net/wireless/ath/ath11k/hw.c          | 22 +++++
 drivers/net/wireless/ath/ath11k/hw.h          |  1 +
 drivers/net/wireless/ath/ath12k/hal.h         |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 14 ++-
 .../wireless/ath/ath12k/wifi7/hal_qcc2072.c   | 11 +++
 .../wireless/ath/ath12k/wifi7/hal_qcn9274.c   | 12 +++
 .../wireless/ath/ath12k/wifi7/hal_wcn7850.c   | 12 +++
 8 files changed, 147 insertions(+), 12 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
-- 
2.53.0


