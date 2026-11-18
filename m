Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621BA60A2622
	for <ath11k@archiver.kernel.org>; Wed, 18 Nov 2026 15:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NeVIBYO1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WaXy1LfJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=q1uTWmN4NrrhHRY9maAq9K2SZl1nt7OOy9DAyvWQOgE=; b=NeVIBYO1P7IK0S
	4e9JmMKEmpHgwaTje8BN4xtS9CqDjT6bH75GnGG9t0DfCvHxkIZNq5u7PzouM6co4OSjE2xFfeGz/
	NKoKZ8juUoVbdGzbrFHEN6JM2DJaTM0WKntXRkJrv2jEwF/P3VtTONhaPb11tuki6v8eflm70uCv5
	9WvwyzBZbBKyqtMPGL+TsJHu81wbzrlsze4JmNRm0rycoB4u9IlOtF1r1HSQqHdwlUYrYEEY6K/SE
	tiHi5RWHZ6YUetlY1tuHqgek3Prg3dJiXbUHEygtnAwcby8OkQiKEAwReHXcOl1x6xaiqpHLa5f1g
	Va0dszuFhn/4U2F9uvvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThcB-00000009Ily-0BEt;
	Wed, 18 Nov 2026 15:30:27 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThc8-00000009Iju-2YtO
	for ath11k@lists.infradead.org;
	Wed, 18 Nov 2026 15:30:25 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-3282db206d3so3064714eec.0
        for <ath11k@lists.infradead.org>; Wed, 18 Nov 2026 07:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015823; x=1795620623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1uTWmN4NrrhHRY9maAq9K2SZl1nt7OOy9DAyvWQOgE=;
        b=WaXy1LfJGeo3mmhwtWoVB6S6iLeQIHj0FQQYmeVtL4ErVYuvMGyPrW6j9oLngXijpt
         RXNZ1RgOXm5KZV32P8J2geZiqoVwCxLJT4Z+EH9XkK439V3UQfiJY5cZXjL7tdh8ccoz
         W8fbKuvyQYNVceODbGnp2sv/S4aQmldhT8ZQvacPK5a9x7Nkrh2vbsi22TPgC7vwhi8m
         g0DfcCzuDDzzogaO2mfP8nO1wp1TF7NkO/LIiwSdjRMCoebcKjImPI+hX0X3fAIkm/i/
         j3QPv14UVD5uc77GEITYkd7A8qI2HIbsbxA+mZFIhbjb/Yz+MlVOueXUyNfejrtVzf9Y
         256w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015823; x=1795620623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1uTWmN4NrrhHRY9maAq9K2SZl1nt7OOy9DAyvWQOgE=;
        b=dX6r2yJlP5gx/UHyxLxnT1RkEaPT8eb6q2/46pOfboSGuQVakqW3tnk5hibKM365PP
         62Q4xjjtYHJoWh74heLIkNEIoiqbS8GPGBKWr9uMrpI90Z8WjGzShFypWE57CghnxsZJ
         4DS58MhSqLbTcFITn9JCZ/uXH1F4cpWplyreA37ml663TDY99mCDZJ3Q6Vpx+2nRsfip
         WCJKhbIriIjqQ4boU6ROboJc1N7mPw9tMoboMe70L8P5n0j6CCgBpfXLZEUKK6T33riZ
         S+a+JLpWKXZTFg4UFnPFlBgJS6dZiy1+x1JqMl3IfSlqvkl12Vt4PsBacrsk/3FCQHla
         oCnw==
X-Forwarded-Encrypted: i=1; AL+hErEnURQwXJifHR9BI+2Sl2HKU7MQvgUFVCD7dhmHWv0Uz7rbxhRdzD5dzAUXFo3ZTomm7inEx/Q=@lists.infradead.org
X-Gm-Message-State: APuU4Z9CcCdFjS1z5Xm65LcG8+KSVRu9K9GAlTdDF+B41D52hZVPKgTv
	yme1ADc1bw3ruUktG2wNeiIDIR7VZbC9SIHd67+RTkkmB14SbbXgpzqG
