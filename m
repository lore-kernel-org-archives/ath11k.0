Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A91C433F5
	for <ath11k@archiver.kernel.org>; Fri,  4 Mar 2022 16:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9KB6xxHaAXf2zO3neFe9O8CcmxonQ/53dpb8do7NzE=; b=s1Cdu49fSl/JoF
	Z8ginE9OyVyEtxb8tPrwTFJ7G13ydgc6cBkGkEWR6pt88YVJ2Xp2+XV0EgzG6bK0M0u7iQge/u+GU
	of497VAzoHzH/UX4qI9RF3D6gkCr+miw0z4uf8SG1xtnau+RZBZkRAOATnqM/dlpP8OZI7GDWw1jR
	/ZWCfalEiTiQWZchd7bAejYMEmB1Wz4ArkBVRR6kGVv0Pe8t5PUXBGfaIfOV9pzARutvPXsNaMRip
	oAYMUKrnzlObnFeGqaKeVfQ3Nq3ovgxvinlo/g9X5XWS3O9iQjMZmUljyUt87G3Q37YdaxJ5ozDkU
	P9wflC5y9xOMd0s2UVBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQAf5-00AzlL-Ts; Fri, 04 Mar 2022 16:20:11 +0000
Received: from mail.w1.fi ([212.71.239.96])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQAZh-00AxIN-7N
 for ath11k@lists.infradead.org; Fri, 04 Mar 2022 16:14:41 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.w1.fi (Postfix) with ESMTP id 51DDD10FB4;
 Fri,  4 Mar 2022 16:14:34 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at w1.fi
Received: from mail.w1.fi ([127.0.0.1])
 by localhost (mail.w1.fi [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P9vLXmuBVv2o; Fri,  4 Mar 2022 16:14:32 +0000 (UTC)
Received: by jm (sSMTP sendmail emulation); Fri, 04 Mar 2022 18:14:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=w1.fi; s=default;
 t=1646410472; bh=sh6teZAZ3oJ+RZRi/ZWxXm7sa16SJJdvz6GBv9UqROM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YIAgIey9p0cF/SwHZr3hxa1ELsBOI7P+2YxLRWab0bL9WenHxMZsMLKtdtYuiJ7Zx
 grVYkJzbierYa0vNkJTni7Wx9LBISomeIMSGkVSfgsbM1LTNKpPGxq/rGCckNezgXz
 CI7tgCKk5dYFOJoi+hgtHlIJi9nSjXDesgaFSaGZmfYt81d3NAhNYMF1Hb328V+BiY
 JaGMsgqOjkFCDPWVdsl8iwDM1BLFAgrP6pzEgKWeSeVtfJT0i+5CZlXJm4+J0tBoso
 /QFIezkS9iFLk+WS2w8ATSjYILGuqrR+zUBvfdgfTdP8I3rAdCxFTwW6CMr0cKyRHG
 +1ZIkNHhkBg5w==
Date: Fri, 4 Mar 2022 18:14:30 +0200
From: Jouni Malinen <j@w1.fi>
To: Josh Boyer <jwboyer@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: [PULL] ath11k firmware 20211223
Message-ID: <20220304161430.GA430462@w1.fi>
References: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
 <CA+5PVA4WEuJDB3OCKfYK-BPaccpVWd9t_au9S7MCEtpy7cdF-A@mail.gmail.com>
 <87ee4brodv.fsf@kernel.org>
 <CA+5PVA5DJmwPqpz8F9iDbJKcF1hDBRLdDT4URgSaiEcjet74Kw@mail.gmail.com>
 <20220302175014.GA14801@w1.fi>
 <CA+5PVA6R6F=VqAZRf=xDwGcC+cpqLY1kStkoHck53XiLURVyaw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+5PVA6R6F=VqAZRf=xDwGcC+cpqLY1kStkoHck53XiLURVyaw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_081437_669867_B64D4113 
X-CRM114-Status: GOOD (  36.97  )
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

On Fri, Mar 04, 2022 at 08:04:26AM -0500, Josh Boyer wrote:
> On Wed, Mar 2, 2022 at 12:50 PM Jouni Malinen <j@w1.fi> wrote:
> > Would the following in WHENCE work for you?
> >
> > Driver: ath11k - Qualcomm Technologies 802.11ax chipset support
> >
> > File: ath11k/IPQ6018/hw1.0/board-2.bin
> > ...
> > Version: WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-2
> > Notice: ath11k/IPQ6018/hw1.0/Notice.txt
> 
> We'd have to teach copy-firmware.sh what to do with a "Notice:" key.
> Is there a reason "File:" wouldn't work?  The intention is to install
> the notices alongside the binaries, so that would accomplish it.

Yeah, that sounds reasonable to me. From copying/installing/distribution
view point, these can really be handled in the exact same way as the
actual firmware binaries in practice.

> > In other words, there would be only a single "License:" line and one
> > "Notice:" line for each firmware version? The license itself (i.e.,
> > LICENSE.QualcommAtheros_ath10k) is same for all the versions while the
> > set of notices (i.e., those notice.txt files) can be different based on
> > what is included in the particular build.
> 
> Yes, that would help.  Would you be able to adjust the existing
> entries for ath firmware in the same way?

Yes, I'll work with Kalle to update the existing ath* WLAN cases.

> > > > I'm still working on your other comment about notice.txt, will get back
> > > > on that later.
> >
> > This part about clearly identifying the files should be clear now, but
> > it would be good to resolve that part about the notice.txt files in
> > general before sending out an updated pull request.
> 
> Given these were merged in the past, perhaps I'm being overly
> pedantic.  If we can mark them as Files or Notices instead of
> Licenses, I won't hold it up.  It leaves me slightly confused why
> attribution files need to reference agreements with Qualcomm, splatter
> Confidential and Proprietary throughout the file, and reference
> COPYING and README in reference to GPLv2 when the BSD license was
> clearly chosen.  Perhaps that could be cleaned up in the future.

Thanks. We'll remove most of the unnecessary information from the new
notice.txt files and that should get rid of many of the potentially
confusing parts. If that cleanup leaves something confusing in place,
we are open to cleaning these up further in followup patches, but it
would be nice to be able to get the updated versions into
linux-firmware.git without much more additional delay and yes, this
would be with the File: instead of Licence: entries for the notice.txt
files.

-- 
Jouni Malinen                                            PGP id EFC895FA

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
