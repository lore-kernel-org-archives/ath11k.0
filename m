Return-Path: <SRS0=PtVs=HO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726D9C433E0
	for <ath11k@archiver.kernel.org>; Fri, 12 Feb 2021 09:20:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3028764DE3
	for <ath11k@archiver.kernel.org>; Fri, 12 Feb 2021 09:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3028764DE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gpRj+1G4erB4h+095wQIKv7FJsyk2tx0B1+nHCWoXjM=; b=sz+yUfcYEBaamOjrnwC7d1/Zh
	MjfHQthR96s8cocoCMFn5PNWAN2Cw6Zxd9VCnMyOmWVbFY56uPnzBW3JfmWXz8ZYq0PUwqoYneKQM
	QHHU8c4oYEbLut9ba/DFKVDfc8iLR8itrKrnipxuwhPkiMnzEHNhp52suiquvfxNyS2ZAUHdPk+bm
	BVa5ijqGr0h47tMDb7qsC7XJhthIlYU4fbQ/BAxf+D6kE3kaTs6o2bsbYserMAsZQKNNAuiqeUAPp
	o/AtzS1VR2kGFUkVYrO5tLXzY1CyrNiegsE/vRgFG2FyANfr4cvi1Bbqlg4mnwF7cQFOZnyGyWEjC
	NJmcf0yjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAUcf-0001UC-7I; Fri, 12 Feb 2021 09:20:21 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAUcd-0001T8-Qp
 for ath11k@lists.infradead.org; Fri, 12 Feb 2021 09:20:20 +0000
Received: by mail-il1-x133.google.com with SMTP id e1so7636254ilu.0
 for <ath11k@lists.infradead.org>; Fri, 12 Feb 2021 01:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=ZGziJCgfOp3eK9+SLJGjh0ud/akHMIW3uThFczcSMx4=;
 b=MRZQGrsWGqHWhzpIURx+QBesBlw1dk6Z+U/h/+f+/MEyHASFahZPBLGd9AvcarATSr
 Y20E2s0Aldi4WwvHHrNL4/8bT+jotzPP9YtqNrgoVtUxsRSxTWiiFGSqcSudsDB/K9Xl
 PAl3kibDVigvNsUlRNdqg950fdxPvYxQ0G7CxJJVWtlD/xUP7KPe8pKRW2OmANEdiMwC
 XiOelifWyD8YpJ/TICIpyjel4JBW3fLjQCdzxLK0VmrAX3+PWuJxbWljK2n4cRrX1i2P
 oYyzKdUMtoyZuhgjq325nRQVvH2FtFwX+EWie9+gbyOdTCsk7PNT+ywnABaKfC+SsRKQ
 otlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=ZGziJCgfOp3eK9+SLJGjh0ud/akHMIW3uThFczcSMx4=;
 b=lX7xSI56FUXF+Q7Y4okTiB5TUJ9PQhwCa3v8KALDnFOAY1dno2aJEnNOkBCLYI0R21
 UZAs6u8p2Pl2/lkTF/VVV0mB5o6C1HzN4/TJARY+CvcyMHiltmkBiVYaKlrWWwRKYxJT
 rHGdEQh7iY7fpRv1dqoAB7PR5DQgEcmIaaNbkWyfXUWOj8zQ+uCAiraQ5XHbb9aD0A47
 c13AK8E17s7vK4LhXATj6RYJL/WHc9RPF63F/4PbwqVgSK93GkTJQrHlonJJt8YDj3w5
 ApELPAxQswr8kNtM452u+aduxtlk+68GIu+eW/XkMsU2oUmNmkxibTUsnyjhTP61dtLn
 f5kQ==
X-Gm-Message-State: AOAM531auK1rRtxKBwNOxQ6Ak4ZXOPMpzGe+YOxzyAGRH5kYHW8OOsc7
 hszKEEnwEh/kBhgQhJYbQ02sj6OgJA1xnr1e4TI=
X-Google-Smtp-Source: ABdhPJz1Q500OsF8j0/ZZasaShWKuPIAQ8lRzVehGvA2jPrcFlgmb7eFIN5NclFNkLZd/6vZuwARxIgPHCQeEm6DR54=
X-Received: by 2002:a05:6e02:4ca:: with SMTP id
 f10mr1687381ils.112.1613121616157; 
 Fri, 12 Feb 2021 01:20:16 -0800 (PST)
MIME-Version: 1.0
References: <CAM+r-RhxY4TA4zPm6e6ah9RWdBY67J=5oRS3+=+EQMomKa10QQ@mail.gmail.com>
 <CA+icZUUM8cPUvwVRFqodZxNs=4pVaBJGCWu6mL=9T5tym_OmeA@mail.gmail.com>
 <CA+icZUX7+bOgqPTtwNjXO4PCvjAm9T7akWvDxV47QPMR2auiSQ@mail.gmail.com>
 <87blcpspde.fsf@codeaurora.org>
In-Reply-To: <87blcpspde.fsf@codeaurora.org>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 12 Feb 2021 10:20:05 +0100
Message-ID: <CA+icZUVZQ-1L=etOF5-jX8m0PCwhpf9c88t9gcsfLv1yYmYd7Q@mail.gmail.com>
Subject: Re: wireless wiki: ath11k missing in drivers page
To: Kalle Valo <kvalo@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_042019_906540_209D82FA 
X-CRM114-Status: GOOD (  13.28  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Reply-To: sedat.dilek@gmail.com
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Fri, Feb 12, 2021 at 8:43 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Sedat Dilek <sedat.dilek@gmail.com> writes:
>
> > On Sun, Jan 3, 2021 at 1:50 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >>
> >> Hi,
> >>
> >> recently someone asked about issues with ath11k devices.
> >>
> >> So, I checked the wireless wiki pages.
> >>
> >> In the drivers overview [1] ath10k is listed and linked [2] but not ath11k.
> >> Smart enough I found [3].
> >>
> >> Can you or someone else add the link to athk11 in [1]?
> >>
> >> Thanks.
> >>
> >> Regards,
> >> - Sedat -
> >>
> >> [1] https://wireless.wiki.kernel.org/en/users/drivers
> >> [2] https://wireless.wiki.kernel.org/en/users/drivers/ath10k
> >> [3] https://wireless.wiki.kernel.org/en/users/drivers/ath11k
> >
> > Thanks to whomever fixed the drivers overview page.
>
> Thanks from my side as well. I updated the entry now, for example ath11k
> does not support IBSS.
>

Cool, up2date docs :-).

- sed@ -

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
