Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E21BC61CE8
	for <ath11k@archiver.kernel.org>; Thu, 12 Jun 2025 09:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TpZLNWW0DOhsGzvSZThrO5Z24o9vsj5Ub5xo7XurfUA=; b=s3ewzW80gKM186sPRCpFjjRM67
	21SgqOLDStuYQ1JdllcbaY9iEfPkJB1Z1ZHZod9YWJ6+kLVwE65hABxgCrsdCgrtSCCz3ABdcKusa
	WF5BN4NTmU2Zzb8nQh/Zl2VZcS8LvH7lCvQix3PRjt50jjkipErBZwU1HbMBbxVt0Pmwf8baaK+mZ
	gyub6+DXlgoXfD7Pg5L1lkTesbN5BYTPFC+38+xBYlWrNYjs2URQskOANrKD39B2SXBGKWJHAygXR
	U9FaTv7Owo5QuaemJL3uE6kCMnqk8/oxtVNNPjb2JauhkYXOSnhVKeXzl8IT0tdIZO0PGN1xaQ2Fw
	c4vKNbpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPehP-0000000CtIy-0buR;
	Thu, 12 Jun 2025 09:58:19 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdZP-0000000Ch3K-3jGx
	for ath11k@lists.infradead.org;
	Thu, 12 Jun 2025 08:46:01 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-74865da80c4so498666b3a.3
        for <ath11k@lists.infradead.org>; Thu, 12 Jun 2025 01:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749717959; x=1750322759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TpZLNWW0DOhsGzvSZThrO5Z24o9vsj5Ub5xo7XurfUA=;
        b=TDgqtkM6VzCPcGO0vdKlZQmFrkbRmFoO3JK0pWDF2mIV/W2yAG6y4T+1UEBjIfpOrm
         RR1kpNyU9KyNaa+i7sSTxsu234uU7nTDM5Lgh1XQEITapFKhrDKalOS3o/E5TtUKPO0S
         vzOGZyy2CtBDU6Iw/6s/KiMnqcXXiQH05mcNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749717959; x=1750322759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TpZLNWW0DOhsGzvSZThrO5Z24o9vsj5Ub5xo7XurfUA=;
        b=IaV/vjRnP4UzCkOO4R9RZMMOlivcAvkcudVk1361KixlgXCP5YKsU3YmLLAP3JPL7b
         5u7V3yysJ9ecYsbn7wu8jVLgH5b3JwS++Gk1ZKIGDZBkTmngw+3J/jRQs24KA6GY6UJV
         m1l2LPt//tUgLU6ZZnJrIRNDs1+JWgeizongJ5Tmonez3MBbNtu1ulyfMLVAxXLTkE+i
         uKRTDPHX/29a9irGmpG1FOi8ku/ZVw4dBjZpTqFDMcuQUKDQkLgbBw/EJyQrDirLgzWe
         GeGPTghtXi6p2CWmg5RwkAysahBPVhxrWo5vO2ABToYvvUT4SIEsGDTYXnSbqURN3I2z
         rATQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPoPfs+7cqKPy5kxQhOCa83yo46fsoTbv+nkwG10eVUEwY+RTJPb11ki3A+30ycmiu29Yq2Wo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFzwcDHVy9bdTaV1uzrjEnLvcW23E1ieWIAgj+nSWcAYINluA2
	+iFImRudjdFWuDPDyGTqM+j/hFOvU5NQQLokvW5jP0NjGgW6Su3WrbdswyopW1guGA==
X-Gm-Gg: ASbGncvHguGprq63rSyamf7dAXSM1cghEOlYLJ9g0vWM4E7D30ydCwkMkECZqXVcA7i
	9u1iwDbY/T0lDkgWbUP2NeoGVIZDCG5BqLzwndPWUvBSxhUnu3H1TK6eGi3SJk+W+AI2GK0y6NF
	KaixERG9YasWtC0t2k9cvkvgQOz+0RtbrR1mpk5xizgzweUuZ8OcsgRXdIClU9JwLHGNw9Vu6Ji
	SGmmqdNT5OttKkrypMDnNjzIVFR0Jk25XtEdbMAw1LMQMJUje00l0qx5XDyPwlZY581BdP8wdyX
	U6Z4qoqbXOZxKriljiHnsLs0/Ko5B3Rtbb+tKjHkB+pM0uZWllW5yqKXMThxkWXQJYO+Ypy7WFI
	2P4fAcVlTaQQ=
