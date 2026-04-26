Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D839FF885D
	for <ath11k@archiver.kernel.org>; Sun, 26 Apr 2026 17:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYTGPaSzC9g9Aelp0n/1FXmbEEOQq9vF7j7gnyJSjcc=; b=YTwDobbDdrwBMEfe82RChvWQV3
	cNBLkqcELo34dqEDSN+OsogT7k0RKIV8Tnkvn6TRzsRVUaFxim7+Ev23zhfNL8jFN5zRByv4KdItI
	C6H/KNd0iAlG5fy4ArVRbjakXlvM+4T6TskZFJeVsVkxTk2vI4Ngx+TQlZ24JUgEcj3U4It9N28JA
	tJ5Gse33EbOEPWoK/zVZfRPjVDReNeQKYfgreMFePlJc7RoyCDGuMhJXdOt31kKxYMjGL73KTKZyf
	cZEAB5USLa+LE/UcV57IZTYQFh2m4TF2K38L+cGvvHBZRaoiwqFE0RzOaMmmRQyKxXauJEzLVAtWv
	+9qI8r9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH3XP-0000000Fk2N-1HIQ;
	Sun, 26 Apr 2026 17:44:59 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH3XM-0000000Fk1y-2VSe
	for ath11k@lists.infradead.org;
	Sun, 26 Apr 2026 17:44:58 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-40f1a1f77a6so7095429fac.2
        for <ath11k@lists.infradead.org>; Sun, 26 Apr 2026 10:44:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777225495; cv=none;
        d=google.com; s=arc-20240605;
        b=X1THkHO/4unvc145+3aabW3urX7J5KFUtm0P7a/C7x/y1g1oGH1o6+DBSpcjyktxHn
         ZChVOua1Zqh+LfAPwp2hIDQ1wzasIYgV3TBt+uGqLW8scmx11aNQ4zZvHGShwXXGdNLd
         DHYscRpq5X6soLrgRfnS2I6O72cHeBdZhJL2MOUzE/Ueq+/Mg8t7M5u+xJGYX3RoLntV
         Y6PUhEloV8XtL04RfcRLktm5ZmR7JN9ArjwGpBEH2uxCPWP/09nBrHx455/O1O3YHp62
         4gJzO+iUX+H7xyDTnFJS9y6UlAfeELgShhk7ilSMCwuE8s/m07cy2zxQnqkfpx/V4vkN
         fY9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AYTGPaSzC9g9Aelp0n/1FXmbEEOQq9vF7j7gnyJSjcc=;
        fh=xQCwlkC/T+7ilAwX/9E3CLyw9QKAXa9O35mfYoOxHnU=;
        b=aa7aF+jaCN0qjMd6NpGOK9jMoTGGKHT4jE+ieUe+bv6qNrKVZJsRnaeI32vHe2Xtnr
         pq66u7iJRDutfaA1JYuI2IcbLruOoUasgZs/aiItKV86R8doabEXrQbSF8bZBEaYMSpS
         ibgQUWo2uNUi1lAI5kdB7MhGv/kDVEbAmWPE+rTgEba/w/SqooeE09tr5HAXntcqyJVf
         CyqkPkj99ADyXxMxtUAb7OjpO7SDzVhraySbbdzPSGiIy9mEtoy62HlJPTC9KUpUgztA
         lWPgBhjs8bBOFD1KKeXL1ATkJwLgGfvHJ0YS+KJoK0px2uTvb9pJC9LiWYh+PysJttR6
         pUHw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777225495; x=1777830295; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYTGPaSzC9g9Aelp0n/1FXmbEEOQq9vF7j7gnyJSjcc=;
        b=X8FU+CprMyLQBA+azllg/BgeCAr2wGf4jHjII0HgoG3X0qal4s3W515BjDatBzDyj+
         /vwaA921VStD5eD1d/YeswQAmNxcTgZf0HQg+owDLZAiNPA/+XTrX/7cQuM0j3dFsYuK
         j/OQVvwTNV5XmUjC5/V4FAW4coc9yvyk1M2PUgHpAKtthmQMSzz409VPc7Ab1fW0s+zv
         dZ40KSVIbUtJ98cWquQ9Ms3VEyGiH6MKDGyO4G5eQzKZ9HGG+gvjk2vX4WWV7QsYS7AR
         iSDBk9fZNWyMUp7SBYzqhIqO0Zyp2AxAFggW46DO0FqZc7gnvsd78v1GZeogFzFeBBxA
         EJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777225495; x=1777830295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AYTGPaSzC9g9Aelp0n/1FXmbEEOQq9vF7j7gnyJSjcc=;
        b=ijr8EcMpcDQlY0PZPX810Fkyclc+Jj5CLHRQ9k6VhIyYMto2mz6KTDISkXqiRiR8HX
         pZx+Q1h/kpOiX8aRxaRijMU5QOPKzkkhmLl7WIciWY5LFpsoYZgkLcw1HUN8rgLUiiW+
         pCahhiyIEVVWzWwAO/kArxB7gfCbNjjQx1FhWHGsgGxjRVCE0f9nengQf9df7GifiLdh
         W1yKp+s1jc/y2JqhBEGfPkrxHMAEp3KMlFmrQ/cIr8XGaUgcqp4PzXOfnxRbhzZKtizf
         mmM81cd/qekw7hUc+VmfPZRcxzMi1v+McmXL5/tatk4d1CE7kjYEf46ECqCTMcs1aPsd
         7nMg==
