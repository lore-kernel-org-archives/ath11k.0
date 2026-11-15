Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F253606A31E
	for <ath11k@archiver.kernel.org>; Sun, 15 Nov 2026 13:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0kzJ21E0;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=JvwGx3Ll
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8go9S3oYzYO5ww8YtwyFyx26lMvshd8Hs+WOxsUkQR8=; b=0kzJ21E0H9+yFny1KNfXvB48xA
	cA1Z6mbeNNG6ldyqaZAiS7Sy2M2f8KD8rM8FrkTZ44lvRv8K+j6u0JOaBj3/BV60HybsPzt3UOBhf
	fCjhmE3a8jo4pCJZYPKWxzAOoWZJBv9Nlg8+TwaR7dGSIXAeBZAsVsPCDTFV4tHOEB+oLdqgzu5rG
	LlEUx7KpC3VavnPB5prGCgbemYZiHu1u8DNnciyDfcoz3tz1QrXFzYGnBKz1ODKIc7xVTelKrv+1Z
	seSQigJj9Ka1I/n5kP0ycugh+G6QDqn8qmIT0gqLhlnRQe2vMrBw8eqN/69rSPTGLe4YLgG4/ShW5
	agCwfUqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSa5f-0000000HXpm-0nFb;
	Sun, 15 Nov 2026 13:16:15 +0000
Received: from mail-43167.protonmail.ch ([185.70.43.167])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSa5c-0000000HXpR-02hS
	for ath11k@lists.infradead.org;
	Sun, 15 Nov 2026 13:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794748567; x=1795007767;
	bh=8go9S3oYzYO5ww8YtwyFyx26lMvshd8Hs+WOxsUkQR8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=JvwGx3Ll61GnAjTU1i0dGH+STl/IerAHTw1Hxh05weYh8G792/U7mypr0ZDJ0yFsf
	 TD0+QOxFmWuMRMNFRz6h+T5j35kNUz752XsJfR4QgCDULovg6ZqcFmDsRn2U4NM1NA
	 r381xjNdhhtXaRBY29kWHJoKCymBQ9joACIdwoMGXC1Hnhzsq5PWP9KG3YCxLyzTOU
	 B5bsXI6dOfQuf7TUvukKou+nJneaxnigSnt7BsiAdxd9/GLZHtDC6Zgz63tJ1w5Fal
	 ZslDWKZLW6aV+VmsvuU08+Nn0lOGJZ+3lYhPvx+iVf4qJAXK+RdGi1oGQIqGCDy7Jn
	 M60hKkuV4Zzhw==
Date: Sun, 15 Nov 2026 13:16:02 +0000
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
From: alexiscalin <alexiscalin@protonmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Jeff Johnson <jjohnson@kernel.org>, Baochen Qiang <baochen.qiang@oss.qualcomm.com>, Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: ath11k: WCN6855 on Lenovo (17aa:9309) uses generic regdb, 5 GHz passive-only
Message-ID: <uiDP3AfIPxylorMgOmrrT94taa0jYfo5VPw94l4YkKyGPD0X7byxDKdEF4LFqv6ltBlbS2atFSQT7PgJORjH30HU8wOK4uS3DhyacPPuT9k=@protonmail.com>
Feedback-ID: 41683595:user:proton
X-Pm-Message-ID: 0e80abd9cae358e0bc39a71cd1ebe1bcfdd9c9c2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_051612_518860_4E55F99D 
X-CRM114-Status: UNSURE (   6.48  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.7 (-)
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
X-Spam-Status: No, score=-1.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,LOCALPART_IN_SUBJECT,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hardware: ThinkPad P14s Gen 5 AMD (21ME), Qualcomm QCNFA765 / WCN6855
hw2.1 [17cb:1103], subsystem 17aa:9309, chip_id 0x12, board_id 0xff.
Firmware: WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
board-2.bin: atheros-firmware-20261019 (Fedora 44)
Kernel: 7.2.13 (ath11k identical to v7.2.13)

ath11k finds the board data for the Lenovo variant (SMBIOS type 0xf8
"LE"):

  boot found board data for 'bus=3Dpci,vendor=3D17cb,device=3D1103,
  subsystem-vendor=3D17aa,subsystem-device=3D9309,qmi-chip-id=3D18,
  qmi-board-id=3D255,variant=3DLE'

but there is no regdb for it, so it falls back to the generic one:

  boot failed to fetch regdb data for bus=3Dpci,vendor=3D17cb,device=3D1103=
,
  subsystem-vendor=3D17aa,subsystem-device=3D9309,qmi-chip-id=3D18,
  qmi-board-id=3D255,variant=3DLE from ath11k/WCN6855/hw2.1/board-2.bin
  boot found match regdb data for name 'bus=3Dpci'

board-2.bin has 16 board entries for Lenovo (subsystem-device 9308,
9309, 930a and e0be) but no Lenovo regdb entry. Its 35 regdb entries are
the generic 'bus=3Dpci' one and 34 for HP (subsystem-vendor 105b).

With the generic regdb, the firmware's default country is BR, and every
5 GHz rule it reports has REGULATORY_CHAN_NO_IR (FLAGS 2), also after
11d has switched the country to US or FR:

  wmi cc_ext BR dfs 0 ...
  wmi reg rule 1: (5170 - 5330 @ 160) (0, 20) (FLAGS 2)
  wmi reg rule 2: (5490 - 5730 @ 160) (0, 20) (FLAGS 2)
  wmi reg rule 3: (5735 - 5895 @ 160) (0, 20) (FLAGS 2)

So all 28 5 GHz channels are scanned passively, including the non-DFS
ones. For FR, wireless-regdb (iw reg get, global) has no NO-IR on these
ranges, but the device reports:

  global: (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
          (5725 - 5875 @ 80), (N/A, 13), (N/A)
  phy:    (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
          (5735 - 5855 @ 80), (N/A, 14), (N/A), AUTO-BW, PASSIVE-SCAN

A full scan takes about 5 s, of which the 28 passive 5 GHz channels at a
150 ms dwell time account for about 4.2 s. This delays every connection
that needs a scan, e.g., Wi-Fi after resume: with NetworkManager, Wi-Fi
is back 6.6-7.7 s after the wake-up alarm. For comparison, an Intel 8265
laptop measured the same way takes 5.4-5.5 s. (An additional scan done
by wpa_supplicant after resume, which made it 12.6-12.7 s, is a separate
wpa_supplicant issue and has been reported on the hostap list:
"wpa_supplicant: Initialize is_6ghz_enabled when adding an interface".)

Could a regdb for the Lenovo WCN6855 variants be added to board-2.bin,
as was done for HP? I can test a candidate file on this machine.


