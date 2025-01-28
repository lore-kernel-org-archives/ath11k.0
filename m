Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C803FC0218D
	for <ath11k@archiver.kernel.org>; Tue, 28 Jan 2025 09:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qHeRy3aXUVz3lNP+jrhSUEGQtSOzOk73nEF1lSoli+k=; b=cTXiXRkOCq/ucmVvgNL/8Ob+A/
	fgvT63lClHmdyQ5576iL6KqJYLIcp89xxgIJNvmM4B9STFSNS6/TwBnbXcP9iQA3K3kGd4Z4BBrHz
	d6iEtP86RMoy7YwBjSGYtQxKenmHB76ruoQbDQrWJP51AGATgKKVXP1eJvIDSeFgdfZJagZaFE/Kf
	JKjLygUPNR+rkDH55hWlyTnd5MmBogUfS7utAR70qctdqQuv07h+ajLstxWDwOJyJIT0oR3vXMfJD
	DavY3U4BqMWefK8gsFpS0++rh5QbmvDNWRf5VKMsscPGlGY9F2pAgN1zAmdqd8/1VVsBp8amhFZJT
	hz7z1b0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tchlq-00000004W0T-1glo;
	Tue, 28 Jan 2025 09:20:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tchln-00000004VzS-3srX;
	Tue, 28 Jan 2025 09:20:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DDF7AA4010C;
	Tue, 28 Jan 2025 09:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37FAEC4CED3;
	Tue, 28 Jan 2025 09:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738056029;
	bh=qHeRy3aXUVz3lNP+jrhSUEGQtSOzOk73nEF1lSoli+k=;
	h=From:To:Cc:Subject:Date:From;
	b=K8ZNHXYUl3f3CX04A/gRsMdbcnsm5XHuUu09LIKbTrgDhN7EiQa1CkSLXGIys41po
	 1mVBJp4TV3pOXMF8dYKG9iHdw6unF78RF1PJ9fXJo3WdlK1bVWKv694rYn+zVfdoG1
	 bdVymOW/LyFH/StlcJN+88e6VC8f4M5L4H07ynFqsjZsBGbDDW9sVyR/LMYkSP+5j9
	 3CKA2IhdazaLE3D+nEnI5WYtpPCH0H0u0xxtvbnSFTgyDokMXXhBz7MJzevjKscHfR
	 dO9TYyK6JeN1OVdnXR1+Emthm9Yn5A5VgYZGp638eqn0J6L896E1V+70UU6lgxPvWT
	 6BkmKGFmr+Uag==
From: Kalle Valo <kvalo@kernel.org>
To: linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: ath12k@lists.infradead.org, ath11k@lists.infradead.org,
    ath10k@lists.infradead.org,
    Johannes Berg <johannes@sipsolutions.net>
Subject: Stepping down as maintainer
Date: Tue, 28 Jan 2025 11:20:26 +0200
Message-ID: <87wmefguqt.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_012032_033785_5263A582 
X-CRM114-Status: UNSURE (   6.37  )
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

Hi everyone,

I'm stepping down from all my maintainer roles. My first commit
feed9bab7b14 ("spi: omap2_mcspi PIO RX fix") to the kernel was back in
2008 for v2.6.24 so I have been here for a long time. Thank you everyone
who I have worked with, there are too many to list here.

Jeff continues to maintain ath10k, ath11k and ath12k drivers so they are
unaffected. But for the wireless driver maintainer (drivers/net/wireless/)
there is no replacement at the moment. If anyone is interested, please
do let Johannes and me know.

Kalle

