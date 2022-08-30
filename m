Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6BDEECAAD4
	for <ath11k@archiver.kernel.org>; Tue, 30 Aug 2022 14:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JDn94aZm/l6GFrhjkaJ8tQIca7wtSXknAWvjez5dONs=; b=hx09zmTZz/ACHc
	nLqF9D8nGZC7A8OcrtJdRTp7nWdtcs9ICPvOdM1bNgvvNsaI5vLZ0Sq04U/VJ3WhjhqCSLmcnLT3I
	Mqi6dO07aAMZeTQNiIoSbDILrVvGhpMSIr9ZpF0dRBnijWgx0eBb0U6OSb/pxqhZGQu1rIJNIL10y
	dB/YLVFnxELq4xWj+B59gNK0mdFIDtb6An37t1n2Pay5OplSonwaa4LiJgG+kfYS36fQpCmkrpV8j
	EUj5jNn+1q7KbS5DQWgC0vwvoljlUohJJ6nDqFyQdWRrkRqta6LGhS2TbATjOXhCgrDLZ4Lg72W1J
	stcSDMPxp9zso0AXjWHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT20R-00HX8E-73; Tue, 30 Aug 2022 14:14:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT20O-00HX6r-BJ
	for ath11k@lists.infradead.org; Tue, 30 Aug 2022 14:14:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 10AA1B81C26;
	Tue, 30 Aug 2022 14:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB2BC433D6;
	Tue, 30 Aug 2022 14:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1661868853;
	bh=eZmfxn8DKm9TEyfxpCTgawLsAGxOeSx606q64xmYtyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mC3Pe+sGNrjs3P6obmnasA/e3qaGTSS4qeqH1nz4ZAJIBP1G78sIDfpBwwLWeooEg
	 BCjp3NTiTIUt5vBrkEfo/9aJrMJT5Z13oVNg0BKtKykClpAN+JajW8c3s1QO6KscUt
	 6RiVeRM8YxpYkSwOus54IwHQMF3C0sdWTwqtgeZM=
Date: Tue, 30 Aug 2022 16:14:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: quic_hemantk@quicinc.com, mhi@lists.linux.dev,
	ath11k@lists.infradead.org, kvalo@kernel.org
Subject: Re: [GIT PULL] MHI fixes for v6.0
Message-ID: <Yw4bMnBxLFEzeFUF@kroah.com>
References: <20220829171746.GA84334@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220829171746.GA84334@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_071416_547279_BCABF067 
X-CRM114-Status: UNSURE (   7.99  )
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

On Mon, Aug 29, 2022 at 10:47:46PM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-fixes-for-v6.0

Pulled and pushed out, thanks.

greg k-h

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
