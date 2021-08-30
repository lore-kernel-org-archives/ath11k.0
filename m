Return-Path: <SRS0=e6FM=NV=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCCAC432BE
	for <ath11k@archiver.kernel.org>; Mon, 30 Aug 2021 16:04:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D27B60FD8
	for <ath11k@archiver.kernel.org>; Mon, 30 Aug 2021 16:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D27B60FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0GoyZajnloZzN5oZ/bjAw+fbn6U1od0CgzoEyM6usQU=; b=Qi3Xu8SfXndoeI
	0uGGlaX/E3tmYgjQ1lXy0t0GSVHDYAeXP5Be1GKkLNpfjbPMCMOB9uT/gg13dxRQq16ILXm80bV5t
	ULjlDg/ymiA5h0oEr2hHFYm3gf4m4nwQ6wYhKHkwB3qAuCYEZ3WAw0n5PAZpNz3xwQzISI+jqb3IU
	UOlRUGxZ3QWkjbPHyxNDFqhx2CE+7NnWgoBkYsekbvKvJNznNSJFM4w1N+/Vx2dj+i0lLTX1NK3v5
	fRijZyRNfOa551sDDUCw8hg1Nu76rLNs2VaoNLDbN5sC/UScFBapT4H31pf31EPVkaLYREEQiPJH2
	4KYt/wSd91LynBBx3Itw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKjlm-0000av-QB; Mon, 30 Aug 2021 16:04:22 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKjli-0000XD-LW
 for ath11k@lists.infradead.org; Mon, 30 Aug 2021 16:04:20 +0000
Received: by mail-wm1-x335.google.com with SMTP id u15so9162355wmj.1
 for <ath11k@lists.infradead.org>; Mon, 30 Aug 2021 09:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3npUBe0XXavbP8WJVaMhY8ZrHdW9iFAEaPwrx+1F2i0=;
 b=kv/ORKs5fUBu03T9lYN00LUW3/FMATroXsOwxoFjOFNug/sQgvDLh0tctoL2fXQxYo
 SR289eCcNIv147Ay4HyVDUI03bgCZfwuGWbf5TohJc3zLcKM/OuApjauGDs/FCdO5K09
 mG7HqNmiPPl7E/a1EN1+ShguTllaaD/IqrtEGg7R7RAE3sknnKruk7tLkQ2mwg7sWS/f
 F7aGQC53inGpcPCSFItJ2qopObAYSW9zbBdh2RqGdTsHZ84b9CBphrZpRHq2C7VrPz5q
 odtFR3mLTRPaHqThfGnRyXUqUqsTrW64wk8zWZUr0fqk6zCpxzZo7aXiUCBoOqc5L3zG
 k3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3npUBe0XXavbP8WJVaMhY8ZrHdW9iFAEaPwrx+1F2i0=;
 b=GZkqcGBDMJHoImj+5oMIDsDHYUYsBlSC5EgwThkVwQ9ivHjLTXQSZkPx14DHDxXsAL
 59u/CBnfbgRu62NYhyq1EgOcpqVz8ikyAdKNOKMn1bJJjcTJ9AuDxI7zgJys6XYQ+PAl
 gzsuYtT0pjmBgxajAYi6jsQW/XYTJuRGAyjFpJ4eWC3VUYNILyVBBmxa65nZfBO9dC+/
 5XGrfyqXVI+qKS0laUbe8Nm7Xbt2O8nTAKbU4aj90vOzdU1SRsDo7S7STqu60QaZ8hgh
 Tna5bXGWeBC0mcPGA4nA9dFP+16Dzh7nlhdpuRXcA/83nP6w4yWTmhznu7iFCcYyXUyQ
 ESVQ==
X-Gm-Message-State: AOAM532F83oUxJdHGowTVFUPHChrL33zF+nXR3lE2NSVtksHFxo0/EE2
 jbRtFrDAOziZNaiNajjpkOqQ8Up9T3jS8xsmuKLbnA==
X-Google-Smtp-Source: ABdhPJwaWkgvsaMall0VM9NOjtmefWQszHwRhhuB9zaGdOGdRexopmsYFCb6Sec9eOkCckSGGtgDjC9xfGjhONmwnnA=
X-Received: by 2002:a05:600c:14c6:: with SMTP id
 i6mr14912005wmh.99.1630339455825; 
 Mon, 30 Aug 2021 09:04:15 -0700 (PDT)
MIME-Version: 1.0
References: <a8cddf24-ecfc-088e-27f4-98cbbb5fb67c@penguintechs.org>
 <87y28sqq4l.fsf@codeaurora.org>
 <843e7689-fa1e-441b-c49a-ed7291046d5f@freebox.fr>
 <87tujgqcth.fsf@codeaurora.org> <87mtp47073.fsf_-_@codeaurora.org>
 <YSenaxWzxRkYkucv@kroah.com>
 <20210826074850.16768dee@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <87eeag6yjr.fsf@codeaurora.org> <87y28o5cw4.fsf@codeaurora.org>
 <20210826111207.364d0ba5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <87sfyv5abg.fsf@codeaurora.org>
In-Reply-To: <87sfyv5abg.fsf@codeaurora.org>
From: Nicolas Schichan <nschichan@freebox.fr>
Date: Mon, 30 Aug 2021 18:04:04 +0200
Message-ID: <CAHNNwZD2dLC9dWui7kAEg8R04U0LVdQJMJCyugkHA6rdfRwGLQ@mail.gmail.com>
Subject: Re: [regression] Re: 5.14 rc6 broken for QCA6390 on Dell XPS 13 9310
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Jakub Kicinski <kuba@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "David S. Miller" <davem@davemloft.net>,
 Linus Torvalds <torvalds@linuxfoundation.org>, 
 Wren Turkal <wt@penguintechs.org>, ath11k@lists.infradead.org, 
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Hemant Kumar <hemantk@codeaurora.org>, 
 Loic Poulain <loic.poulain@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_090418_848191_23C7E80F 
X-CRM114-Status: GOOD (  11.25  )
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

On Fri, Aug 27, 2021 at 2:41 PM Kalle Valo <kvalo@codeaurora.org> wrote:
> Jakub Kicinski <kuba@kernel.org> writes:
> > Done, thank you!
>
> Thank you waiting for me :)
>
> I just tested commit 7e9965cddea8 from Linus' tree on Dell XPS 13 9310
> laptop with QCA6390 and ath11k works without problems. So the issue
> should be solved in the final v5.14 release.
>

Good evening,

I have tested loading ath11k on v5.14.0 and I can confirm that the
driver loads fine now, with a phy and wlan interface being created as
a result.

Thanks and best regards,

-- 
Nicolas Schichan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
