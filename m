Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D164606A320
	for <ath11k@archiver.kernel.org>; Wed, 18 Nov 2026 15:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yb+VWjyn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ip9YZUbp;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HutB8UCf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SziJhar8ezshKnKHhp+CUMmzVZySSfbjzN+eVLHeQo0=; b=yb+VWjynAHm6Zf
	mzeLsi8GSlVNvAsmbuMURpjfuJQvbtgYEpdDa1SaIjCKR+N27L3lfZ0sXeovPX2vbnI15deP/heuB
	3hjW+jxg8JZfNaQMUrgsP4xlnIlUICXcWOZwvGmKky9oWOZI0GOGktPoQTVSD0k6ONP2ULNFe5eff
	+KnVGNGsklGsCmEL+o9w7hqpkOtvvv7VgqRF2doFeBi5XURwmmNT5Ufq3ebm6Z1k6zMqQTnNIiwLI
	Q8ZevXgbmcC0PJBC52F4Yi0feymUASwG0b+YWF7m4zPM0fhPq/n6kH/pqpVLMMM55NGuS/1mnGCVy
	ww+KMb1HwJzbDMyceApw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThcm-00000009JFY-2t5e;
	Wed, 18 Nov 2026 15:31:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThcl-00000009JE4-0y0x
	for ath11k@bombadil.infradead.org;
	Wed, 18 Nov 2026 15:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=SziJhar8ezshKnKHhp+CUMmzVZySSfbjzN+eVLHeQo0=; b=ip9YZUbpfyUpeoQO77hMuk3xHq
	pY5BOcNduOr9ZoTB8qt5yor4AOUhUAveToRqIfYc4BWTq773sT5aOwqQHGSUoY/TMbNew4YZIPDoi
	7bdAbB2mwwN1m9K/rhOAharFW0jT138Tj3204+UQQLda1M03P9qz2IfDpS6dmCCRwmco+FlgVTCVw
	FnmdEeGzMWAsG0dTzjo5mdU7j1I6QONRIpzy4D2KFySvCA3ayLcdj9PjeoQMmfjlND3ftDbYH4dc6
	U0zYV5aIX+xdwdIPxgGA4dwzRvjMhzRFLjTS6w8zr2dCzkNTXN+vwrRMH65CzIeh6ssNPuSv/M5MG
	kuFXkT7A==;
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThcb-0000000EhcK-0snY
	for ath11k@lists.infradead.org;
	Wed, 18 Nov 2026 15:30:59 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-36dbde64409so2099667eec.0
        for <ath11k@lists.infradead.org>; Wed, 18 Nov 2026 07:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015848; x=1795620648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SziJhar8ezshKnKHhp+CUMmzVZySSfbjzN+eVLHeQo0=;
        b=HutB8UCfc/4R3uu9HkM5+qESBBeU1zfCjRF8keXQWj06OsRxmLDEkpscRwphHYwLN0
         JwQ4nkoqmARvAwcp8wMh9jGZFqE8PkgK+IUWXGSFTbSc4GS+80nuwuard1m1VSZKPjie
         ZVb91CQ1blboTEnfl25mntcoQF/xWACmyl0iFj8cb1Guax3iIaT/0lxUQHaDYZboFBHw
         dKQGhd/xOQ8Dw5uq2S25+wNgFt18Hvl8xtc24XSL+O3FMNbssFvqZRbJBzoaqT+wugp4
         Nn7n4XtpBzZpOeQjWR6y+y58HrLUBx8A50yhQtSNgiknL6w8TGGxMDMAqzkxHfOuoYqC
         F3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015848; x=1795620648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SziJhar8ezshKnKHhp+CUMmzVZySSfbjzN+eVLHeQo0=;
        b=TpkP6qCQ9C5jEAOJP6hNBMTNsjWqcstjGmdzcLdBaZDzBw+IA2tjewYI3YiZkCas7Z
         kyV6jD+MW7a3OwMFso5OZyyIqD6jhCb7c05Lg9HoR5j13ZdOZIWLXY+BwZhEYtqYvI0y
         d28u1tDy7Fhj8qjWjzjO9cHYKTBlP8QBElvGqPz+volFu2pMfKt4UYrxsav7D4WF1WOY
         8hEFYTICr9H7Qr6Wt7l93o0RuZ9hlj2Sloiqtl3f/Zk/TaZWqms5ZdbAFTfp8WgsfHOL
         O2MQIJrtvFyrZF0TSPlOCNntHmH9UGhRU9W5srjpQgqeretb3MKXkcFf0lAXu/N1FiTv
         uBcA==
X-Forwarded-Encrypted: i=1; AL+hErESxGWLRCxcmhXIC5Hir5quTHTu9WdhnSp0L6McMb88vgX8fZ0SEIo5GcU+KWMsk2OKyDmcZX8=@lists.infradead.org
X-Gm-Message-State: APuU4Z/N4EpR4hVrbYciXT+306Y+JcGSOmRj2aWpKnOgZH+58SjIA6Yx
	s3yzubG7JC4a1tw+FctOogE8hWbccM5h9kdB+Rs+5KYZE/rUZKzOaBOa
