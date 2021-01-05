Return-Path: <SRS0=Iy3B=GI=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC47C433E0
	for <ath11k@archiver.kernel.org>; Tue,  5 Jan 2021 13:41:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55373229C4
	for <ath11k@archiver.kernel.org>; Tue,  5 Jan 2021 13:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55373229C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2pbwEMSCX7prDMYCDddN5fHkmeOxBS3IvzcKU1Ickz4=; b=Ze4ed39vAXiIMKGGkBGjkLUvi
	IwRQFPzpJzcljth0Mp9n+ayL+ohQcXkeLYMYPXh3Fa0ryeIoDmBaqbr+hEZBQSFAOjkQTiYg9p1Fe
	aifOwP9V5mbp/Sc2DXEnLfSVF+ud6jTM+xLw2dc1s+PZRrhwRAzqhgZIVBboowVNhUXK4nIIoVHSP
	T1h7UcH7E5uIL94fK32705gD+S+Y8ZAn3zI5z1UC5viU8p8CLvKUkByVafZLyYw41KOOQxwx9aK9e
	p5vbD4hPjv2VMrjNM4Xb4KnOWY4XGjB2Dt9l/CJdjSImgjAWXy5lRh4kCuOGDga31EJW48woRhomf
	OhJUOIM6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwmaA-0007Mp-Gt; Tue, 05 Jan 2021 13:41:06 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwma7-0007Kp-SA
 for ath11k@lists.infradead.org; Tue, 05 Jan 2021 13:41:04 +0000
Received: by mail-io1-xd32.google.com with SMTP id r9so28204877ioo.7
 for <ath11k@lists.infradead.org>; Tue, 05 Jan 2021 05:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=BHYk/pxYuqWXtTS9o1tJecF0BRYBednBn4aqWon7MRE=;
 b=f45oT3TphGOdr13Q5wNcfJtNJEyemKPHqdZ0QKbP3LMm2FvCwGtgWCli2+NOCGJyKb
 qxl3SASdQ2nYpXM9GQ7kaUARSRBmBnDwlZQFyvKmcaCugRd6gnC55Ivhe1q5tp9hrUb2
 V0TEFrFiMO+ePI9mxx6Y9LZXN6/J6DpI5MQaNCF65/nOT9nqFhpnAxkk6aJJb6dEC5Eq
 5tgnl9i+5hTf7lFIxJpWf99l4p2sgGcVxuCWcafu7oMh44lCkz1Jw7qcnAbbnSrqcke6
 BKMHiUk5jY2vCM5Cy7ACEmk6ILMFEGbNnUx2bia9liAdJjLaigGs4RDjLCXsUiPCLq7Z
 Nh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=BHYk/pxYuqWXtTS9o1tJecF0BRYBednBn4aqWon7MRE=;
 b=kAQZDwo2dJipV3DbGFZ2iiCR6wStcWKhfdhTEYjWfm8NAeGIiBRQ+z13WyQzWUoykd
 ByoThoOVE0YwbUVsCR+tqddnpWgurb9lgMq8tGUlbFl3nzCKpTr2TUcVLh4Qd7YHpX8X
 Yf68lTigozYZhIVkD+2bs3XLpoVpveA1vYSt/XMkD9CXxb8m+/PKsCF01dKAd4Dy8f2j
 8ldaAs9KX3IHNyZhWY1UT+dKgAHFXMLq7k7+nSDu2CA6qItVjEGLTKNapeXBJ2mZ2BiQ
 N1byoqnXWTl3gTn4TNdry0/R3tv0YrNcSbbw+zTrueLTAqJu4nec81avge9wXZO4qd2Z
 VVJg==
X-Gm-Message-State: AOAM533btNbwlETMLTunOyjV9IDUnZTI8qtVtGuuyaMWziGDvF8tIblz
 +H78eVvXU40AK/Alp5WKWMJGtBNCm6Lp5+llRb4=
X-Google-Smtp-Source: ABdhPJwq7X8S7MO/f/miviSdav6uUhMpS9nxePG0fjQ0N/eZXkPfF9K/QkEl8ceH1xFLD+W74C85AbuZgG2uR6WEwqw=
X-Received: by 2002:a6b:92c4:: with SMTP id u187mr61812978iod.57.1609854047932; 
 Tue, 05 Jan 2021 05:40:47 -0800 (PST)
MIME-Version: 1.0
References: <CAM+r-RhxY4TA4zPm6e6ah9RWdBY67J=5oRS3+=+EQMomKa10QQ@mail.gmail.com>
 <CA+icZUUM8cPUvwVRFqodZxNs=4pVaBJGCWu6mL=9T5tym_OmeA@mail.gmail.com>
In-Reply-To: <CA+icZUUM8cPUvwVRFqodZxNs=4pVaBJGCWu6mL=9T5tym_OmeA@mail.gmail.com>
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 5 Jan 2021 14:40:36 +0100
Message-ID: <CA+icZUX7+bOgqPTtwNjXO4PCvjAm9T7akWvDxV47QPMR2auiSQ@mail.gmail.com>
Subject: Re: wireless wiki: ath11k missing in drivers page
To: Kalle Valo <kvalo@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_084103_941977_444191BB 
X-CRM114-Status: GOOD (  11.09  )
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

On Sun, Jan 3, 2021 at 1:50 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Hi,
>
> recently someone asked about issues with ath11k devices.
>
> So, I checked the wireless wiki pages.
>
> In the drivers overview [1] ath10k is listed and linked [2] but not ath11k.
> Smart enough I found [3].
>
> Can you or someone else add the link to athk11 in [1]?
>
> Thanks.
>
> Regards,
> - Sedat -
>
> [1] https://wireless.wiki.kernel.org/en/users/drivers
> [2] https://wireless.wiki.kernel.org/en/users/drivers/ath10k
> [3] https://wireless.wiki.kernel.org/en/users/drivers/ath11k

Thanks to whomever fixed the drivers overview page.

- sed@ -

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