X-Google-Smtp-Source: AGHT+IH+WHMtXn8bwbKfQnFjtwXx1iGxMWnJkL+ndCJJX/b5xWKBlUyZSGGvyl1WSRHTr2d/Tewnww==
X-Received: by 2002:a05:6a00:8593:b0:746:1e35:3307 with SMTP id d2e1a72fcca58-7487e22c268mr2650354b3a.14.1749717959076;
        Thu, 12 Jun 2025 01:45:59 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:fcb5:79e0:99d6:8d5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74880a10152sm933200b3a.172.2025.06.12.01.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 01:45:58 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3] wifi: ath11k: clear initialized flag for deinit-ed srng lists
Date: Thu, 12 Jun 2025 17:45:06 +0900
Message-ID: <20250612084551.702803-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_014559_925797_BA7FC3C0 
X-CRM114-Status: GOOD (  11.56  )
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

In a number of cases we see kernel panics on resume due
to ath11k kernel page fault, which happens under the
following circumstances:

1) First ath11k_hal_dump_srng_stats() call

 Last interrupt received for each group:
 ath11k_pci 0000:01:00.0: group_id 0 22511ms before
 ath11k_pci 0000:01:00.0: group_id 1 14440788ms before
 [..]
 ath11k_pci 0000:01:00.0: failed to receive control response completion, polling..
 ath11k_pci 0000:01:00.0: Service connect timeout
 ath11k_pci 0000:01:00.0: failed to connect to HTT: -110
 ath11k_pci 0000:01:00.0: failed to start core: -110
 ath11k_pci 0000:01:00.0: firmware crashed: MHI_CB_EE_RDDM
 ath11k_pci 0000:01:00.0: already resetting count 2
 ath11k_pci 0000:01:00.0: failed to wait wlan mode request (mode 4): -110
 ath11k_pci 0000:01:00.0: qmi failed to send wlan mode off: -110
 ath11k_pci 0000:01:00.0: failed to reconfigure driver on crash recovery
 [..]

2) At this point reconfiguration fails (we have 2 resets) and
  ath11k_core_reconfigure_on_crash() calls ath11k_hal_srng_deinit()
  which destroys srng lists.  However, it does not reset per-list
  ->initialized flag.

3) Second ath11k_hal_dump_srng_stats() call sees stale ->initialized
  flag and attempts to dump srng stats:

 Last interrupt received for each group:
 ath11k_pci 0000:01:00.0: group_id 0 66785ms before
 ath11k_pci 0000:01:00.0: group_id 1 14485062ms before
 ath11k_pci 0000:01:00.0: group_id 2 14485062ms before
 ath11k_pci 0000:01:00.0: group_id 3 14485062ms before
 ath11k_pci 0000:01:00.0: group_id 4 14780845ms before
 ath11k_pci 0000:01:00.0: group_id 5 14780845ms before
 ath11k_pci 0000:01:00.0: group_id 6 14485062ms before
 ath11k_pci 0000:01:00.0: group_id 7 66814ms before
 ath11k_pci 0000:01:00.0: group_id 8 68997ms before
 ath11k_pci 0000:01:00.0: group_id 9 67588ms before
 ath11k_pci 0000:01:00.0: group_id 10 69511ms before
 BUG: unable to handle page fault for address: ffffa007404eb010
 #PF: supervisor read access in kernel mode
 #PF: error_code(0x0000) - not-present page
 PGD 100000067 P4D 100000067 PUD 10022d067 PMD 100b01067 PTE 0
 Oops: 0000 [#1] PREEMPT SMP NOPTI
 RIP: 0010:ath11k_hal_dump_srng_stats+0x2b4/0x3b0 [ath11k]
 Call Trace:
 <TASK>
 ? __die_body+0xae/0xb0
 ? page_fault_oops+0x381/0x3e0
 ? exc_page_fault+0x69/0xa0
 ? asm_exc_page_fault+0x22/0x30
 ? ath11k_hal_dump_srng_stats+0x2b4/0x3b0 [ath11k (HASH:6cea 4)]
 ath11k_qmi_driver_event_work+0xbd/0x1050 [ath11k (HASH:6cea 4)]
 worker_thread+0x389/0x930
 kthread+0x149/0x170

Clear per-list ->initialized flag in ath11k_hal_srng_deinit().

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---

v3:
- updated commit message and subject line (Baochen Qiang)

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
2.50.0.rc1.591.g9c95f17f64-goog