X-Forwarded-Encrypted: i=1; AFNElJ/lhwW7d3RVn2ftfsEziqWjUopRZk+zwWcs6RkIwUzun0k0HzkLZpOeCmvI8Xrfz63KHsp2VRc=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ9yNorDekFU8PTeblUFaP67GKXfvILnBvjxiaMInUAH/dghCi
	1jKii6vurEa81HTx4zYGhgkaLNKdbl/XZnQz8CEPETbX0nqF89cL9aQAvksXql6fCxmr6vsRI58
	QsyOeHQe+Toj9WIihKCwlCu/HQeCkT0Q=
X-Gm-Gg: AeBDieuFsx6nuugHtO8y7yepoDKHISmhXsu995aXlAMQmCZlc7TMeN3gPxU2eStSMMm
	av9zzJT24KTkagJVqDyAwV8RqJRVtIAtXmzlVgo9D3aj1bSK3lLFDz++TxDkwHn/w9CBPheBLsd
	rODk9i/wcgw5vl/DTAR4rx7lyGlQYMExODI0n9aGKf90MMe/V6iBSDRm35XwHyEHiaazzM35/pF
	T1qXysgmOhYLz8VsPQxCXyOrin0DuSO4tom0w3Z8s1FpaB6CiW9YV0FigVJ/XxhX8NJUz9j97O9
	O/cH7dl8mjo3YYgkboDxmmrTe/Ed1vEqc7hSckLpmjGcBgQ=
X-Received: by 2002:a05:6870:538d:b0:417:685e:3748 with SMTP id
 586e51a60fabf-42abee7de58mr22571979fac.0.1777225494749; Sun, 26 Apr 2026
 10:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260423211458.458911-1-santiagorr@riseup.net>
 <IA2P223MB1199153665E2AFF709BD2F52D02B2@IA2P223MB1199.NAMP223.PROD.OUTLOOK.COM>
 <aeuH2chCSi57RYVU@voleno>
