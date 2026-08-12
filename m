Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE0AC5B572
	for <ath11k@archiver.kernel.org>; Wed, 12 Aug 2026 14:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NhF+5+IkWvEfJOpZIxvPcr/6RRXPpqOnEBt9tf6dcVM=; b=EKLXEitzIJ7eGAxuTS5rJdFSDS
	aHq9cy+Kk/qWytp/AoP3Fm3Q5b/QGKBRQVWOxHf537xKgXoiCtCejhjN8WwklAY8akjsmLngBdTh3
	HcrQliDLf1pYen0S6QBsXpUUheoM2mN+1RzseBBskskGxn4rJ21rpmBiTyHUm8A39XR4nkq3pQ/qD
	AZ2zX5Dr3x5FMnXsaZp736yUKhvt+UWO8V9b+O8eVmIvmF+KnSpPbNo5Lf2T2jdRFGvXJpF0Vu/Oj
	f1nk5AQxlfv7W/McvJULl0DaXAMBnvIqHTfHXZt3qAX/qXaNcdOVMjPB3bbTAkmmbdYBuY2l0t8tC
	PWUIAlsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuAQP-0000000GQEY-0TvR;
	Wed, 12 Aug 2026 14:59:25 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuAQM-0000000GQE9-0Y9C
	for ath11k@lists.infradead.org;
	Wed, 12 Aug 2026 14:59:23 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-496b7622a83so7546115e9.2
        for <ath11k@lists.infradead.org>; Wed, 12 Aug 2026 07:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786546759; x=1787151559; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NhF+5+IkWvEfJOpZIxvPcr/6RRXPpqOnEBt9tf6dcVM=;
        b=XWnkK2HPitwiPdnB8W96rX1/1COCQa8iF623zeVR/eMlNy/YgnKMpkWKNtFe74lLqK
         FUZRQ7N8tDTlLhou81+pnu/+L7B2ZFAPWEaV+JxdoSDWXNIo6WB3/zl0JRhTYi/LoCHL
         OXLCKzer9J3sFUIJbCIv1VaibLFlE2Rpz8vkeEaOGoeo8gthbxiQXKXSw3fWUz0C4HjW
         bcBbRaP++ORzTshVNLkBXA4c4tLFXCQokN9+l+iaRCQlQKZwriSRVAGx/XqUgQVuIsgc
         1y55amwjUsLugOoD7yd+gbY/9DvxZR2I0sLH++kM1mYvjVy8LH0kvhFpfL9kbFHJBSKi
         MUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786546759; x=1787151559;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NhF+5+IkWvEfJOpZIxvPcr/6RRXPpqOnEBt9tf6dcVM=;
        b=YU+Sgco7OcfueBZwL7p/b/YU9lRO4Aojbp8p9Y4new6ydfoLmmPXOgTon75E18zg5f
         Pe55KfnbpsFEfnq11zImGMk6lCpp8YcRjyB1Si1I5PY+FcCB0T86RFDtBC8RQqBaFICh
         PPPIwVjHr/Q7FdLYAcxMrLwMjwrvQSA35pf5hCFFAZrhvzEhGsSNuVSBzbYy9D9bN+vd
         q2pXonPa0xITDuZGd7tquif3nWLpqpOuXtIS+i01MnhkvO6+aV14KzVeWZV/5FK1n/J5
         gbBGE137MX6M4UBEOSeyC7gJg1Ey9J87R3hQBTAI9WdXGDn0Lp3HHJKyOLaE1tGQNqLP
         D7+A==
X-Gm-Message-State: AOJu0YwfFZ2045UPbMhfQF114wr4uRDJyw2ZjDSq8uv8Wy859Q60TMh4
	tjFpV1N2XGgyabvuHP4njPUlJjHDIGuLltai6oAOEa+OaERkN9vLgJm42lU1Pg==
X-Gm-Gg: AR+sD12ZKAjyTlrBotj3qnX63Bqv+QJxXUi13T/P0oym+O7C4pJ80+2BCl4OtSwd7GI
	6zmClmnpa6pOLOngoaeZr/ezmBou+wE48oUALZdRJiu2GaqPASJ1c3nEh+pauUO4JMuGLpkpfQb
	w9IA49hJYJCS0H02rqkj1YcTswm50TWdWPWdD6FFzOHaQkfrrs3NIOx9oHcz6hgpZUykrhpVQn5
	+Yab1qj9XGr1dGpNrAyqKtZFzM/4rvBYzbr362qH+ld71x5YhpU3iEkdO7/62piVmbJCVOoc6/y
	YChcYkqAk8mG3rObR3FAqVermynE5eG6vEPNaCgHdEy0WwD1xexF46OqGYEOFLyIP2DyDL26UXo
	DsY6osC3WbGb634PjY87ZhiPC6Ora98RHqk4E0rr1xHZBb5sCg7TAzwcCOfFf0w7GtqFt26p5rh
	jTG8nkppdxYBF8WuQtG6/O2D8fEeVbkJk3HCwv7p5j9ldv9hbgJrl32yZrvnYBFUZ7z7O4vOp5N
	hizmxmgoQ==
