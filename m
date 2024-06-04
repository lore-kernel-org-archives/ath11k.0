Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1024C25B7E
	for <ath11k@archiver.kernel.org>; Tue,  4 Jun 2024 08:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A95+A41ypG9VZuiE5+JpoBQr9fcMdaNy3j1oaOnLKUc=; b=I+D1JTLTYXc37WzFL51QTa6Byz
	XzdsP05ENor0WKznczJtybgm3EqL02GGrrV4PcM/Dlnx8foW4ILkBqxWdd7VK9lxv5im3R1M6gZaF
	Mm6CtCbaLIupisRhHqXwqV1V8X21wxm+6+S4Z3zrMs1DnpUNyfI0NubNGTEmLdOcxpe5l0WTxTkWz
	EDMWG6nvBNN0nRiAphaTLYS/y7VQ1NT834faWqzZGwjRKXZtlOtUXCx1LRwMI6LUD/aQbcxhkx8JK
	BynbR3vMFFwYah1y/ZMgc7HWWVA0cyJTXNkGtTXE5h1tSLFUocMTbM+tuj1V28FE/eTBefRHvZF38
	TrDhD4Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPEe-00000001chs-1Kwk;
	Tue, 04 Jun 2024 08:09:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEPEa-00000001cfo-1s5d
	for ath11k@lists.infradead.org;
	Tue, 04 Jun 2024 08:09:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 15E9561122;
	Tue,  4 Jun 2024 08:09:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6ECC2BBFC;
	Tue,  4 Jun 2024 08:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717488570;
	bh=Ks/5HXLLA3BlNGAruV2BQLpNqH2NplEnN5LmiJ/z4Cg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=o1MRxCEMsm/rvMeAAJBPCYWpYQyAFd8BIGgeQvMSn7f/STx63dNix0p3AdGHdZgHO
	 VpJz0TOInXj39V5PtD1yEF+NaPIlHvxQyN6RxRjF55oj3yFnPSF6kAdy6xZoSDHHF8
	 uFmfQLaIUcNUKv1NYmxjir4bIWQYSbjQb2VcekRvPSTuUmUGpobXBYYjpH/pVzZSO8
	 5mj4vvnZes5pcoFC9qdoLII1gSie8vbQ6FVHKFbBDT3w6IZIgxBPY/CwY/WAR1Th7W
	 PGtpqFlZXM5ZneNCb8ZcE0Ar/w4EbNdRtAHV6nqSQqZJm6gZrHzagtxpP5PSB2kX/I
	 mykRDonmv/rmQ==
From: Kalle Valo <kvalo@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,  Dave Jiang <dave.jiang@intel.com>,
  Bjorn Helgaas <bhelgaas@google.com>,  <linux-wireless@vger.kernel.org>,
  <ath11k@lists.infradead.org>,  <regressions@lists.linux.dev>,  Jeff
 Johnson <quic_jjohnson@quicinc.com>,  <linux-kernel@vger.kernel.org>,
  <linux-cxl@vger.kernel.org>,  <linux-pci@vger.kernel.org>
Subject: Re: [regression] BUG: KASAN: use-after-free in
 lockdep_register_key+0x755/0x8f0
References: <20240603165342.GA685076@bhelgaas> <87wmn5ubfo.fsf@kernel.org>
	<665e162ec4b2d_2a90e294c8@dwillia2-xfh.jf.intel.com.notmuch>
Date: Tue, 04 Jun 2024 11:09:26 +0300
In-Reply-To: <665e162ec4b2d_2a90e294c8@dwillia2-xfh.jf.intel.com.notmuch> (Dan
	Williams's message of "Mon, 3 Jun 2024 12:14:54 -0700")
Message-ID: <87cyoxt9hl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_010932_589371_154252FB 
X-CRM114-Status: GOOD (  11.16  )
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

Dan Williams <dan.j.williams@intel.com> writes:

> Kalle Valo wrote:
> [..]
>> > Thanks for reporting the issue and testing the fix!  Can you please
>> > respond with your Tested-by to the actual patch(es) you tested?
>> 
>> Not easily as I'm not subscribed to linux-pci list and I haven't
>> researched how to import mbox files to my mailer :) So feel free to
>> ignore my Tested-by tag in this case.
>
> I have had success with "b4 mbox" and importing that into Evolution, but
> your mileage may vary with your mailer setup.

Heh, I'm old school and don't use anything modern like Evolution :) But
it was actually really easy with Gnus ('G f') and looks like I managed
to do it succesfully now:

https://lore.kernel.org/all/87h6e9t9qt.fsf@kernel.org/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

