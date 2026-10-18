Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522E1CCF2CA
	for <ath11k@archiver.kernel.org>; Sun, 18 Oct 2026 21:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p05I9ZTr0xocFHcXHKxdWxiCmf5s7sTPdQviWKawAQI=; b=reX/Q4udrrRnw/pfyXSGm+YSyK
	fqv3tUTIr6MxtyLCY+51y/j91D97jrbCmjDu7iGY5Q8hVUSsuJu0KvqdwPqGkE3/H4DMgkzBbI82X
	gDmJ+KPO7bvgU8tCXMSDBBAvCbMogW1EbaLTSyuwydxq4Oh+FP0TAY151bLCRjmxQSfxKTZK2oQ0s
	GxuQHYV7GgPmA+FQuumN6sgVA826ZAQqUMQZhRGMBikYW3JAcNA0sL9viWBw/RY0zUG5P6jAMs4MM
	RojP3og3PDB//uCf60J1QwgYji4FjEupFKgj+tUimmdz6AddtbF3XvyYuAuhDbWXAWER6ifSDAb6D
	H64Wf7Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIY13-00000006EBm-1BTL;
	Sun, 18 Oct 2026 21:02:01 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIY10-00000006EAz-1V1h
	for ath11k@lists.infradead.org;
	Sun, 18 Oct 2026 21:01:59 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c2acc1e170cso203768666b.1
        for <ath11k@lists.infradead.org>; Sun, 18 Oct 2026 14:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792357316; x=1792962116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p05I9ZTr0xocFHcXHKxdWxiCmf5s7sTPdQviWKawAQI=;
        b=cbS1LrcqiFzRLG2TXLCkVI8WbJyxvHbl8ezkMVHZKJNlVeR8XrKLaAyya85qS/JeUm
         F1UhkELYmNGq+ha2Z9aVKaDJ/3t4VeEmf8sOgK4WLci18Cw8FD0UP0PsvnLFoJsc49nD
         lNddilWff16NOd9ORnNWOB5CgDhlnq3mBDDvhaiDUgfGkIj43LYwPC4T0VpzRdDMoJ2P
         Xt0A12+k7xHbcqYIu+iHJ+iVtCrfUnIuff31nuhSOmqP7nZ222hLkRiFqyNi0w5rqSb+
         JRyMEGLLAjp/iFMkf0bWqAOiok04VKiV0yU8HTHRVEdhO8QDhsEGxQlAXtBk4MoMbEO7
         3TxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792357316; x=1792962116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p05I9ZTr0xocFHcXHKxdWxiCmf5s7sTPdQviWKawAQI=;
        b=DmGFSLPLm7HEv7kcK46pV9EQMDjd2h41Lkf+UXp/Ea0rDBiogMFoHgPJyUMOLLiCTH
         rO4qn6JbiuNDndQx8mZV8AvlCht18xSWA2MA/QfoTw9CZ58xBGSu6aaPCb5lgk4D+wvo
         cqicCdi/S8Coi00Kbm3p+SmPtO+wW8ql2wXeJrTgavTtIunRLwtxpUpw3WKeKDo9QGSD
         o9nl/mqEW4y/6xtI7LnEvDel9HR/1IRt0j+4OJNi2Q0gtALZmqFC1WPQiYLLt7cJY+/6
         BVS8bBehVDh2/WWrPNUq9uTUNQj6+wBxMs0CO8afjE+44LR6qBUb/xk1TJ61frFP3loc
         rkmA==
X-Gm-Message-State: AFq9FYK1wH0AgqmP1aLykdtsv5w0z904LzEwbG1Nm7UR+KECcj53Mm+K
	XziVbKP7j/bY4f0ItQNWiVUyuK4mtnGhOmxvH5yylCan2Ut8zw+qWzRJKGkPOBCA5MHQUMxhNKd
	i03YZ92MYcfE=
