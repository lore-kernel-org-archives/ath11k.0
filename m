Return-Path: <SRS0=ORoY=LT=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A808C2B9F4
	for <ath11k@archiver.kernel.org>; Fri, 25 Jun 2021 12:39:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E2A561921
	for <ath11k@archiver.kernel.org>; Fri, 25 Jun 2021 12:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E2A561921
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wkuuvgasg1aeBN7KLbpCgCUE7Bkttb4oARv9kB+uOqE=; b=GxB47oepL6yiIq
	wFCe0aRRYiu7aeQ72gq2s7OZbSsde1I+0Am0PbR3RMhWbUqDB1o+ImNw+hkFsFFQFGA9Gf3P9unsm
	OIOHyo/RfaMW7XUaPcSWYCdA+EEZjegf6g+rtYSzfz9zFthQZpTEygv5fLvDfhHyYCIWQik0cJKVP
	SXbYS6NMCYTJut5tz/sXKx8eEe/ssSm+yaSh6Z6e/IfuTyEZwwtdJJ0L8YE7kLHM2qW44QNqtPuNy
	qKgQEQzppEH9xSKqiA+WayDCCvEO2uLmLKy/EaQAoN85HuBfn7PJCI0mtEV7pbv3B1PM5dnhphjum
	m4ivvXpeMoHSJ1NtWusA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwl6u-001V5v-Ss; Fri, 25 Jun 2021 12:39:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwl6r-001V4c-BM
 for ath11k@lists.infradead.org; Fri, 25 Jun 2021 12:39:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32AC461926;
 Fri, 25 Jun 2021 12:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1624624740;
 bh=l8O+fjyGjRv3cj2MPL8Ia2Ha1nrIh5AMEL/MVYZ7Wt4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1Wv76E15eJbmLpdMCIhfp499N7uAArrFCus5Q4uIEeJqENUKjsgfvrZWV8Hr+Vxgv
 it8a6E+KnLh/FASAzHKFyErMD2CVsm+3v3yVbIZou5ou5qYOvf89dGr3A4fGCzuViS
 AWCRHIBBWKkuR9NzHkMjWrsiaz3pgM8HpuweVVnk=
Date: Fri, 25 Jun 2021 14:38:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: hemantk@codeaurora.org, bbhatt@codeaurora.org,
 linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org,
 stable@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 06/10] bus: mhi: core: Set BHI and BHIe pointers to NULL
 in clean-up
Message-ID: <YNXOYkj9TWZgYAG3@kroah.com>
References: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
 <20210625123355.11578-7-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210625123355.11578-7-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_053901_459431_9175E7A8 
X-CRM114-Status: UNSURE (   7.04  )
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

On Fri, Jun 25, 2021 at 06:03:51PM +0530, Manivannan Sadhasivam wrote:
> From: Bhaumik Bhatt <bbhatt@codeaurora.org>
> 
> Set the BHI and BHIe pointers to NULL as part of clean-up. This
> makes sure that stale pointers are not accessed after powering
> MHI down.
> 
> Cc: stable@vger.kernel.org

Why is this needed for stable, but patch 5/10 is not?

And what commit does this fix?  How far back should it go?

And is this really fixing anything?

thanks,

greg k-h

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
