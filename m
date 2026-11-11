Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E3D606A332
	for <ath11k@archiver.kernel.org>; Wed, 11 Nov 2026 06:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TfSgdTBE;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=amS6LCoE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PLttY8nE+sGyh5SIhXQOOD815EzYHKLgvNSQzefiAEE=; b=TfSgdTBEDyP2mLAKv8G60npV6N
	y02t8s9RET18CyDTIV+j+1TntY7i57oG42KOJYqNE4VLYVDzB+zX25rppKzADZJonHUQUInZ7DJ0L
	gSeCcB//TjAm/6M2fjAWraIpZWIXeCKHjxS1TLmrb4anfSZh50kPD2wXynBUEzTEsxQ2Pg3NTJlyy
	uV96hX2RHgyQvTLXujUy1HALv4/QhtcqpK8+S33IZOMz/YV3g6i+URlzDImyg5qrofnGuS0wkll/x
	IbO1RTl0W49/hbloYY3JTMi5NDFxseuXtaVt9E442ztalUzbxhy+8x0lsTRQVSn2sHQ+AG3rRmJGK
	kJ/SiGBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR236-00000005oIj-1TdP;
	Wed, 11 Nov 2026 06:43:12 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR232-00000005oGF-2EPG
	for ath11k@lists.infradead.org;
	Wed, 11 Nov 2026 06:43:10 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C7EADA8;
	Wed, 11 Nov 2026 07:40:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794379240;
	bh=Ihyx9K3Xp75id2X2o2rP6Zvt+CPGhW6/P9+os5jl4fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=amS6LCoEqNOkpsJNIpQ7PhsMSH3g2QVmxPz3G6gv/49uKnuzjqLINDWtuzx//uOdi
	 PheykHoi6Q0AWxuGiTGsexpzx7GcqPRZiRyKlrLt/QBFyPXGj0ijMT8Bf4/lrwMQS3
	 OqjSLK1WZqusKZR4tgf2IQ4NXdXTnmliRZsj2WcA=
Date: Wed, 11 Nov 2026 08:43:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH RESEND] wifi: ath11k: release the rproc reference on
 teardown
Message-ID: <20261111064301.GC86558@killaraus.ideasonboard.com>
References: <20261103102915.1341148-1-vulab@iscas.ac.cn>
 <a39b1918-5d04-452b-8b5a-0703963f4587@oss.qualcomm.com>
 <179430684554.3011466.3431045638041318447@iscas.ac.cn>
 <20261110122714.GA3809@killaraus.ideasonboard.com>
 <179436839700.3055208.16759622808608708086@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179436839700.3055208.16759622808608708086@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_224309_054900_0CA6BEC8 
X-CRM114-Status: GOOD (  17.83  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 11, 2026 at 03:39:57AM -0000, Wentao Liang wrote:
> Hi Laurent,
> 
> My main goal is to study how to find bugs in the Linux kernel.

Why ?

> When
> that work finds a bug, I also want to help fix it and contribute to
> the kernel.
> 
> Static analysis flagged possible bugs, and we reviewed them by hand
> with help from DeepSeek and GPT-6.1 Sol. Even after that review, many
> of them still seemed worth looking into. I got excited about the
> findings and sent more patches than I could follow up on. I regretted
> that decision soon afterward. I should have sent fewer patches and
> replied sooner. I'm sorry for the extra work this caused.
> 
> I'll use this shared address only to reply to feedback I haven't yet
> answered on patches I've already sent. I'll go through that feedback
> one message at a time and respect the decisions maintainers have
> already made. If any of the remaining patches are still worth
> considering, I'd be grateful for the chance to answer questions
> about them.
> 
> I still hope to contribute to the kernel in the future. If I have
> the chance to do so, I'll use my own email address, respect the
> maintainers' requests, and send only as many patches as I can
> follow up on promptly.
> 
> Thanks,
> Wentao

-- 
Regards,

Laurent Pinchart