In-Reply-To: <aeuH2chCSi57RYVU@voleno>
From: Kyle Farnung <kfarnung@gmail.com>
Date: Sun, 26 Apr 2026 10:44:43 -0700
X-Gm-Features: AQROBzBchYflWzFZAnRxvq1wPZX_0YofjEZPYiq9aJN6bwju_Tkgkgo__6pvNzs
Message-ID: <CAOPSVF3=BmOUw5+nnk-EYnpP_ff7wXsFAaz6sHbw-brLy-HojA@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath11k: Add two missing Lenovo IDs to the quirk table
To: =?UTF-8?Q?Santiago_Ruano_Rinc=C3=B3n?= <santiagorr@riseup.net>
Cc: Kyle Farnung <kfarnung@outlook.com>, Jeff Johnson <jjohnson@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"koike@igalia.com" <koike@igalia.com>, 1132343@bugs.debian.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_104456_649794_E74430FC 
X-CRM114-Status: GOOD (  24.81  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Fri, Apr 24, 2026 at 8:10=E2=80=AFAM Santiago Ruano Rinc=C3=B3n
<santiagorr@riseup.net> wrote:
>
> El 24/04/26 a las 02:07, Kyle Farnung escribi=C3=B3:
> > > From: Santiago Ruano Rinc=C3=B3n <santiagorr@riseup.net>
> > > Sent: Thursday, April 23, 2026 2:14 PM
> > > To: Jeff Johnson; linux-wireless@vger.kernel.org; ath11k@lists.infrad=
ead.org; linux-kernel@vger.kernel.org
> > > Cc: Mark Pearson; kfarnung@outlook.com; koike@igalia.com
> > > Subject: [PATCH] wifi: ath11k: Add two missing Lenovo IDs to the quir=
k table
> > >
> > > Commit 0eb002c93c3b4 ("wifi: ath11k: Add missing platform IDs for qui=
rk
> > > table") added some Lenovo platform IDs to the quirk table to address =
a
> > > wakeup from suspend issue [1].  However, at least two more platform I=
D
> > > are missing in that table: P14s Gen 5 AMD, as reported by Kyle Farnun=
g [2]
> > > and P14s Gen 3 AMD.  This commit adds one ID for each.
> > >
> > > [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D219196
> > > [2] https://bugzilla.kernel.org/show_bug.cgi?id=3D219196#c23
> > >
> > > Tested-on: P14s G3 AMD.
> >
> > Lenovo products have a pair of IDs, you'll want 21J6 [3] and 21MF [4] a=
s
> > well. I submitted a patch myself [5], but I've been investigating anoth=
er
> > symptom.
>
> Thanks for the notice. I will adapt my patch to remove the conflict with =
yours.

Feel free to just merge yours and I'll withdraw mine. I'm regression
testing the WiFi disconnect issue I'm encountering, so I'll just focus on
that. In the meantime this seems righteous.

>
> >
> > I have the same "wake on power removed" issue, but I have another issue
> > that's more annoying where the wifi just dies randomly. I only have the
> > wake issue when power is disconnected, not when power is connected agai=
n.
> > I mostly leave my device connected, so I only realized the behavior whi=
le
> > doing the regression testing requested in the other patch.
>
> I've also been hit by a similar annoying wifi randomly dying issue that
> you describe [deb#1132343].  With the patch that I attached applied to
> 7.0.0, my P14s G3 AMD laptop has been running for more that 3 days, with
> several suspends / weak ups, either with power connected or
> disconnected.  And I haven't encountered that problem since it booted so
> I concluded that the patch fixed it.  But chances are that I am wrong.
>
> [deb#1132343] https://bugs.debian.org/1132343
>
> The latest bad version I tested where the wifi died was 6.9.11.  I plan
> test the patch on top of it.

6.9 or 6.19? My issue started between 6.16.10 and 6.17.4.

>
> >
> > [3] https://pcsupport.lenovo.com/jm/en/products/laptops-and-netbooks/th=
inkpad-p-series-laptops/thinkpad-p14s-gen-3-type-21j5-21j6/21j5
> > [4] https://pcsupport.lenovo.com/us/en/products/laptops-and-netbooks/th=
inkpad-p-series-laptops/thinkpad-p14s-gen-5-type-21me-21mf/21me/21me000pge
> > [5] https://lore.kernel.org/all/ba4d194b-6d31-4d8a-a6a6-da116f9f56ac@os=
s.qualcomm.com/
>
> [snip]

