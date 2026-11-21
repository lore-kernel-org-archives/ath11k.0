Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747DE606A682
	for <ath11k@archiver.kernel.org>; Sat, 21 Nov 2026 23:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CuS7H0vI;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=vYCDdSLO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=igKYQHJVDDl0zX8yUvthZX0km4xkBGZbqrADIe6BmoI=; b=CuS7H0vItA5mhNrcblst1Mldjc
	Skk4SdvsWrjdmbdekZxjjry+/WOHrCpItujVnd1ljzSnB654J5noS6lbbPRp1Q2ovtBhV5Kqh1s2r
	on0jvbGmsNsmR1N0d86xDUdQTt5vqPq2HyBpe2LdIukMYaBu6CL88Khd2PgJRKXQOXUjbnPtbJaNz
	/OSYkGC6iudbBs7p8JBAF79vfJe8BfB58RZrBc0O/dxyNWC0xshxcWxVgDXY1Ns5qA2qf6/gwkasY
	1Jx4GpL5Q3e5SI5W5QO6m8AMlZd4QMMY2XOA2kB8SZaLzVjqpQ2asZbp4q5mYIBOtvc3mNSg8x7gd
	5hYk55+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBH-00000000Rxz-04Jg;
	Sat, 21 Nov 2026 23:07:39 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuBD-00000000RxM-2mVl
	for ath11k@lists.infradead.org;
	Sat, 21 Nov 2026 23:07:37 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c50d3ac6b51so681913966b.1
        for <ath11k@lists.infradead.org>; Sat, 21 Nov 2026 15:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795302454; x=1795907254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=igKYQHJVDDl0zX8yUvthZX0km4xkBGZbqrADIe6BmoI=;
        b=vYCDdSLOoJJwdUFmwGu7Pp9Zk17LxDwZiclHYikBRS0r9mAE957h+VE5Ts/pEfK+xg
         3R3bmUiMX7A8dUdqATRAe+jc3nxhUvb2jHtgQdUTQ6CUpO8UPkTbMgrp/aV3OicYQdNG
         ICgYKzOeueZ1aB62azZF2/YYmTcq2R5Kz6/WM9FK+ysgldQLLodk9YiD6b0X9AUijWIi
         5zUOICtVzOzOlVuem4tJRMt0eOUTbCJ9s7VMrEnB7MMQ6iRm3XQNKefhu3eeB/pXON7P
         K44wZOvBL4xRy2Cwxqf0I8i8T8d1vxWvkhq1HOvj82dp73dZi/pzqUQXnkIBzoP4iC4J
         xyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795302454; x=1795907254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igKYQHJVDDl0zX8yUvthZX0km4xkBGZbqrADIe6BmoI=;
        b=KNyjbjDEhw5KH5j6Rs3/0aMmJTXmovFqg4mXW87EYhagwS+ssb8hKbthoB6E/gQ0Tl
         hddyUx/1YTDJnN/12Bh0pJYtZQ7GTvT+CepRhxpOvrvnDn2BOrlova0eTa/HPZv0ynLn
         UOH8ELilcSf+JJS74NXli6i14OAJ2ct/CHNWDdQwUi0/P2THq5HnPytYnDlhK6AVLWTa
         osCL8W1+FYQl5ztRq5dxmxmoHYJlmkAQk7Pi9dRmlFWKQ5k9oI4p7I0HZwNPtnEnPS/8
         pXOJAb3ZIV1794gkygoacwv37gTzibFSTLSSjm7gRDAJyRMg2eHFuyKdbYCtiAv1rCSD
         01NA==
X-Gm-Message-State: APuU4Z/ZFVtxv3Dj/E0IgI2tqHJK5t9MZ0jGnQOht9mcaK8lZWRxeVmv
	WgorlzKvyBafctFBHaKwpnmwn8HYcVIIkgh84UU3Gj5TF9rK0rwrCkIMjDeimHowGw==