X-Gm-Gg: AZFdTZePMXDpsH528sHU5I2KKP1UshwRTNYj88Hod5EwuuGYP3J5epD00sTrUuKoEdR
	rKyJclFCRzu7D8M4+i+7l2woIu9eGiYu9m9rngSWbOYX2jnKHHtWFyM93A7dgGX8xrqNhTO+mUR
	U0BqvZTKvTLxkcKwo8SObkXL5JYkihxQ/a2nvsS1A7+MedwsUIscVVhRFheoWS211MsfDrpqzF0
	e/Yvr+gNImKc+foqN480y0lZInXDuvy7bUcFsI95LuR7LcYKafNEakPxXgZYec0XBFx68O9kZjj
	diJ98zZwLvMMkzMMfdR41DoBju+/GIBPhxvmgEwHbTu1Z3iuGIVxHw421bcV7EMNs5s4U3NoGTw
	D+hMzFWFRhXkJiwx1gopI1PlBIIYh5Otf6A4Wlm4+rc9U+STFwaoFkaAKkbYCMVyz8dAai1coHJ
	Bj79/2xwAtCVARUG8obSWwegrHwCLPPhMs78kND5svUsfSkyKEmvZfVh7tUsvm6QZ9iEyE32RcW
	LJCJSvN0Uc4J0h7QCv1xsy6LFUFOlAZn3H8jT70Qa9dKi2KYXGu93ULxsb7wKEYfeB1QjELPbvw
	/xwb2xz92OfebZKFdr+Niuhq33zXicLfejQ2Ri344sz36ePc/ZNgFYiI5BVj1wpaYCgEhuAd0r1
	4wHW9QQ==
X-Received: by 2002:a05:7300:e009:b0:370:a11f:dcb7 with SMTP id 5a478bee46e88-3828161f1d8mr2879861eec.41.1795015822594;
        Wed, 18 Nov 2026 07:30:22 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:2c16:ada8:2d24:d03])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a630517asm8922616eec.8.2026.11.18.07.30.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 07:30:22 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
	Wen Gong <quic_wgong@quicinc.com>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Anilkumar Kolli <quic_akolli@quicinc.com>,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH ath-current 1/3] wifi: ath11k: don't walk an unallocated regulatory info store
Date: Wed, 18 Nov 2026 23:29:40 +0800
Message-ID: <20261118152942.62838-2-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118152942.62838-1-enderaoelyther@gmail.com>
References: <20261118152942.62838-1-enderaoelyther@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_073024_666253_1CFA146C 
X-CRM114-Status: GOOD (  13.32  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath11k_reg_free() resets the regulatory information of every radio in
ab->reg_info_store before it frees the store, without checking that the
store exists. SERVICE_READY_EXT counts the radios before it allocates
the store, and since commit 64828f091c7d ("wifi: ath11k: fix
reg_info_store leak in ath11k_service_ready_ext_event()") its error path
can also free the store after a firmware restart, so ab->num_radios can
be set while the store is NULL. A later ath11k_reg_free() then resets
the radios through the NULL store and faults on the second radio.

Reset the radios only when the store exists.

AI assistance was used.

Fixes: 7004bdceef60 ("wifi: ath11k: store cur_regulatory_info for each radio")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Found by code review. Tested in QEMU with KASAN, using a test module
and a test-only allocation failure in the SERVICE_READY_EXT handler that
leave a two-radio synthetic device without a store, and then calls
ath11k_reg_free(): without this change the call faults in
ath11k_reg_free(); with the series applied it completes.

No new W=1, sparse or smatch warnings.

 drivers/net/wireless/ath/ath11k/reg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/reg.c b/drivers/net/wireless/ath/ath11k/reg.c
index 1030e119fd90..13e2ac96a12c 100644
--- a/drivers/net/wireless/ath/ath11k/reg.c
+++ b/drivers/net/wireless/ath/ath11k/reg.c
@@ -1049,8 +1049,10 @@ void ath11k_reg_free(struct ath11k_base *ab)
 {
 	int i;
 
-	for (i = 0; i < ab->num_radios; i++)
-		ath11k_reg_reset_info(&ab->reg_info_store[i]);
+	if (ab->reg_info_store) {
+		for (i = 0; i < ab->num_radios; i++)
+			ath11k_reg_reset_info(&ab->reg_info_store[i]);
+	}
 
 	kfree(ab->reg_info_store);
 	ab->reg_info_store = NULL;
-- 
2.56.1


