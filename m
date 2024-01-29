Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A201FC47422
	for <ath11k@archiver.kernel.org>; Mon, 29 Jan 2024 12:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jR4sLhFOaf28/S/lK56XEjGNCcduna82E4wAQtQHSA=; b=TiD13cRcBCJpU3434VUkIc/7b8
	lx8c3IzbA/9LpBd26xDtgB5Mq6TaHgYNRsuHvwqiAsVDP2xRjqbaEK2yO14p4lGD82WX37cvZd15H
	s559B7s2/RTG3HoYuFfA8kYtKh1fCOyVpT99lNRSKnwcPxA3aabJk4YuB6o1bMXRppExUSg6CPQ+H
	C721UycR6QV5DUk+atDhmMNKDxUQtYwJN0k0gir5Yzayb75mbvicFmYGmiZ9cVBMjdLaZ2ZM7iKfZ
	Dfb2QBNrVrdtlgFkcB9EDvJm+xyyTFs9qCLaKMBeIPs1EMblVStSmSPFFP8WCHg8iqel/kz0SAl1T
	sr1ZEDlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUQey-0000000CaiG-0knT;
	Mon, 29 Jan 2024 12:22:44 +0000
Received: from mail-oo1-f54.google.com ([209.85.161.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUQev-0000000CahQ-1gLc
	for ath11k@lists.infradead.org;
	Mon, 29 Jan 2024 12:22:42 +0000
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5958b9cda7aso669888eaf.0
        for <ath11k@lists.infradead.org>; Mon, 29 Jan 2024 04:22:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706530959; x=1707135759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jR4sLhFOaf28/S/lK56XEjGNCcduna82E4wAQtQHSA=;
        b=btFih1ZRLrkgfttAgjQc8O07V02930dmdQOZm8WQwJFYwIrSBXTEb62RV91CUqklYB
         jKs0PVTrf65IEA3PdtCT74JR9egNLuzOtT2MFq1ftd83jIvzJE8pwAkVvgkBVEZh98NG
         W5XhWnnBlxkawjWP+/3NivwkU/ZEQPhDHTCFrNUwRWm5PUf7TmdoAMTFRHyfq5jOgSpw
         ayeMzFMFqbS3K2/GM5YcvONyqsBepz9SfSEOnZIupKlREABYQmlcQziQVAm7wsiO6ERZ
         8vV4ijBeCbL26bvVgbqUvKPInTrhosfWqwympbppmK5uHjx/2nXfvBsNKBz+J3LQqviY
         YaUg==
X-Gm-Message-State: AOJu0Yz2GNQDxpEAMJ3dnQwaPOhMkkNGaBHKE3IIV7ydRhzxVXD+OEsc
	Z2lJ74ARGGZSh5qZudE6fQ7S8lL2EUxb7qNTKK3m+8XD2nioGvylZ8CwjeunGsOhNhwdTKNOKks
	giZ7bdBZ95d3KtZrYixJk+e+9az4=
X-Google-Smtp-Source: AGHT+IHC5vEWdAaEASgOju0Y7p+W+6LnfFDAlz/L32dm7GY5shRYFtdOnTyhDvpY1xXovAJ1qQu7h2aI9BEM9aV4q/s=
X-Received: by 2002:a4a:bd8c:0:b0:59a:bfb:f556 with SMTP id
 k12-20020a4abd8c000000b0059a0bfbf556mr6398581oop.0.1706530959073; Mon, 29 Jan
 2024 04:22:39 -0800 (PST)
MIME-Version: 1.0
References: <21cd2098-97e1-4947-a5bb-a97582902ead@quicinc.com>
In-Reply-To: <21cd2098-97e1-4947-a5bb-a97582902ead@quicinc.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 29 Jan 2024 13:22:27 +0100
Message-ID: <CAJZ5v0inw7pZR3-fNz9H4BdAXtVawN8m7dsDi6CeBxK2tnNGVg@mail.gmail.com>
Subject: Re: ath11k resume fails due to kernel blocks probing MHI virtual devices
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: rafael@kernel.org, pavel@ucw.cz, Manivannan Sadhasivam <mani@kernel.org>, 
	"Kalle Valo (QUIC)" <quic_kvalo@quicinc.com>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	linux-pm@vger.kernel.org, "kernel@quicinc.com" <kernel@quicinc.com>, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_042241_479247_B3B52D22 
X-CRM114-Status: GOOD (  21.89  )
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

On Mon, Jan 29, 2024 at 11:10=E2=80=AFAM Baochen Qiang <quic_bqiang@quicinc=
.com> wrote:
>
> Hi Rafael and Pavel,
>
> Currently I am facing an ath11k (a kernel WLAN driver) resume issue
> related with kernel PM framework and MHI module.
>
> Before introducing the issue details, I'd like to summarize how ath11k
> interacts with MHI stack to download WLAN firmware to hardware target:
> 1. when booting/restarting, ath11k powers on MHI module and waits for
> MHI channels to be ready.
> 2. When power on, MHI stack creates some virtual MHI devices, which
> represents MHI hardware channels, and adds them to MHI bus. This
> triggers MHI client driver, named QRTR, to get matched and probe those
> MHI devices. In probe, QRTR initializes MHI channels and finally move
> them to ready state.
> 3. Once MHI channels ready, ath11k downloads WLAN firmware to hardware
> target, then WLAN is working.
>
> Such an flow works well in general, but introduces issues in hibernation
> cycle: when preparing for hibernation, ath11k powers down MHI, this
> results in MHI devices being destroyed thus QRTR resets MHI channels.
> When resuming back from hibernation, ath11k powers on MHI and waits for
> MHI channels to be ready in its resume callback. As said above, MHI
> creates and adds MHI devices to MHI bus, but they can't be probed at
> that time because device probe is prohibited in device_block_probing(),
> finally this results in ath11k resume timeout.
>
> Now there is an potential fix to this issue which would needs changes in
> MHI stack, i.e., don't destroy MHI devices while hibernating.

Exactly.

> And we have had a plenty talk with MHI community regarding this change, s=
ee [1]
> and [2].
>
> However Mani (the MHI maintainer) doesn't think it's right to fix it in
> MHI stack. Instead, he thought we might need to add a new PM callback
> which will be called after device probe is unblocked. By registering
> such a callback ath11k can wait the dependency driver, i.e., QRTR, to
> probe and initialize those MHI devices.
>
> Your thoughts?

I'm not quite sure why do the pointless device destruction and
re-creation in the hibernation frlo and add a new callback to the PM
core to work around this.

It doesn't sound like a straightforward approach to me.

> [1] https://lists.infradead.org/pipermail/ath11k/2023-December/005098.htm=
l
> [2] https://lists.infradead.org/pipermail/ath11k/2024-January/005205.html

