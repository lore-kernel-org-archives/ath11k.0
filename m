Return-Path: <SRS0=ylbk=LY=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E265C11F68
	for <ath11k@archiver.kernel.org>; Wed, 30 Jun 2021 13:26:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25D8E615A0
	for <ath11k@archiver.kernel.org>; Wed, 30 Jun 2021 13:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25D8E615A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K9d9NfZypWHBFaHvUdK6Fe1bf49cTl1dwvOpDxWfO0o=; b=YqT220cv3bwMk+
	And7wYgxDnLsvo+6zlEPr2w99Pfa6jjiw7QwtExOy2OcF1U7vfRjJ9aw31zodLNXDCvP4lsY8SR3+
	nxS5HoNqKyKJOIMzWX1gzTZ8T5C/TYbEw/5ec6KvWqxDalM+Gl9XCAo3fzjk73gUMB7CZCGDBrJ1Z
	+xWEGrtFq5UleZ0HuAYKwYla43JP0qLeD+QHq+qiwAfRH4KcVKivtb8Drbe1PC71wR8TG+cP/knZ4
	eLrA0k7cF5k4drIj/jnbzz9nmwR3WdqeSADCROm0z3WgPhYxEl0kNSOZ8KYaJ697p5kaMBEtlJLPR
	Kc7Kxj5AG5YLd9bEadiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyaE4-00E0be-Ve; Wed, 30 Jun 2021 13:26:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyaE2-00E0b7-0d
 for ath11k@lists.infradead.org; Wed, 30 Jun 2021 13:25:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CEF461356;
 Wed, 30 Jun 2021 13:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1625059557;
 bh=pRhoVxlakzjKTDZATJX0RBmkzXc/Et5u5tXuaooYvmE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TtS1IQVYWhlv5akhEgO1oz7Ti4RAmmmQ/cZVK9hPwByYRFeFKJyMRwlor3jLEdk6f
 7YMC8RYS4YLMEQQ7LoviuJbLbXc3URJrqN0nTeVGHFPZ1AjUV5hSmCIj1dYQhFGrU0
 BL/qXPWm5N4icmsjOLnA54MCN4pkgN9six8kcTgw=
Date: Wed, 30 Jun 2021 15:25:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: hemantk@codeaurora.org, bbhatt@codeaurora.org,
 linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
 kvalo@codeaurora.org, ath11k@lists.infradead.org
Subject: Re: [PATCH 00/10] MHI patches for v5.14 - Take 2
Message-ID: <YNxw4wc1nvwMnaS6@kroah.com>
References: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
 <20210630131656.GA18484@workstation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210630131656.GA18484@workstation>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_062558_114580_A83F5950 
X-CRM114-Status: GOOD (  24.62  )
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

On Wed, Jun 30, 2021 at 06:46:56PM +0530, Manivannan Sadhasivam wrote:
> Hi Greg,
> 
> On Fri, Jun 25, 2021 at 06:03:45PM +0530, Manivannan Sadhasivam wrote:
> > Hi Greg,
> > 
> > Please find the remaining MHI patches for v5.14. This series has the left over
> > patches from the previous patchset and one new series that was reviewed a
> > while ago and put on hold for Ack from Kalle Valo for ath11k.
> > 
> > Summary:
> > 
> > 1. Added validation for the channel ID read from event ring. If we get events
> > from an invalid channel, we throw an error message and skip the event.
> > 
> > 2. Fixed the MHI wake routines used for the newer modems such as SDX55 and
> > SDX65 by using no-op routines only for the older modems and then relying on
> > the default routines provided by MHI stack for newer ones.
> > 
> > 3. Added support for processing the events based on the priorities. Earlier
> > a fixed priority was used for all events.
> > 
> > 4. Added a dedicated flag to the MHI client transfer APIs for inbound
> > buffer allocation by the MHI stack. Since this patch modifies the MHI
> > client drivers under "net/", Ack has been collected from the netdev
> > maintainer.
> > 
> > 5. Added support for Cinterion MV31-W modem in pci_generic controller:
> > https://www.thalesgroup.com/en/markets/digital-identity-and-security/iot/iot-connectivity/products/iot-products/mv31-w-ultra-high
> > 
> > 6. Rearranged the setting of BHI/BHIe offsets for better validation of the
> > register values read from MMIO
> > 
> > 7. Cleanup of the BHI/BHIe pointers by setting them to NULL to prevent access
> > after power down.
> > 
> > 8. Added support for getting the MMIO register length from the controller
> > drivers. This helps in validation of the read offsets from MMIO registers.
> > Since this patch touches ath11k, Ack has been collected from Kalle Valo.
> > 
> > 9. With the help of above register length, added check for BHI/BHIe offsets.
> > 
> 
> Is this series on your queue for 5.14?

It's too late for 5.14-rc1, patches had to be in linux-next way before
5.13-final was out.

I can take these after 5.14-rc1 is out for 5.15-rc1, or you can split
them up into bugfixes and features and resend two series, one for
5.14-final and one for 5.15-rc1, which ever you want.

thanks,

greg k-h

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
