Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34002C83F14
	for <ath11k@archiver.kernel.org>; Wed, 30 Aug 2023 11:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aFBJ3mO2VLrBivHTuBHI6XPIBrQJpx139nWHVAc4L8Y=; b=zUOcY9a9Uyre5T
	qzAdb55413VnUlHjxM0+NNLPCqEZyinNZz9OYRPGUMO6r059M5YyvkkHw2DgJ50c4Sjtu8CwHxloY
	95Xun4xuu1MidiHT9WsZUwQEqyjNuz/xKxZeQPXCIXXYyBXaejXFhYQoMRD4LidzYWX74kyKsVM9E
	4z72c/+XzNCl6IwiBh1TCU40Vuq84iQqZn0yYVkzksdXdPdqPKr25TskYnUCm+NAKu3fo75vkUZWq
	0KXiy9dJqlQe+p63p6AjPgtzipzG2pOOccf7are9viR7uhvdZPa6f58XpUBK6g63ugzO3DhnNZhiZ
	Iu3xV83VxZEizDW5NyIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbJQK-00DOO7-0M;
	Wed, 30 Aug 2023 11:31:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbJQH-00DONM-1T
	for ath11k@lists.infradead.org;
	Wed, 30 Aug 2023 11:31:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 872C060AFF;
	Wed, 30 Aug 2023 11:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74045C433C7;
	Wed, 30 Aug 2023 11:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693395104;
	bh=I3QUcjvGQNK/WN89qE62mUZVvbzh+sWhFO8OhwQe9X8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=RqVB98BtcFRECsHjf/CiUJ0L+JtoTi59vAb6U8d2YYLwJ231NZIjyA7npgBQJAX+z
	 egaJ/xuBPVb5pFWPpdsnbrE6deMEAJFAZnO3hv0rbHqpELBHeDWrCSgLl+mq2shwYp
	 cp89hgjpa+AEKmITt/z5pYxu4CtjtGeQmjAeziRaqbpFUVoisXX+zf9nPAJZhawVRs
	 LSU7v1ESMqoq6VQ5BRdLt6j6ndZVc5jW82b9o/9bXd3e+uTQpEzwDaav0YSSOvVAt/
	 xBdzUgx+j1YjBcGgECYyJ80/0lk513eTmFp2cLf2w1Eq4hyp4MMZNUQTEsslS7ue5m
	 rCRv6PRhC+2Kg==
From: Kalle Valo <kvalo@kernel.org>
To: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,  Bjorn Helgaas
 <bhelgaas@google.com>,  Linux regressions mailing list
 <regressions@lists.linux.dev>,  linux-pci@vger.kernel.org,
  linux-kernel@vger.kernel.org,  ath11k@lists.infradead.org
Subject: Re: [regression v6.5-rc1] PCI: comm "swapper/0" leaking memory
References: <878r9sga1t.fsf@kernel.org>
	<8a737241-f216-169a-8bd3-d0832439b99e@leemhuis.info>
Date: Wed, 30 Aug 2023 14:31:40 +0300
In-Reply-To: <8a737241-f216-169a-8bd3-d0832439b99e@leemhuis.info> (Linux
	regression tracking's message of "Wed, 30 Aug 2023 11:55:47 +0200")
Message-ID: <874jkgg40z.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_043145_543317_0443DE2B 
X-CRM114-Status: UNSURE (   9.62  )
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

"Linux regression tracking (Thorsten Leemhuis)"
<regressions@leemhuis.info> writes:

> Hi, Thorsten here, the Linux kernel's regression tracker. Partially
> top-posting for once, to make this easily accessible to everyone.
>
> Thx for the report. To quote one aspect:
>
>> v6.4 has no leaks.
>
> I pretty sure you mean stock 6.4 here. But FWIW, the culprit was
> backported to 6.4.y and 6.1.y, so they latest versions might be affected
> as well.

Yes, I mean v6.4 release tagged by Linus:

6995e2de6891 Linux 6.4

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