X-Gm-Gg: AZFdTZfsZ4xHocqm5qIeOjBXdhbPBi84BWfGYH+4WMBIiTFXdM0h02ud9xYKIAJV8qf
	yYM+RVH9nxqdLpb7JptGnnEihFF4Bb29lVkgJiPAKbnPdywIZPdh81qez+y8dz8H6A11g35H0ZK
	IhvnWFd2+IxCVhr4Y49VlQ4kgRSlEXtwQvoFp+inq1d5HC+OcPtRKm4kIjCzZs2hR3pj9lXJWnl
	S3zHJAcqb8fWHal0Nhm+pPFOVb2Y5+laEGbGhb3Bp/92xpbUd/ineH9lpSvNE8+cwQYAygQVkqi
	MzNIHpjTeXLFJHTvKqISBA5ovpUO5n8nNZ4ylI4uyo4Nt+nAnP+a+Aez17OA5Yc8rl1HpfG/OJt
	IcuN+MyouIrJwQ3WFTImSE/WkVp4C6k26EhfHI8u15qrc96dM1ZYJ5dpD6bRg/roJmwDIcTHtkB
	zalsO7ZddCi6g9JY3SWBKDoF6ShRFRIwsyWBms5gF9Xg2HYLdcWqJqZBWHK8AgrlDh+6XGrq+/v
	xN7kpeP5HxiVWky97HZf+CuxHVr6G4APQP9ThGfVQBpAKX9tmbEFTd5YPpUYImGifFedrYhSEF9
	yt50TShhHCO/Eu3XwijE4Zjm++lEQRb9/eE2Nr86yXgGhoz9gpZ+sPJJ3S/aaaDTH8VijLIun8b
	ZWcmN2mliQzLXc2Lxb8BESO35C8zeLOzeHQUL6mnQeHZ0PSqg73hghomZGKRiluQQtsMv9KYQ2i
	f7wmFYGBmDS962EE7haf50YSioSzyJlB4aqCdnMbekPQzlekIFPi5nGG4ynw4pVVoKGkJ1oOVjl
	OfbxQRYpEC2h9xyCymtTw8cj1+Kb02BJatBASSL+/UfB/W8WbTS/w9Ae02/jGtMFH/thwJJcJ90
	VTo5rFibb3wIV0sR+zFleyIqzIf/zremQqgwFagOTJq/ZM8lnfpFzbo5kh5iHpeWLKr+L7xKZpM
	=
X-Received: by 2002:a17:906:4fd1:b0:c46:7de7:e41d with SMTP id a640c23a62f3a-c51318a03d9mr792763466b.18.1795302453260;
        Sat, 21 Nov 2026 15:07:33 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470edf0034412c7e8f5a5e7a.dip0.t-ipconnect.de. [2003:f2:470e:df00:3441:2c7e:8f5a:5e7a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc1b40sm242721466b.54.2026.11.21.15.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:07:31 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Florian Maurer <fmaurer@disroot.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Rosen Penev <rosenp@gmail.com>,
	Jiale Yao <yaojiale02@163.com>,
	Julia Lawall <julia.lawall@lip6.fr>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH ath-next v3 00/13] wifi: ath11k: firmware crash recovery fixes
Date: Sun, 22 Nov 2026 00:07:18 +0100
Message-ID: <20261121230731.1206043-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_150735_776985_2087BE80 
X-CRM114-Status: GOOD (  15.64  )
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

Firmware crash recovery on IPQ8074 resets a waitqueue under a sleeping
WMI sender (1/13), frees radios and ring memory still in use when it
fails (2/13, 3/13), sends on rings it has not rebuilt yet (4/13), and
lets cfg80211 commands crash the restarting firmware again (5/13).

6/13 to 8/13 are Florian Maurer's AHB recovery fixes [1], kept with his
authorship and sign-off: ext IRQs disabled twice after a failed
recovery, the RPMSG Kconfig dependency the SSR notifier needs, and TX
stopped in the QCOM_SSR_BEFORE_SHUTDOWN notification.

9/13 to 11/13 fix error and teardown paths of the QMI service and the
AHB probe that the following patch relies on. 12/13 stops the restart
work of an earlier crash before remoteproc takes WCSS down: a crash
while that work sets up the rings ends in an asynchronous SError, and a
restart work that outlives its firmware waits for the dead firmware and
then talks to the next one. 13/13 keeps the thermal cooling devices
across a recovery.

Tested on a Xiaomi AX3600 (IPQ8074 hw2.0, firmware
WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1) running both radios as APs,
with the series on OpenWrt's 6.18 kernel and wireless backports. One
run crashes the firmware once through simulate_fw_crash; eight more
force a second crash through the remoteproc debugfs "crash" file at
growing delays after "remote processor q6wcss is now up", so that it
arrives before the QMI handshake, while the host capabilities are sent,
during the board file download, during the ring setup and during the
mac80211 reconfiguration. In all nine runs the router kept running, both
radios came back and the firmware took the next simulate_fw_crash
command; stations were associated again after the last run. In the run
whose second crash arrives during ieee80211_reconfig(), mac80211 warns
once in ieee80211_reconfig_stations(), as the station state cannot be
set while the firmware is down, and the restart that follows recovers.
After the 17 crashes both cooling devices are still registered and the
hwmon temperatures read.

