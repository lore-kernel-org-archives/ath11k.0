Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCE4606A324
	for <ath11k@archiver.kernel.org>; Sun,  1 Nov 2026 13:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TLQFNU+l;
	dkim=pass (2048-bit key, unprotected) header.d=disroot.org header.i=@disroot.org header.a=rsa-sha256 header.s=mail header.b=HxF4hgh/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BUt2Z09wK4LSp7ylKwrL85powLevpTqnbmj/kdSRxtE=; b=TLQFNU+ll+bdw5
	1wwvpsZ0aNaO/ZeteLCnWDnfA8OC4jgagcepkIjhtY8S44zKuh5c7BAM/WsK1XvO0pSNh87ocLHhJ
	IUsamPOuIdpCDAIcVGjaARsSeWEAEcDcujtuj/iRaSGiDHr86m0IRb34KrWFbSwstQgNpwbFkNXn5
	wiha7MVtNPMtlQGccfke6QdmZ9SIVwppvua1tlhzsQcVrPTLPay1Av2CeKSLlIXE95q3rOEC220tQ
	rVgySWcaPNRkEM2B89XmpUcdREUoBB2m6jNZzc/xr4glPidS6ViSpiQ/5NIX9UhXrxqnMdV0gv2UJ
	wKYajhkFXQXlPZWDaT8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNVc3-0000000EXEQ-4B5r;
	Sun, 01 Nov 2026 13:28:43 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNVc0-0000000EXDy-3z3x
	for ath11k@lists.infradead.org;
	Sun, 01 Nov 2026 13:28:42 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 27AB3805EC;
	Sun, 01 Nov 2026 14:28:39 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 93v_HZUPztKi; Sun,  1 Nov 2026 14:28:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1793539718; bh=L8f3j7ouq04gW7/lLDtNrjgW6rikViytGiRXmBLKk4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HxF4hgh/+xlcmz7GAbseou5s8xkEXGuLhHDEKIqKQyKhtzSscH+qebkXn935cW2bd
	 kx2i7Iewy8P1Llwxyg9q/AW06WXUqWPacNPziMDMZYh5DowMJW5uIXbrv1bNn45hgT
	 QqtgBNCpitbc7txgao0BdbWtusSAihY7rdOQjAN/bP/e7bI576/wZ5HMen/mXh+4lU
	 kz/2OAxSf/+matvlctNXGA9uCDAvOtkBrakap5Qkn2E5qepbNpWvpNPJLN9qetvTWA
	 WlAsIAZufuW1uxoP0T6rPCyK+XxewiTi3ZOz9Q8aocbbOZdGpvEk1ZIJMT0Of7A7mT
	 aagupa0Nbjpgg==
