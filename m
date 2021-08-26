Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44422C4320A
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 14:48:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1708B608FE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 14:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1708B608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BzR3EDRygJXjExHWk5uHcZFUV9pkjmJSv0Us1g4zJvo=; b=4jk5a7PpNNrRIe
	WMPDomnv/krQYGz/N2qLWOpR5D1QCIf1saEjv0BA+HiYql6yJ4UgD9wMK17VtU+Ga3JwzcVE6mA72
	NjB/iJicEs+w1M869DIqUu9i4V3BSKiyU44KpjVlWljL+jjKWmgXc9VhnwCALlgzvtWBGAYtiwPKP
	ljIehIUNSzOXwMErfminqBDxPXTzaPBsCoogz28YneCY1oiLpOQaUCN/t98NPDuobtNNi06qtGP4u
	w4Zz/wNMa87iHX9Ra5/abbi/A4UG8R/TXLUO+6LGCzMbHsTOgQ3vaqbjY9zRc9Qw9xVvz8cHzf7GQ
	RTgz3e/Npx4sxWjKa+/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJGgZ-00APK4-2o; Thu, 26 Aug 2021 14:48:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJGgW-00APJD-K4
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 14:48:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6830E60EE0;
 Thu, 26 Aug 2021 14:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629989331;
 bh=crKF8g5sAGpAUYH0aq1QptWRIYpluHI6mSgfoNb6+IU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aKynVOziWPK+xPPb++Z0qRWSKz9U6Li2WJMMCJhCS/3ohkB33I6n8PFP/3mywcG51
 O8mXDQpAus7umJXEIetuEWNKXNxN/uDCf41GOzZn08tL81PXvLnhMQ/171hQNUTsAj
 HkdrVl8OaJY9w7H7QrkdD4qg0V1m1XTwOkSL8uf0TYGcSvYG/e3LLJlnlCoiEYYZtW
 eV1A53DgOVegTejAARli5SCPv4o3+p+UINTIMrkpJ3/xGUCPwh0xv9o5DB4gJIEDDl
 pXQIzQ1OI9ZbgEaejcOMJ05WupkOkJTUuRjkDhYvjnTqXxNHQs4JP2b0Xi21UFHbXB
 3KQ1gQy6jI14g==
Date: Thu, 26 Aug 2021 07:48:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller"
 <davem@davemloft.net>, Linus Torvalds <torvalds@linuxfoundation.org>, Wren
 Turkal <wt@penguintechs.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>, Hemant Kumar
 <hemantk@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>, Nicolas
 Schichan <nschichan@freebox.fr>
Subject: Re: [regression] Re: 5.14 rc6 broken for QCA6390 on Dell XPS 13 9310
Message-ID: <20210826074850.16768dee@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <YSenaxWzxRkYkucv@kroah.com>
References: <a8cddf24-ecfc-088e-27f4-98cbbb5fb67c@penguintechs.org>
 <87y28sqq4l.fsf@codeaurora.org>
 <843e7689-fa1e-441b-c49a-ed7291046d5f@freebox.fr>
 <87tujgqcth.fsf@codeaurora.org> <87mtp47073.fsf_-_@codeaurora.org>
 <YSenaxWzxRkYkucv@kroah.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_074852_732345_57F3D9C4 
X-CRM114-Status: GOOD (  25.21  )
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

On Thu, 26 Aug 2021 16:38:35 +0200 Greg Kroah-Hartman wrote:
> > I did some investiation and I suspect that commit ce78ffa3ef16 ("net:
> > really fix the build...")[1] is for handling a conflict between net-next
> > and char-misc-next trees related to Loic's commit 0092a1e3f763 ("bus:
> > mhi: Add inbound buffers allocation flag"). Greg mentions this in a
> > commit[2]:
> > 
> > commit 813272ed5238b37c81e448b302048e8008570121
> > Merge: de0534df9347 36a21d51725a
> > Author:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > 
> >     Merge 5.14-rc5 into char-misc-next
> >     
> >     We need the fixes in here as well, and resolves some merge issues with
> >     the mhi codebase.
> > 
> > If my assumption is correct when I propose that we revert commit
> > ce78ffa3ef16 for v5.14, AFAICS it's not really needed for v5.14 (commit
> > 0092a1e3f763 is in -next, not in Linus' tree yet) and commit
> > ce78ffa3ef16 breaks ath11k. And the conflict between net-next and
> > char-misc-next can be then later fixed during the merge window.
> > 
> > Will this work for everyone? If no objections, I'll submit the revert to
> > Linus later today. We are getting really close to final v5.14 release so
> > not much time left to fix this.
> > 
> > Just to reiterate why the urgency: commit ce78ffa3ef16 broke ath11k in
> > v5.14-rc5, users have reported (and I have confirmed) that at least
> > QCA6390 support is broken but I suspect all Qualcomm Wi-Fi 6 devices
> > supported by ath11k are currently broken.  
> 
> No objection from me for reverting that, if it fixes the problems you
> are seeing for 5.14-final.
> 
> The goal was for the mhi changes to go through the networking tree in
> the first place, I don't see how this got out of sync.
> 
> If this is reverted, some help on how to resolve the merge issues it
> will cause would be appreciated.

Also no objections here. FWIW I'm about to send the last PR for
networking, still waiting on BPF. You can send the revert to netdev, 
or directly to Linus as you prefer. LMK.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
