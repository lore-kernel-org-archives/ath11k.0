Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182ABC531D0
	for <ath11k@archiver.kernel.org>; Mon, 27 Jul 2026 16:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lCYT1Xihnl2MEFF4EmXT3VpRMBqw9OFUfd1mdz2BxHs=; b=vvrvGB0juP4wi1pk2cFQCDgX0Q
	JDzYU7VSZ+GcXC3tVMDbIQDOf0UilLb2pbzHkT2djcsSSDfg37tQRPEqlitCJy1Q8hZcyAaDTQxgW
	f/wgCcnBI/DY7t3sDAemDMWyVRhZAesbGr93MvXjM/YCQIyLIVx1Zk5WpiqJx7X0YdbvvIUEzlCjh
	guyLeGoEPc32dVcm/SfbUQT/z+33wQFI9u22+H+2qO+mEsbvqIJYbxCKRd8NdYHEKK4DcE8ceJzqR
	cbMmf5GTgOCqbSWYe3S8q6Mz/GIp/wsnGc/XHi3981G5OYbvQc7V8ct+ChXVTK+6gjx/wchqrbuf8
	ArATXizA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOBZ-00000003K7W-2fB0;
	Mon, 27 Jul 2026 16:28:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woOBW-00000003K56-1Lrh
	for ath11k@lists.infradead.org;
	Mon, 27 Jul 2026 16:28:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785169688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lCYT1Xihnl2MEFF4EmXT3VpRMBqw9OFUfd1mdz2BxHs=;
	b=bM6iJfkh09hZGHjNv822TqZG9cflOh7UzbsA/ISlNi4uOEoD4CMpaP2JCeIfSrHlXIsSdU
	RCGVvt/Vn8/yKV/ZHu71ps+EWXMaLI9zvNrJqVJlsetFrEFrogSVBx8Jc/5SLR3Z6DTEO1
	OVp0KH5URpDDSqGohdA9FK1lUzNLNfo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-290-aMQfWe6_NvipD4KRy9ov0Q-1; Mon,
 27 Jul 2026 12:28:03 -0400
X-MC-Unique: aMQfWe6_NvipD4KRy9ov0Q-1
X-Mimecast-MFC-AGG-ID: aMQfWe6_NvipD4KRy9ov0Q_1785169681
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 593741800758;
	Mon, 27 Jul 2026 16:28:01 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.58])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3246C42B;
	Mon, 27 Jul 2026 16:27:57 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Subject: [PATCH 0/5] wifi: ath12k: fixes to improve MLO station stability
Date: Mon, 27 Jul 2026 18:27:43 +0200
Message-ID: <20260727162748.963275-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: rh7ptEsHK2cy0-1lP6y5dt-ns7sMSm9BoNOVC2yFXis_1785169681
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_092810_429942_2979C5C1 
X-CRM114-Status: UNSURE (   5.51  )
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

This series improves firmware crash recovery and connection stability
for MLO (Wi-Fi 7) stations on ath12k. Both work correctly for non-MLO
(Wi-Fi 6) stations, where the driver handles the full teardown and
reconnect cycle without issues and maintains stable connections. This
series brings MLO to the same level.

Without these fixes, a firmware crash during an active MLO connection
results in kernel warnings, NULL pointer dereferences, 20+ second
recovery delays, and periodic disconnections both after recovery and
during normal operation under heavy traffic.

Patches 1-3 fix firmware crash recovery:

Patch 1 moves the RECOVERY flag clear to reconfig_complete and adds
        CRASH_FLUSH guards to prevent operations on dead firmware.
Patch 2 prevents scans during recovery to avoid NULL dereferences.
Patch 3 fixes ML peer ID desync between host and firmware by syncing
        the peer ID from firmware's actual value.

Patches 4-5 fix MLO beacon miss handling:

Patch 4 fixes beacon_iter to iterate all MLO links instead of only
        deflink for BSSID matching and connection_loss_work
        cancellation.
Patch 5 complements patch 4 by skipping connection_loss_work for MLO
        entirely, since its cancellation mechanism is unreliable and
        the mac80211 probe triggered by ieee80211_beacon_loss() is
        sufficient to detect real AP unreachability, as done by other
        MLO-capable drivers such as mt76 and rtw89.

Tested on WCN7850 with MLO (Wi-Fi 7).
Firmware crashes were observed to occur spontaneously during normal
MLO operation with intense traffic testing, though rarely.
The debugfs simulate_fw_crash interface was used for systematic testing
and reproduction during active MLO connections with traffic.

Note: I will have limited availability from mid-August to
mid-September. I will address any review feedback before then
or promptly after returning.

Jose Ignacio Tornos Martinez (5):
  wifi: ath12k: fix MLO station firmware crash recovery
  wifi: ath12k: prevent scan during firmware recovery
  wifi: ath12k: fix MLO dp_peer ID desync with firmware
  wifi: ath12k: fix MLO beacon handling using per-link addressing
  wifi: ath12k: skip connection_loss_work for MLO beacon miss