From: Florian Maurer <fmaurer@disroot.org>
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: Florian Maurer <fmaurer@disroot.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [RFC PATCH] ath11k: add ath11k_mac_op_flush_sta to properly flush pending packets
Date: Sun,  1 Nov 2026 13:28:21 +0000
Message-ID: <20261101132821.1920036-1-fmaurer@disroot.org>
In-Reply-To: <88fbbb46-0f2a-459e-8dff-2a7679e1ffd4@oss.qualcomm.com>
References: <88fbbb46-0f2a-459e-8dff-2a7679e1ffd4@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_052841_274868_F447E5CE 
X-CRM114-Status: GOOD (  16.99  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vasanth,

On 2/10/2026 Vasanthakumar Thiagarajan wrote:
> The recommendation from the firmware developers is that all 32-bit has
> to be sent in WMI_PEER_FLUSH_TIDS_CMDID for both AP and STA mode,
> otherwise some of the tid queues may still have pending packets.
> Firmware does the intersection and gracefully ignores the inactive tid
> queues when all the bits are set. We may need to check the firmware
> crash dump to understand the issue with 0xffffffff bitmap.

thanks for checking with the firmware team, and sorry for the late
reply. I tested this on IPQ8074 (Xiaomi AX3600, AHB, OpenWrt 25.12 with
backports 6.18), firmware WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
(8074.wlanfw.eval_v2Q), with peer_tid_bitmap made tunable via a
test-only module parameter.

With 0xffffffff the firmware asserts 0.2-2.3 s after
WMI_PEER_FLUSH_TIDS_CMDID, but only if the peer still has queued
downlink traffic:

  wal_peer_control.c:11907 Assertion !CHK_TID_FLG(ptid, WAL_TID_IN_SCHEDQ) failed
  Thread name: WLAN RT0 / WLAN RT1, PC 0x4b107f58, LR 0x4b1076f4

Peers without queued traffic survived every bitmap I tried, including
0xffffffff.

AP vif (2.4 GHz, HE20), 2x2 HE client, best-effort downlink load (many
parallel large pings), flush triggered by the client disconnecting:

  0x000000ff     ok      (many runs)
  0x0000ff00     ok      2/2
  0x00ff0000     ok      2/2
  bit 24         ok      3/3
  bit 25         ok      3/3
  bit 26         assert  3/3
  bit 27         ok      3/3
  bit 28         assert  3/3
  bit 29/30/31   ok      2/2 each
  0x1e0000ff     assert  3/3
  0xebffffff     ok      3/3   (all bits except 26 and 28)
  0xffffffff     assert  every run

Mesh vif (2.4 GHz, mesh peer with downlink UDP/ping load, flush
triggered by deleting the station):

  0xffffffff     assert  every run
  0x1e0000ff     assert
  bit 26         ok      3/3
  bit 28         assert  3/3
  0xebffffff     ok      3/3

STA vif (AX3600 as client of another AP, downlink load including a
UDP flood above link rate, flush on own disconnect and on deauth by the
AP): 0xffffffff, 0x1e0000ff, bit 26, bit 28 and 0xebffffff were all ok
3/3. So the 0x1e000000 that v3 [1] ORs in for STA vifs did not cause
asserts in my tests, but bit 26 does on AP vifs and bit 28 on AP and
mesh vifs.

So on this firmware, bits 26 and 28 are not ignored for a peer with
pending frames: bit 26 alone triggers the assert on AP vifs, bit 28
alone on AP and mesh vifs. This also means my earlier statements that
anything beyond 0xFF, or bit 17 alone, crashes in AP mode were too
broad; with this setup those bits did not assert.

With 0xFF on AP and mesh vifs I see no "failed to flush transmit queue"
warnings and no asserts, also when peers disconnect under load. It is
the value I have tested most. The test router has since run for a week
with 0xFF in a live mesh network (about 1450 station flushes, mostly
AP clients) without a single firmware crash.

Is the assert with bits 26/28 fixed in a newer HK firmware, and if so,
which version? If not, which bitmap would you recommend for these
firmware versions? I have not captured a full firmware crash dump yet;
if that would help, I can try to get one.

Separately, these asserts were also a good test for the AHB recovery
path. With the 6.18 backport in OpenWrt 25.12, without the ath-next
IRQ fixes, every firmware assert, real or simulated, ended
in a kernel panic during recovery. With the three IRQ fixes from
ath-next (a7ab5c835e42, f7a74e131d3f, e56c9d429ba0) backported, it
still failed in other ways: WMI commands from userspace (survey,
station stats) reaching the firmware while it restarts, TX into the
rings before CE/DP are set up again, the registered hw being freed on a
failed recovery, and TX writing to WCSS after remoteproc has already
reset it (asynchronous SError). With fixes for these, 20 of 20 firmware
crashes recovered without a reboot (10 real asserts on AP and mesh
vifs under load, 10 simulated while survey and station stats are
polled). Julius Bairaktaris has meanwhile posted fixes for the first
three of these, on the same hardware and firmware [2]. I have posted
the last one (stopping TX before remoteproc resets WCSS), and a fix for
the ext IRQs staying masked when a recovery follows a failed one, on
top of his series [3].

[1] https://lore.kernel.org/linux-wireless/GV1P250MB1433E723AF90A69AEBB696DAE8CBA@GV1P250MB1433.EURP250.PROD.OUTLOOK.COM/
[2] https://lore.kernel.org/linux-wireless/20261018210153.1925962-1-julius@bairaktaris.de/
[3] https://lore.kernel.org/linux-wireless/cover.1793531790.git.fmaurer@disroot.org/

Regards
Florian

