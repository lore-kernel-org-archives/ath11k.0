Return-Path: <SRS0=PCnT=O4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487EEC433EF
	for <ath11k@archiver.kernel.org>; Fri,  8 Oct 2021 15:14:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02C1E60F9C
	for <ath11k@archiver.kernel.org>; Fri,  8 Oct 2021 15:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02C1E60F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:Cc:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wC9ZUbUtI2TrdR0p7WKeS8MbTo43cnbUUZ/W63Qy7dA=; b=oOs8PJUDmIc7BW
	ceadEyEcMox7IHYQf5dJPXdmYYuQNgQberr1pBsC5adT6c1eTjGZc1ICoBgqc2hmEVB/VAL/JiOcE
	wp+dZx1LZ+fwrQnMcuYOybeJ9UywwD1FniCYLag9mKjh/4NIi6hswDeALmnlh9SiNWJWrLlG9Y8o0
	gnuhZhOCXyColAZv1hgn/8rDSWXadahJ/ErFXe1HVSiQwiAoxlGMDynqDGVjcFoe2vuqrEPdbiynI
	QIskZ0ohH9dfue9XVu2mu53BVwpZgLcF5mu6fRlF1kbEKP71uA2bndszQXeggtdtLHDQ1wfAqhbNX
	OjQa3p2t/Ywtzggd1TnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYraG-003D4z-0A; Fri, 08 Oct 2021 15:14:52 +0000
Received: from shards.monkeyblade.net ([23.128.96.9] helo=mail.monkeyblade.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYraC-003D4M-V0
 for ath11k@lists.infradead.org; Fri, 08 Oct 2021 15:14:50 +0000
Received: from localhost (unknown [149.11.102.75])
 by mail.monkeyblade.net (Postfix) with ESMTPSA id A196B4FEE3F1E;
 Fri,  8 Oct 2021 08:14:40 -0700 (PDT)
Date: Fri, 08 Oct 2021 16:14:35 +0100 (BST)
Message-Id: <20211008.161435.1734009617183253791.davem@davemloft.net>
To: kvalo@codeaurora.org
Cc: geert@linux-m68k.org, sfr@canb.auug.org.au, netdev@vger.kernel.org,
 jouni@codeaurora.org, pradeepc@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: linux-next: build failure after merge of the net-next tree
From: David Miller <davem@davemloft.net>
In-Reply-To: <87pmsf60h0.fsf@codeaurora.org>
References: <87tuhs5ah8.fsf@codeaurora.org>
 <CAMuHMdUZa9o15_fGJ7Si_-bOQVcFOxtWgo_MOiKsV0FjoPeX6Q@mail.gmail.com>
 <87pmsf60h0.fsf@codeaurora.org>
X-Mailer: Mew version 6.8 on Emacs 27.2
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail.monkeyblade.net [0.0.0.0]); Fri, 08 Oct 2021 08:14:42 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_081449_009264_B7B357A5 
X-CRM114-Status: UNSURE (   6.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 08 Oct 2021 17:43:39 +0300

> Thanks Geert, you helped a lot! I now submitted a patch to netdev:
> 
> https://patchwork.kernel.org/project/netdevbpf/patch/20211008143932.23884-1-kvalo@codeaurora.org/
> 
> Dave & Jakub, if you can please take the patch directly to net-next.
Done.



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