I used Claude (Anthropic) to help write these patches.

v3:
- 2/13: also leave the mac80211 registration and the debugfs tree alone
  in the error path of ath11k_core_pdev_create() during a recovery
  (found in review).
- 3/13: Baochen Qiang pointed out on v1 that testing HAL srng fields in
  the CE layer is a layer violation. A recovery that fails before
  ath11k_ce_init_pipes() still leaves the CE rings zeroed, and Florian
  reproduced the resulting NULL dereference in ath11k_ce_cleanup_pipes()
  on v2. The ring state is now core state: ATH11K_FLAG_CE_RINGS_SETUP is
  set after ath11k_ce_init_pipes() and cleared where
  ath11k_hal_srng_clear() zeroes the rings, and ath11k_ce_cleanup_pipes()
  returns while it is clear. The rx_replenish_retry timer is stopped
  before the CE cleanup, and ath11k_ce_send() tests CRASH_FLUSH before it
  reaps a ring.
- 4/13: the error path sets CRASH_FLUSH again before ath11k_dp_free();
  the QMI FW_READY handler clears CRASH_FLUSH only on the first boot
  (found in review).
- 5/13: RECOVERY is tested on every try of the send loops, the CE
  descriptor waiters are woken when the recovery starts, and FW_READY
  clears RECOVERY only on the first boot (found in review).
- 6/13 to 8/13: new, Florian Maurer's series [1].
- 9/13: new, the QMI handle leaked when the QMI service init fails
  (found in review).
- 10/13: new, a failing IRQ setup in the AHB probe left the booted
  firmware and the QMI client behind (found in review).
- 11/13: new, queued QMI events leaked at teardown (found in review).
- 12/13: new; an earlier version gated the register accessors while WCSS
  was down, which review showed left the restart work running into the
  next firmware.
- 13/13: new, the cooling devices were unregistered on every recovery
  and never registered again.
- Rebased on ath-next.

v2: https://lore.kernel.org/r/20261018210153.1925962-1-julius@bairaktaris.de
v1: https://lore.kernel.org/r/20260805192129.61113-1-julius@bairaktaris.de
[1] https://lore.kernel.org/r/cover.1793531790.git.fmaurer@disroot.org

Florian Maurer (3):
  wifi: ath11k: don't disable ext IRQs twice
  wifi: ath11k: depend on RPMSG instead of selecting it
  wifi: ath11k: ahb: stop TX before WCSS is reset on a firmware crash

Julius Bairaktaris (10):
  wifi: ath11k: initialise the CE descriptor waitqueue once per device
  wifi: ath11k: keep the radios when a firmware recovery fails
  wifi: ath11k: keep the srng allocations when a firmware recovery fails
  wifi: ath11k: clear CRASH_FLUSH only after recovery rebuilds the rings
  wifi: ath11k: hold back WMI commands while the firmware restarts
  wifi: ath11k: release the QMI handle when the QMI service init fails
  wifi: ath11k: ahb: configure the IRQs before the firmware is booted
  wifi: ath11k: free the queued QMI events when the QMI service is torn
    down
  wifi: ath11k: stop the restart work before WCSS goes down
  wifi: ath11k: keep the cooling device across a firmware recovery

 drivers/net/wireless/ath/ath11k/Kconfig |   3 +-
 drivers/net/wireless/ath/ath11k/ahb.c   | 135 +++++++-
 drivers/net/wireless/ath/ath11k/ahb.h   |   4 +
 drivers/net/wireless/ath/ath11k/ce.c    |  16 +-
 drivers/net/wireless/ath/ath11k/core.c  | 114 ++++++-
 drivers/net/wireless/ath/ath11k/core.h  |   5 +
 drivers/net/wireless/ath/ath11k/dp_tx.c |  11 +-
 drivers/net/wireless/ath/ath11k/htc.c   |  22 +-
 drivers/net/wireless/ath/ath11k/hw.h    |   1 +
 drivers/net/wireless/ath/ath11k/pcic.c  |   4 +-
 drivers/net/wireless/ath/ath11k/qmi.c   | 391 ++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/qmi.h   |  38 ++-
 drivers/net/wireless/ath/ath11k/wmi.c   |  44 ++-
 13 files changed, 672 insertions(+), 116 deletions(-)


base-commit: 1983b40acfcb3c3464b291c85977290a785bcfdc
-- 
2.53.0