X-Gm-Gg: AYBFou2KMA/JhbT1/KfDoKjQWxRj0+3xXIGRx5Di3ZwdypYCMMF9sxSz6hYeXLQhQub
	mcBYvOWEr6VAEsYCsiE9lnc2rkal5qj8x8B46Of+NTSuQCV8bBYe2V+G8NvdCIHNhWcf1ww/n7q
	HY8GlVvTpK+0ZNCcnDWLb6GYKz3UO7jtfhW3UfJTE5k89SIdZw/pejF3coGfq7vYd0FCG2mmYD+
	C+vMQstEIgTXvzargnL0stf6jWW3OhqiE2ld1iY+fEnvlETd4N/yi0KIC9v5LelW7wbdynm00Jn
	1/53woVQuVrSaQjN3If/Yl2SSNopUV3VDF5eRJ+AoitWXZj5nC1wp1NM26Ecy3iirOOfsTPEp/o
	/jhKv43cdIYqR2nbWQbpvpBI9cwVpOZVAN0GgBZHa+x8DuRTZhVRySjsnhhNIEM72pFIEXn+liJ
	IfN9sNkF3qAwEtsX5lYtgo5qw/GYHYmX0diIExfU7Ib6jYUW7Xa+H7E1IgYPoE/iH+610wiqf51
	hAJ7YY2nKdn5fn/UiEwI4JdJaFn4Js7DlbPClPJVSAI6kO2UvlLOJVHa7IWbuVhmkHtsDlRb0M8
	KggvkO90cV0pH10LzHoK82ZndU/u6bUgkcIzHOsBN2hlFMthppjbyi5NPJbhKlUoTb+ENpIKzf0
	tbJco9Ztb6Biw4gk8yaPOApZ5uO4VwiyWNy3sgaaMUhPB1CPYp3R4/obq4UklrV2lULprGuij3H
	8/XdNnIqX3kg==
X-Received: by 2002:a17:906:c150:b0:c3f:d8f2:f08e with SMTP id a640c23a62f3a-c41a01f2fd9mr408627066b.44.1792357316312;
        Sun, 18 Oct 2026 14:01:56 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912cefd4sm291618666b.35.2026.10.18.14.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 14:01:55 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	John Crispin <john@phrozen.org>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/5] wifi: ath11k: firmware crash recovery fixes
Date: Sun, 18 Oct 2026 23:01:48 +0200
Message-ID: <20261018210153.1925962-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_140158_419874_BE867C5C 
X-CRM114-Status: UNSURE (   8.26  )
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

Firmware crash recovery on IPQ8074 resets a waitqueue under a sleeping
WMI sender (1/5), frees radios and ring memory still in use when it
fails (2/5, 3/5), sends on rings it has not rebuilt yet (4/5), and lets
cfg80211 commands crash the restarting firmware again (5/5). Patches 1
and 4 are v2 of the series linked below; 2, 3 and 5 are new.

Tested on IPQ8074 (WLAN.HK.2.9.0.1-02146) with the firmware assert from
debugfs. Without the series, every recovery reported list_del corruption
on the CE waitqueue (6 of 6), an RTS threshold loop during recovery
faulted in ath11k_hal_srng_access_begin() (3 of 3), and after a failed
recovery the next crash faulted in sta_info_hash_lookup() and rmmod in
ath11k_dp_rx_pdev_free() (1 of 1 each). With the series, 12 recoveries
(5 with the RTS loop, 2 with beacon updates, 2 after a failed recovery,
3 idle) showed no fault or list corruption, a failed recovery recovered
on the next crash, and rmmod and reload worked.

v2:
- 1/5: name ath11k_connect_pdev_htc_service() and ath11k_wmi_connect()
  (Baochen). Add Reviewed-by.
- 4/5: fix the recovery ordering instead of testing srng fields in the
  CE layer (Baochen). Drop the ath11k_ce_completed_send_next() hunk.
  Fixes: the first driver version.
- 2/5, 3/5, 5/5: new.

v1: https://lore.kernel.org/r/20260805192129.61113-1-julius@bairaktaris.de

Julius Bairaktaris (5):
  wifi: ath11k: initialise the CE descriptor waitqueue once per device
  wifi: ath11k: keep the radios when a firmware recovery fails
  wifi: ath11k: keep the srng allocations when a firmware recovery fails
  wifi: ath11k: clear CRASH_FLUSH only after recovery rebuilds the rings
  wifi: ath11k: hold back WMI commands while the firmware restarts

 drivers/net/wireless/ath/ath11k/core.c | 21 ++++++++++++---------
 drivers/net/wireless/ath/ath11k/wmi.c  |  5 ++++-
 2 files changed, 16 insertions(+), 10 deletions(-)


base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
-- 
2.53.0


