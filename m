Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DA4606A31C
	for <ath11k@archiver.kernel.org>; Thu, 26 Nov 2026 21:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CUuo1yGG;
	dkim=pass (2048-bit key) header.d=ffdus.de header.i=@ffdus.de header.a=rsa-sha256 header.s=dkim header.b=badUsc79;
	dkim=pass (2048-bit key) header.d=ffdus.de header.i=@ffdus.de header.a=rsa-sha256 header.s=dkim header.b=dF7uKhWN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dOdjYXC4gJgh8OAwxjMAdMyfCpmuQ1aKcQSbsxMDT18=; b=CUuo1yGGgvYcCI
	JDbmQO6OBXUUVL+BMdS1Dxgwey5YMSgeGx/osUFPSEfDvNqZGr/FSy3Vxcmkz2BjuDf0pXGsEsMuA
	saDW0BBQW2n7UfjkPypFWcPrp6Jr1HoESzmhaKrGJtcLLyM7GFee/Drz5EgYKRY4kbvk39SOCavGN
	8sRDito9jFD6KWvznwIrngEI9dOR2BezW+jP+l+zQQeEbPptv+FL5RGmSZ7UFvMF0h1CSS9mYTrLr
	F63bALJqANBXY5lg+cPlMiMlcQTN7GD4YZCwyT77Qb6Vnl9qcTVNpgGQ6+X2PyQ2zxWHbKuNGmTH2
	TYes12lAB8YmigdN71eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgm1-0000000EXVU-1B6l;
	Thu, 26 Nov 2026 21:12:57 +0000
Received: from mail2.nadeshda.org ([2a01:4f9:6b:45e1::c29f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWglw-0000000EXVB-1vab
	for ath11k@lists.infradead.org;
	Thu, 26 Nov 2026 21:12:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DBADE40454;
	Thu, 26 Nov 2026 22:12:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffdus.de; s=dkim;
	t=1795727564; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=dOdjYXC4gJgh8OAwxjMAdMyfCpmuQ1aKcQSbsxMDT18=;
	b=badUsc79cmaSo+E/5O6aCZzhu+5sW6ECTEP0Q7WevX7EcCPnPf8EqOJu0aQjuIrfTNA5dq
	vWDotCoqKUkgYNOuz7WsZJduPQ37N+imnZskQsyPsdvqfiLfFMCfWy4i8e1z1FsYpIbykc
	v+9xRcHqAQopYCAT3TCCocVvWLaxg8Ln20CJZ0sYKtw3LhGu6EL8VGQGKag1UhbM1nKbeg
	Dw0cPL7r1SC7mDlQ7TFSREXAkDzndFZYa/N2xPXqt3660BFiEc+olpO7WIdWoALHKi/XPL
	RqeBhFPLiUW+vB+QAovRDmqKAlYJS578hbxXjqfngoV2c/prLVpsYX9+vRdOGw==
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FE6017883B;
	Thu, 26 Nov 2026 22:12:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffdus.de; s=dkim;
	t=1795727562; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=dOdjYXC4gJgh8OAwxjMAdMyfCpmuQ1aKcQSbsxMDT18=;
	b=dF7uKhWN0HRC3Vb01e8G350NJvMiHx+YtdwhmebSmFJrZ6sMaypNdDRLR9H/RsEO6slYtA
	oMD8SCWPZXNgNXSXc4Vl6ZQeGVZqU7uu7Hj5EYtFSVTEobBSkkOSuRpJ2FLnR08v7CuKYF
	C8uV0uYpP/BMAo43g2IVnp3wQwJqMIWoIvqO+YVAKr6GQ1Qg87SxyHZCx0SVC0CP8yG8j4
	EFAIgyv4kYnM+G2qKA7jC5xHti9YcZPpIR1FdDrMyBRIQcFIevRRy4eJQjisTkxg+PjLug
	hWznwKC8uSoOB5am0IJrTD5XGrc/7ffbLg/tw5z/YVg/GU4sOXEtQ/bELQKxGA==
Received: (nullmailer pid 3955927 invoked by uid 1000);
	Thu, 26 Nov 2026 21:12:37 -0000
From: adorfer <ad@ffdus.de>
To: Florian Maurer <fmaurer@disroot.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH ath-next] wifi: ath11k: don't send A-MSDUs on mesh interfaces
Date: Thu, 26 Nov 2026 22:12:37 +0100
Message-ID: <20261126211237.3955918-1-ad@ffdus.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122003504.3341873-1-fmaurer@disroot.org>
References: <20261122003504.3341873-1-fmaurer@disroot.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_131252_980865_988A1384 
X-CRM114-Status: UNSURE (   4.19  )
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

Tested on 2x Mercusys MR80Xv2 (IPQ5018 + QCN6122, WLAN.HK.2.7.0.1-01744),
backports 6.12.96, open 802.11s mesh. 10 s TCP, mean of 3 runs, 5 GHz,
before -> after:

  ath11k -> MT7986 (MR90X): 70 -> 159 and 35 -> 176 Mbit/s
  ath11k -> ath11k:         97 -> 182 Mbit/s (other direction 188 -> 163)
  ath11k -> MT7981, MT76x2: roughly unchanged (-10 % .. +4 %)
  senders without ath11k (control): unchanged within +-10 %

2.4 GHz to MT7986 about doubled as well. No "failed to disable A-MSDU"
warnings, no firmware crash.