X-Received: by 2002:a05:600c:4e08:b0:499:4892:d022 with SMTP id 5b1f17b1804b1-4997c0d09c0mr81316375e9.8.1786546758852;
        Wed, 12 Aug 2026 07:59:18 -0700 (PDT)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aaa4a8csm82675685e9.3.2026.08.12.07.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:59:17 -0700 (PDT)
From: Nicolas Escande <nico.escande@gmail.com>
Date: Wed, 12 Aug 2026 16:58:05 +0200
Subject: [PATCH ath-current v3] wifi: ath11k: reset ar->num_stations on
 hardware start
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-num-station-v3-1-871d20e043f6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOTQ7CIBSEr2JYSwO8hlJX3sN0gfS1YCwYoI2m6
 d3tz8KVy8nMfDMzSRgdJnI5zSTi5JILfhVwPhFjte+RunbVRDAhmeKC+nGgKeu85mgLUCoA4KK
 uydp4Rezce6fdiM6WmjFG9Jk0h5nG+wNN3nhbvIthoNlG1L+JStRMsRpEAaUUTErKqXcmFJiM9
 i1e+0G7Z2HCsBGsSznEz/5+EvvsQQHGSwZMFhyg4uo/pFmW5QsvHOBQBQEAAA==
X-Change-ID: 20260812-num-station-d33483331299
To: ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_075922_194269_77561D8F 
X-CRM114-Status: GOOD (  10.95  )
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

When (multiple) hw restart occurs, we end up in a situation where we
cannot accept new stations / mesh peers. This seems to be the
'num_stations' in 'struct ath11k' that did not get reset properly in
this case. In ath11k_mac_op_start(), it was indeed the only accounting var
that did not get reset so let's clear it too.

This avoids problems like those:

	[1248828.088023] WARNING: CPU: 0 PID: 12281 at net/mac80211/util.c:1682 ieee80211_reconfig_stations+0x98/0xc0
	[1248828.088115] Call trace:
	[1248828.088116]  ieee80211_reconfig_stations+0x98/0xc0 (P)
	[1248828.088119]  ieee80211_reconfig+0x774/0x1438
	[1248828.088123]  ieee80211_restart_work+0x10c/0x178
	[1248828.088127]  process_one_work+0x178/0x3c0
	[1248828.088130]  worker_thread+0x280/0x440
	[1248828.088133]  kthread+0xe0/0xf8
	[1248828.088137]  ret_from_fork+0x10/0x20
	[1248828.088141] ---[ end trace 0000000000000000 ]---
	[1248836.686604] ath11k_pci 0000:04:00.0: refusing to associate station: too many connected already (128)
	[1248836.686609] ath11k_pci 0000:04:00.0: Failed to add station: xx:xx:xx:xx:xx:xx for VDEV: 1

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.9.0.1-01977-QCAHKSWPL_SILICONZ-1

Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
---
Changes in v3:
- Fixed message typos
- Trimmed stacktrace
- Added hardware revision to Tested-on
- Link to v2: https://patch.msgid.link/20260730140306.133718-1-nico.escande@gmail.com

Changes in v2
- rebased on ath/master
- no code change
- Link to v1: https://patch.msgid.link/20260729080932.3462066-1-nico.escande@gmail.com
---
 drivers/net/wireless/ath/ath11k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
index 2d55cdc4d165..0baa46df1fb9 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -6699,6 +6699,7 @@ static int ath11k_mac_op_start(struct ieee80211_hw *hw)
 	ar->num_started_vdevs = 0;
 	ar->num_created_vdevs = 0;
 	ar->num_peers = 0;
+	ar->num_stations = 0;
 	ar->allocated_vdev_map = 0;
 
 	/* Configure monitor status ring with default rx_filter to get rx status

---
base-commit: e07447e654476262558bee570f4cf456e2b32565
change-id: 20260812-num-station-d33483331299

Best regards,
--  
Nicolas Escande <nico.escande@gmail.com>


