Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B91E606A32D
	for <ath11k@archiver.kernel.org>; Thu, 26 Nov 2026 21:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HpcHTh9B;
	dkim=pass (2048-bit key) header.d=ffdus.de header.i=@ffdus.de header.a=rsa-sha256 header.s=dkim header.b=W2rtK1A/;
	dkim=pass (2048-bit key) header.d=ffdus.de header.i=@ffdus.de header.a=rsa-sha256 header.s=dkim header.b=O0Xij+gK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uyDi+BYA5cHdbyu/UIbRvTjqzghT7Tc7GiBDYym9dQk=; b=HpcHTh9BQVxKhd
	Yw0wH1/+FxUc625DSfLipJbaYf8fZpzmUqZbj8ILF4ssYPR4x2GphXUD4DxjBho/V9c14vRO32j3y
	eqT7Zz0nWfEK/6Fw08VHYXx+2HX6NXmjSVDuyTvfx1HaDjrwxfN4RroxzKl23NstnLPlwCRojUzAq
	d8jjo7MQ8ThecmQmmWzfLavOncjbOjyfMTdi5hLPpbZH+LJH+XMJYsHzxl/h3+t3EMzK6aX4lLzls
	8mpeM9r8/A5aQ19aluIdG2msPD5i/RALSwPaLHMX+cEiRPQVJp8Fsh7YUwzna9LY8r+oMdcjdTn84
	KOsfMl2/Zw5mbojdmQVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgq8-0000000EXi7-3PWs;
	Thu, 26 Nov 2026 21:17:12 +0000
Received: from mail2.nadeshda.org ([65.108.69.237])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgq6-0000000EXhY-2Q6m
	for ath11k@lists.infradead.org;
	Thu, 26 Nov 2026 21:17:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB3CF40454;
	Thu, 26 Nov 2026 22:17:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffdus.de; s=dkim;
	t=1795727828; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=uyDi+BYA5cHdbyu/UIbRvTjqzghT7Tc7GiBDYym9dQk=;
	b=W2rtK1A/h738afLTuA1J44/+hexfvLN+v0RDa5ZLeIavuEp4Hkhufwou81Nne76CwjRY+0
	f+LKLKRnOr4/EEyJpDM4yhgZGDFs5UtidVoh24lwTB26G6f9i3VpPFDFUr5Vl0+0v4LeHJ
	LhqE0EdHzcIsY9TwQNuuDIIvPmvivUerTLugYYu4XgSI+vPj95/10S10YkzzRGdgZKyNf7
	6+g/L/92eMc3FIYnndB/9xB4Um///NyouwPg68IVlwE2nSjFezfZD4eTUbGE+S7a9MV6t2
	puoc9c5qWevbpSPuXM9rg5p4JPXopmxgl00lSbiyY0WHaEIOJrz4jHJ3Z2GnrQ==
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5DF9117A1E1;
	Thu, 26 Nov 2026 22:17:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffdus.de; s=dkim;
	t=1795727826; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=uyDi+BYA5cHdbyu/UIbRvTjqzghT7Tc7GiBDYym9dQk=;
	b=O0Xij+gKohA66NHLzwOWQYIqV0VfikWjZssg3xvaroTjgW1NML3HorD2Igr9AICFWMuiWY
	1JjYOu0XW/xcicj8TRu3jjGyfv/7W+2uWd7VXW1tZRXqcb1G+sC/m6cGrDLndmOMXVo/t2
	n3R8OqyepqOHH3xQ1n89n1tvqLkIErh0lTorhIrhFtkd++lOn3qjYcqvfHKd9NcyN6ym3l
	KWozmnz3XROa6swtgaS0Yv27pSjRhtu32os5QkMk6wsGsWyJu/ypVq+irnUyNLDsJFISWG
	xk42CcJZEK8BTsZnsZm+zIpzMjpRSen9Lp0xSaXoygu0yL8dvPYxtxXW7W/7Bg==
Received: (nullmailer pid 3958945 invoked by uid 1000);
	Thu, 26 Nov 2026 21:17:06 -0000
From: adorfer <ad@ffdus.de>
To: Florian Maurer <fmaurer@disroot.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH ath-next] wifi: ath11k: invalidate the REO queue SSN when RX aggregation stops
Date: Thu, 26 Nov 2026 22:17:06 +0100
Message-ID: <20261126211706.3958936-1-ad@ffdus.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125090320.3890628-1-fmaurer@disroot.org>
References: <20261125090320.3890628-1-fmaurer@disroot.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_131710_778316_B2B6AC08 
X-CRM114-Status: UNSURE (   3.85  )
X-CRM114-Notice: Please train this message.
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested-by: Andreas Dorfer <ad@ffdus.de>

Tested on Mercusys MR80Xv2 (IPQ5018 + QCN6122, WLAN.HK.2.7.0.1-01744),
backports 6.12.96, with the mac80211 BA teardown patch, open 802.11s
mesh with ath9k/mt76 nbs. 5 reboots: 959 of 960 mesh links
passed unicast right afterwards; then 624 of 624 over 2 h without
reboots. No firmware crash, no REO errors.

One 5 GHz link to a mt76 peer shows short periodic gaps, with/WO
patch; your A-MSDU patch planned as next test.