X-Gm-Gg: AZFdTZcC1DZbrN3a/7IPGzLAesc5PJZA5ULZgCeYh9OmqX6rV6aftO4SbAiEs69P3tY
	fSHqLOdSySsgJyHbP2t/RIVBVo9HIQuGrC2MtFyelXcRwWASUkC8Fms7CksXr6J5ot1ZPd4NJQ8
	VPLPkcmcqUNsHDoe8/p2B+lqfaz+1P5pun/Eqq0X2uXD339EM13Za4WkDXTfe9C9TY3LNBtjGCR
	8P0XOWTi48bn/lcAAWhqSzhrTC+TPAWUJ/0yCwKTBmP8SLppGharULPhdjyigVOo77eSaqgv344
	WXAEntKypIRzKrJ7h6iIozEpGYLqsQjY8cPLNqtfVtfa7Jghcy/1Z+ESvYY22aAIMbTsFcem+ex
	QAMDFhPZbe31fiGSecNkjdyhQsK1EqthvK2anLTUt07YJKM+pRdO9P5tAspSFdKatkGzOo9rTlO
	bO/NeT+hekGtSzBSD75a6G2axS7Do3ekgDfZvQfSQkdeHBg365clSsMH2efoNnqYxqNUaxZX9pq
	FlGAEeYLqB1NsQfL7gszrgiQpl2bnAnr+MRO4IWbFX9bQGNmuj5o9gVvC+GlzEqzd+/Hs5/9fuo
	EOWh2pXhQiBos4TyqXrggAAay3a94fwONGQQyqZ3ehnALItc24XCxr0D920=
X-Received: by 2002:a05:693c:69c7:b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-3827f98a2d4mr2357647eec.8.1795015847374;
        Wed, 18 Nov 2026 07:30:47 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:2c16:ada8:2d24:d03])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a630517asm8922616eec.8.2026.11.18.07.30.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 07:30:46 -0800 (PST)
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
Subject: [PATCH ath-current 3/3] wifi: ath11k: keep the regulatory info store on a SERVICE_READY_EXT error
Date: Wed, 18 Nov 2026 23:29:42 +0800
Message-ID: <20261118152942.62838-4-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118152942.62838-1-enderaoelyther@gmail.com>
References: <20261118152942.62838-1-enderaoelyther@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_153054_186834_911F0169 
X-CRM114-Status: GOOD (  14.43  )
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

ab->reg_info_store lives as long as the device. The first
SERVICE_READY_EXT event allocates it, every later firmware start reuses
it, the regulatory events keep the rules of each radio in it, and
ath11k_reg_free() frees it together with those rules when the device is
freed.

Commit 64828f091c7d ("wifi: ath11k: fix reg_info_store leak in
ath11k_service_ready_ext_event()") frees the store and clears the
pointer on the SERVICE_READY_EXT error path. When the event fails after
a firmware restart, that leaks the rules the store holds and leaves the
store NULL while the radios stay registered with mac80211:
ath11k_reg_handle_chan_list() then writes through the NULL pointer, and
the 6 GHz paths of ath11k_mac_op_add_interface(),
ath11k_mac_parse_tx_pwr_env() and ath11k_mac_op_sta_state() read
through it. The leak that commit addressed, a store allocated by a
first start that later fails, no longer needs it: ath11k_core_free()
frees the regulatory state on every teardown path.

Do not free the store on the error path.

AI assistance was used.

Fixes: 64828f091c7d ("wifi: ath11k: fix reg_info_store leak in ath11k_service_ready_ext_event()")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
Found by code review. Tested in QEMU with KASAN, using a test module
that runs a SERVICE_READY_EXT and a regulatory event on a synthetic
device and then restarts it with a failing SERVICE_READY_EXT: without
this change the store pointer is cleared; with the series applied the
store keeps the country code and the rule count of the first start.

No new W=1, sparse or smatch warnings.

 drivers/net/wireless/ath/ath11k/wmi.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.c b/drivers/net/wireless/ath/ath11k/wmi.c
index 08fd6795ed9e..bbca275a8289 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.c
+++ b/drivers/net/wireless/ath/ath11k/wmi.c
@@ -5136,15 +5136,6 @@ static int ath11k_service_ready_ext_event(struct ath11k_base *ab,
 
 err:
 	kfree(svc_rdy_ext.mac_phy_caps);
-
-	/*
-	 * During TLV iteration the WMI_TAG_SOC_HAL_REG_CAPABILITIES
-	 * handler may have allocated ab->reg_info_store, so free it
-	 * on error to avoid a memory leak
-	 */
-	kfree(ab->reg_info_store);
-	ab->reg_info_store = NULL;
-
 	ath11k_wmi_free_dbring_caps(ab);
 	return ret;
 }
-- 
2.56.1


