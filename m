Return-Path: <SRS0=czDI=GG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09143C433E0
	for <ath11k@archiver.kernel.org>; Sun,  3 Jan 2021 01:32:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 981B62078E
	for <ath11k@archiver.kernel.org>; Sun,  3 Jan 2021 01:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 981B62078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HH6CNwu4MHqY2o6CrHamVRjE/MhP5te7aXDf+7YOmGo=; b=NRYjSVxZDPY7UsvcpDN721R1L
	ucojVuopfU0XthUfiRooSdHer0bZi8f/srnhBYLb31J7J05j31DfQ9p6gEh280VyB/Ma/+9k46Qfi
	6LgRCKgSezFFtPs8SB2b4u/r/mpxBhW4imyDLgu5Av6GyodVWFeyc9g854rx8QyPyxswICKmbQHof
	r6awc0aTn+TiVXER2mS/8AUFTu5E3GRBRlhSxNtL7pm+PuBXGDLd6XwFUQX357x9sVLQR0c0IROcg
	jqYkB3Lo1gxInGogALCl7IDzoq7FE8NqbzWNWeAT6Zdmta5YTykwrvPhm61GnsFZIsFzAGe5TEm4Q
	mA083YpbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kvsFd-0007N0-O7; Sun, 03 Jan 2021 01:32:09 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kvsF7-0007Bv-0R
 for ath11k@lists.infradead.org; Sun, 03 Jan 2021 01:31:38 +0000
Received: by mail-vs1-xe34.google.com with SMTP id x26so12697275vsq.1
 for <ath11k@lists.infradead.org>; Sat, 02 Jan 2021 17:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JGN25pyBFFn5jg2H18A+uS9Z8SjOOJtPGOyj6yaT+no=;
 b=iS7luekN3733Jlg6HBHKHoCmhqK8NpYy/oYmMsgc615UkQ9LMb7yXY6GSkMZQJaDL/
 b3HOjH33G5b1FGmRTeJiAujj24SADxPerAC2617kxonQ3Ene+sVNYqO2D3V9kmHT1YZ0
 m8Ykuvsa2pyf3VmUJOUAkB4eOHJGu+8mz9K+nMNGY1bvR2ry4zK0JbIsEFpt/oBfzUG7
 PZ+N74wusMI3qx9shkAcYA9H/kLw1Zj/XCHriJa0vwvxfHP21/Boiu8sKTwsNPZe91/E
 xXinNhBU2iV3Wfh2DNv0JAqxaawc7ANBdjvEKg02jBub+XU3DMEAd1XgJ4KOgD9RmAm1
 HtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JGN25pyBFFn5jg2H18A+uS9Z8SjOOJtPGOyj6yaT+no=;
 b=k0hXfIgPV0pEsce3KzmoZN3ZpZ1f3/Mp6Z/Xq3+iQIqAvJ6QSsPQXpJhnurO7etd/7
 LafQ4UfD0vVd5/Z+wP0/2+ysa7NmFhEzcl1VJ7hl0eEhqflPXYzkk069SQ4l5dwKWHQY
 MDZ/OExs6vjQ2qBYYNORBKpXFKUXM7jcV9xNY/Z0Y09OuD6nzL9XK9FfsL963oa5vNSW
 Ylmi1X2Zmz4Tn61irCfCvQOJ+scjSFCJBVR6K56tr6nKFHgRvdzU9CEJRN9yj3xYofww
 6SCSKRJxBVzPRBXcEzqUoiySOC8cebH8e6C5tBfHFXM9O0OGWfM4drUELgqVdtyL2S93
 ceAQ==
X-Gm-Message-State: AOAM531Il9qfoNUn+exsFvhXTb4vIIQR8AxDP3YfaVyoz+zh9lEMxCmR
 zdw/HO1xhtx2Me1ioohbFG8Yjhe8GbV2xFmfX6w=
X-Google-Smtp-Source: ABdhPJxq8aBjipKPgu9bpDpiTw/HLHMg92HmpF2B8V/+2DFKBr7f3UcQPAzrewDCVJSDDVhIzOq1ujQtaZiQd0vt9kA=
X-Received: by 2002:a67:32c5:: with SMTP id y188mr38982565vsy.4.1609637490848; 
 Sat, 02 Jan 2021 17:31:30 -0800 (PST)
MIME-Version: 1.0
References: <CAM+r-RhxY4TA4zPm6e6ah9RWdBY67J=5oRS3+=+EQMomKa10QQ@mail.gmail.com>
 <CA+icZUWcuka-6j139+89pSV5Z-r1fYVriz+wJE0gma4RO_PL9Q@mail.gmail.com>
 <CAM+r-Rj3y6DGonMPQ_V7qCwWH7v1bgh5x7YmAzMh5-cY68jJiw@mail.gmail.com>
 <CA+icZUXkwN=WT+hOop2WjwdVOp8UB93XKd07KB_EdCP5U_znsg@mail.gmail.com>
In-Reply-To: <CA+icZUXkwN=WT+hOop2WjwdVOp8UB93XKd07KB_EdCP5U_znsg@mail.gmail.com>
From: Luca Versari <veluca93@gmail.com>
Date: Sun, 3 Jan 2021 02:31:04 +0100
Message-ID: <CAM+r-RgHsVSOjH8+2jaw6xJAm=ykcJa8Mw65jOma=w_yDyt5hA@mail.gmail.com>
Subject: Re: [BUG] Stacktrace in ath11k_pci
To: sedat.dilek@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210102_203137_203159_5CCB75DD 
X-CRM114-Status: UNSURE (   9.31  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

I can confirm I have the latest firmware installed (same sha256sum).

On Sun, 3 Jan 2021 at 01:34, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Sun, Jan 3, 2021 at 1:18 AM Luca Versari <veluca93@gmail.com> wrote:
> >
> > Thanks for the quick reply!
> > Unfortunately, this didn't seem to work - I'm still getting the same
> > stack trace:
> >
>
> Latest ath11k firmware?
>
> - Sedat -
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ath11k

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
