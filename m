Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBCCC432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 18:12:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E98D60F6F
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 18:12:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E98D60F6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HiIAJ5Fzli6Unk7p1dxnJfMw6mWXkhshnUfeuxNYEUw=; b=Z/AEdNSoGCJeRU
	B8AYe2Dp+eACY6u6f9XklXxhdX2B2XN7zdbi01ypKX/TWkfgHWn65/CxhkwRUJupuHvNfFThkwtFS
	OZYAIhmx22045FegumZurITP1ECfUkk211XuGovTMpmgWYmvl/9cbnqYod9dh5+k487WY5b8TeAzu
	VWFM7ZPwzUARS9GEopf4cxi7r+9vuRpdSF6JUcxYJnFIB2AOMrpSME8TDU5Mg8KS5Q8E2yUesGr/7
	DIVasyUY/H93C3ty/GdWfdQfWilBgPQHYp/dY/2f5R7nAMDa/41hMD7saNnBJmRALALaBGp4Ly0Cg
	zLUC6r0M0RTR4ATQ4xSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJJrG-00Aj3c-QD; Thu, 26 Aug 2021 18:12:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJJrE-00Aj3F-WC
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 18:12:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3AF0760F92;
 Thu, 26 Aug 2021 18:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630001528;
 bh=twz5qjfjs3FJbsj6czhiTtitZVCzSoSTVpLqfp7OECg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hq4hit2omb/F8USIQBiXwf1s6cMa8i8CXlt8xq4CmxL7+SfKgMzzS3yqMmWZEPCVd
 A+i9B4sjCH8uc8iYmSdp0+NQE5Ol98Z0mqWkHM3Eh+QTf9q04vw9D95qYiwOfaodk1
 8b55k25Q8VjIUZ4OABbF7OSB5lk/+W7DI2eZjPc3WK24UETY3AJqRRQn9xFNaKsozZ
 IrnvZVwOuAkMpdn411eeWQuLTz2TnrOm6H19zFPmX4KaTDX1B5yRuw4uGfbjDDfg46
 9wQnPDtHGLxmHCW/4c83P1tSowb96r3r01zAIBAJr32QqaMKFaBTq0FQPiEPEyXZgb
 gekelTGW6N5DQ==
Date: Thu, 26 Aug 2021 11:12:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller"
 <davem@davemloft.net>, Linus Torvalds <torvalds@linuxfoundation.org>, Wren
 Turkal <wt@penguintechs.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>, Hemant Kumar
 <hemantk@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>, Nicolas
 Schichan <nschichan@freebox.fr>
Subject: Re: [regression] Re: 5.14 rc6 broken for QCA6390 on Dell XPS 13 9310
Message-ID: <20210826111207.364d0ba5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <87y28o5cw4.fsf@codeaurora.org>
References: <a8cddf24-ecfc-088e-27f4-98cbbb5fb67c@penguintechs.org>
 <87y28sqq4l.fsf@codeaurora.org>
 <843e7689-fa1e-441b-c49a-ed7291046d5f@freebox.fr>
 <87tujgqcth.fsf@codeaurora.org> <87mtp47073.fsf_-_@codeaurora.org>
 <YSenaxWzxRkYkucv@kroah.com>
 <20210826074850.16768dee@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <87eeag6yjr.fsf@codeaurora.org> <87y28o5cw4.fsf@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_111209_107799_1664C70D 
X-CRM114-Status: GOOD (  11.46  )
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

On Thu, 26 Aug 2021 20:33:47 +0300 Kalle Valo wrote:
> >> Also no objections here. FWIW I'm about to send the last PR for
> >> networking, still waiting on BPF. You can send the revert to netdev, 
> >> or directly to Linus as you prefer. LMK.  
> >
> > I prefer take it via the net tree if possible, so if you can wait ~2h
> > and I'll send it to you.  
> 
> I now submitted the revert, please take it into the net tree if you
> still can:
> 
> https://patchwork.kernel.org/project/netdevbpf/patch/20210826172816.24478-1-kvalo@codeaurora.org/
> 
> I also tested the build with various QRTR options and didn't see any
> build errors.

Done, thank you!

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
