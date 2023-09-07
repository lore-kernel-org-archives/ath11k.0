Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA28EC8737
	for <ath11k@archiver.kernel.org>; Thu,  7 Sep 2023 15:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTtrNeynbO5ZvFyeFeboNgcD8zmmKp0HUSPujcN8+GM=; b=JPycehbcQuqtuC
	53qx9XrI/yiN2+p3IGVp3qkuR8iK3I4H1t3QBFcRd+hpKcm3cA8wHAwtAF82i5RvdqlvAjDVxmaK6
	zYQzDAZsfS+IKQfS3bhcFNcwPbe3apsK90HCrPcfZSMHn+HUXqvuut5LtOxMGShjPw5Yi9GjsMVaw
	aGDoszt08IBsGptJDIanPK98sTfNa48wmHHeEe1mzqdkAK9WpYy9i9x9hCCiUIzZzTnoOF1ufs3oZ
	GFv7xy78yvvryxaeI9p0HvcZ0dtRE2Jra1D7CT/+apmWHisHHoCDY4fGo92U8YCJQIlg83nR2pXJK
	1BekEJs+YS3o+fRSyoCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeGkM-00CFDU-0G;
	Thu, 07 Sep 2023 15:16:42 +0000
Received: from mail-4323.proton.ch ([185.70.43.23])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeGkG-00CFC6-1M
	for ath11k@lists.infradead.org;
	Thu, 07 Sep 2023 15:16:39 +0000
Date: Thu, 07 Sep 2023 15:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
	s=protonmail3; t=1694099788; x=1694358988;
	bh=p90YcYPPX1GDi/aHXgUPhpVPTXN6sPVRNEYYf8Pj3jQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Vh37t9JCEiKBNd7gSrJps12zzpsmPApFhFz7EmpoVvDGkdIrEzKEJpXPnafCaO2GT
	 /nUz2Sp9m+4W6/iw5NBrNxWGe5sPrr//WhgbH7hNamu988kyrkqw1oHyTJ89dXBLmR
	 42m3jcXXtn4NO8ZL2lFdVtTEQrx7ZPGSyzLzqX9w3Q8/rpziX3fiU4KioPWfQJs5Kg
	 f5CRdTKj+ojjvjL7840GeMYWLEUPlZxMgh1tJmnuttHxM/v8vbvmWnW3Bf8c7f9Oq6
	 mSl0AiVGi+qi54MAOK6r8HPW74RTw6oVTb/XiR/+EGBq8apMYQg3lbRUC/ocR2dGpC
	 QTokrK5pl3Utg==
To: Johan Hovold <johan@kernel.org>
From: Alex R <alex@ironrobin.net>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>, "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: WCN6855: Request: Support ThinkPad X13s 21BY-S03Y00
Message-ID: <aMi4zXfWxMWs2QxBRyLwLb30U-nf6DPgkOd27if32rD-T5rYfBcS5q8fXgUE-FAarK7NlWmNjDt12o81fDVLJMtygm5mpracZ2TuvrVoFQg=@ironrobin.net>
In-Reply-To: <ZPiS7EJe7teOpOyw@hovoldconsulting.com>
References: <mYl9fKKm9_Kn1aqjsnk6yx9YxhhFShCQeF2qptjjWlKDJ-XpxsO038Eag4A9S4EABiWbhiJ8polAtrOwVGIZeZ1yYTSwNYldBBDeZXMmtxI=@ironrobin.net> <87jzt3ellx.fsf@kernel.org> <ZPhCq32KlaZteCzG@hovoldconsulting.com> <d191d35f-f006-45e6-bf69-3d4d251a892b@quicinc.com> <ZPiS7EJe7teOpOyw@hovoldconsulting.com>
Feedback-ID: 54785507:user:proton
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_081638_578359_0E4F6A5F 
X-CRM114-Status: GOOD (  16.41  )
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

Q. Did this module ever work, and if so with which kernel version?
A. It seems to work more reliably on my archiso kernel, which is 5.19.0. 
IIRC this is where we were using the wifi hack, before we got the new X13s board file.

Q. How is this module identified when it starts successfully? 
A. Here is the dmesg from a "successful" bootup: https://pastebin.com/1kLDzXSD
(I was able to get the wlan0 device to come up by booting into Windows 11, checking for updates, and then shutting down (not rebooting) 
(fast boot Windows 11 setting is disabled)

Q. How did things change in 6.5?
A. On both 6.4 and 6.5 of those versions, we have the same issue in the dmesg logs. 
Although it seems I am able to get "successful" boots more often with 6.4.
I have no data on this though and could be wrong.

Q. Have you verified that you're using the same fw on both the working and non-working machine (not just board-2.bin, which does not seem to be involved here)?
A. I use my own distro based on Arch Linux ARM project, and use the same x13s-firmware package on both machines, so firmware must be the same.
https://github.com/ironrobin/x13s-alarm/tree/trunk/x13s-firmware

Q. You also said something on IRC about dual-booting Windows making a difference, etc. etc.
A. On my faulty machine, I've tried both dual booting Windows and running linux as the only root partition on a nvme drive.
The only difference I've noticed is that I can more reliably bring back the wlan0 device by booting into Windows 11, connecting to the internet, and then rebooting into Linux.


Alex

------- Original Message -------
On Wednesday, September 6th, 2023 at 9:55 AM, Johan Hovold <johan@kernel.org> wrote:


> 
> 
> On Wed, Sep 06, 2023 at 07:47:17AM -0700, Jeff Johnson wrote:
> 
> > On 9/6/2023 2:13 AM, Johan Hovold wrote:
> 
> > > I've asked for some more details from Alex over IRC, but it's currently
> > > not clear why there are problems with this particular machine.
> 
> > Is this using the single MSI interrupt feature? If so, try:
> > "[PATCH] wifi: ath11k: fix boot failure with one MSI vector"
> > 
> > https://lore.kernel.org/ath11k/20230601033840.2997-1-quic_bqiang@quicinc.com/T/
> 
> 
> No, it's not:
> 
> [ 2.195919] ath11k_pci 0006:01:00.0: MSI vectors: 32
> 
> Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
