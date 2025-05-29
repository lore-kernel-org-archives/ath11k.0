Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDD1C5AE59
	for <ath11k@archiver.kernel.org>; Thu, 29 May 2025 03:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ujQ501UPaq8iguu/+DN99t0pQZyaz+0Ycpf8UljFkFE=; b=g7yYKwegh61ZScVRSG4rtvgudd
	GHjZqLBDMeZtkba2rROaNKPTRUlEin2tOE2WDq1s2g6EIPezRi9or8+aM5hTMq5cfkc1VdOxJ9Ssf
	BkjqXzZ3VSAUWiVdgmmd4cs7fz2h7RaPgiBoFnfRlDtZ9zS+3k5y3BTDAqKTAS1tD8rDkCV/vvjiA
	KJL8HhpumkUQJL4LKpno1KzXRszbgO2vsYv1b2MD52D8Ec4RxI2yRRQUG3fv2qiJuhYi/iW0HpX1Y
	KFQjQT6SaxMlVg3TB1tLv09I2w6SkdL92mJiKONJeHmFdNdwHRaFS/7GZdNp/lqzyzKR8i72xnsSV
	TO3uCGzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKUON-0000000Ersc-1pSO;
	Thu, 29 May 2025 03:57:19 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKUOJ-0000000ErrD-2iHI
	for ath11k@lists.infradead.org;
	Thu, 29 May 2025 03:57:18 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-232059c0b50so4775785ad.2
        for <ath11k@lists.infradead.org>; Wed, 28 May 2025 20:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1748491035; x=1749095835; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ujQ501UPaq8iguu/+DN99t0pQZyaz+0Ycpf8UljFkFE=;
        b=f3fr3MiJ56ZiwQ8d+4LuYkUCjZqn8rZko0JGJHrqMnvMS0LpD9O9EDl6FTNfmqgHoD
         exK7hYz3U3JQEWjSNfGen0sSr+YQXU2Tlh09UxTDhIEszWxG/7dHXI2kMNLmTHEAeebu
         FbMtQCNUaJqEEID6Yq36fACpbB7vmHbSMdmiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748491035; x=1749095835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ujQ501UPaq8iguu/+DN99t0pQZyaz+0Ycpf8UljFkFE=;
        b=cUHaD12Ysy/oUKsUg9h/b365PMviohhFJGWby+yANNpNYImj+4PPmPUzyN3/1Ac1Ob
         2HrczPvGRCEwVpiotR+ZggMdVbqObxOn5fJhHhcQaQ44EBPV8U1CfDSWJzYadZqkYyZf
         tLh89oIQLy8TX/dh0fZ2O4eAGR142hveCA5ItrefmU33SjfMDx0w/PGz/thwMXxpo1Fg
         5L5zwiURW4YVZeMCAfqwJqPveRIIxuQbqM6ljpSSmxnlINzuNfppcKOpnNzafZcJ+Sjh
         2pcaABll4/OKcwqJg7FAP7tGnwvvS6xAHwhHSXe/hixFlHZe7zTZK36SpjHn8ZJeqIsN
         Fy3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfhAArEQGOJZwBGXI+DLhBpercDDAs9m7ZqNVEw2/bX6WzsN9jkub3ekPRm39Ejmhu4h78Z1U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5vSCeZa+/6MRG/Qu5T8WnPwl/fAGk5HIYahU2ah902KLZ+VDO
	LaYpice2iRat0dbXOqQUKr2havs8ZdHkIPztihMVjwQdBIXmEPH5DY0/D0g3Yy6d1EwMyhSHSWP
	sW0c=
X-Gm-Gg: ASbGncvA7roGCziGX3ZfmaWCseQ7oFope8t3eIJBJKo2ukFN2+mI/CuDFlfgZZX6PYz
	j1BJaAHPaPRpuAuAMEAymoW8UI70ig2wjF8MADu0VBMa9OiETz5/cTGUYgaXxOGGpbbaPrpfZlW
	KfS/nd4zrcHoGl17aSEwFpmEmBB1CLuHi6Kf87RECyBdErEQ3CPbsty4q2gjRUAGfDQFldeuF7z
	sfXSMVPgDW0NZvaq4MF9pZdHkPc4KPXx/do8BEz/mu+eOMRMda+c1pW2mJsisrPumeGPeBE60Be
	3hrIdM84R9rbKFc6h5XE399ZPBRXYb/Iz4pFP/XVxRuNjcoANM32QwkAEroPWApDbNqK9F2Q+ZA
	E4sekMZMAF6U=
X-Google-Smtp-Source: AGHT+IGIABTdusK3hOipL/Wbdz4EXI+YD5CIdyPMuRvBzLsXeRqHjKpFqiBUS36SMFASd9Lh/nCNxw==
X-Received: by 2002:a17:902:d2d1:b0:22f:a932:5374 with SMTP id d9443c01a7336-23414fc9852mr336996785ad.48.1748491034584;
        Wed, 28 May 2025 20:57:14 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:c024:f903:4009:8c8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf5179sm3488735ad.190.2025.05.28.20.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 20:57:14 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2] wifi: ath11k: mark reset srng lists as uninitialized
Date: Thu, 29 May 2025 12:56:43 +0900
Message-ID: <20250529035708.3136232-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_205716_996192_26B121F4 
X-CRM114-Status: GOOD (  10.06  )
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

ath11k_hal_srng_deinit() frees rdp and wrp which are used
by srng lists.  Mark srng lists as not-initialized.  This
makes sense, for instance, when device fails to resume
and the driver calls ath11k_hal_srng_deinit() from
ath11k_core_reconfigure_on_crash().

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---

v2: fixed subject line and updated commit message

 drivers/net/wireless/ath/ath11k/hal.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
index 8cb1505a5a0c..cab11a35f911 100644
--- a/drivers/net/wireless/ath/ath11k/hal.c
+++ b/drivers/net/wireless/ath/ath11k/hal.c
@@ -1346,6 +1346,10 @@ EXPORT_SYMBOL(ath11k_hal_srng_init);
 void ath11k_hal_srng_deinit(struct ath11k_base *ab)
 {
 	struct ath11k_hal *hal = &ab->hal;
+	int i;
+
+	for (i = 0; i < HAL_SRNG_RING_ID_MAX; i++)
+		ab->hal.srng_list[i].initialized = 0;
 
 	ath11k_hal_unregister_srng_key(ab);
 	ath11k_hal_free_cont_rdp(ab);
-- 
2.49.0.1204.g71687c7c1d-goog


