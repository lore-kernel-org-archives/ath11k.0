Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4ACCC4332F
	for <ath11k@archiver.kernel.org>; Wed, 14 Dec 2022 12:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WxJ2TtpkEjwm5jSWMmbBp7cxVwr4RFkPJj7IrcJothU=; b=EqGKVc4nx44Bor
	0znUOP1iP7TZtNlsF+t8jMPtW4lg3FzA3frqL83tj1x/cbS7E4rzdaim5TUImoNDKdd9Iu8n3SP/X
	zTCg7Ep7EjVcGG3p+Nl3ZSU3qIHB8QKt21DiBne3NHc0+AT6mcpDp4qd+7eDTEEhhwyjIew1DV5oN
	HkLL03mS84vA34nni/YSsPZijuNzZ1Q84f9Qf6+Kom38as5ONoWUeioHnofvOsPMAZ4k/0NDNnYtn
	95jCnFLQkakItlPTL+nzmrDo4YPFxs4N1Bq0OsGj5aoW7c/SvQ96XhEzmQWVXTtZrWkyscNV4kK61
	IQZl6F5Py1nQRAj/q43w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5QTX-00GA3g-5L; Wed, 14 Dec 2022 12:03:03 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5QTU-00G9x5-2K
	for ath11k@lists.infradead.org; Wed, 14 Dec 2022 12:03:01 +0000
Received: by mail-pf1-x42c.google.com with SMTP id g1so4287370pfk.2
        for <ath11k@lists.infradead.org>; Wed, 14 Dec 2022 04:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=peaw+2jBoexT/V/OL/klaMSfRkpK0w1QubB8hlHtjKU=;
        b=IffZpvmos6IFA8F2Mu7UX03vFoZdzSvAl4wArexI2TJ+mCg8LYPObJ0caqqBk6KELc
         7e96IX0TGhm3EbfxrnJUHspRY4C5kzZjXA8RPZhE2bOdCe6tjVnt+Z3CF0kf/nY0nL+5
         zhLxH/gVF/oPszrMxuCbjkfNqT6s3OZYE50HYnrLZ7oMjvbFnJ2FU0kVIkcZhH46wiwl
         wLPAdUYt+VKJPhUoSBgt566qcUxTJYhAUxZrXrKHxPKFY8264tYoNHL+XtQdD6DjNdwK
         dtgAPPBovln+d78d738YPXAKKoU4rCSJQNQzmoESEN0DTVhkyEgeq7ajtPDj3m1qgn+h
         UaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=peaw+2jBoexT/V/OL/klaMSfRkpK0w1QubB8hlHtjKU=;
        b=DD2ho389pgT+IsxuAq9Umx8wSqnL2LhWNW/O0uivOs/oLOFoui0JmBrpY/AkiY3l+0
         yxu4fuK94v4203UKmIMCIXHoPU7oKBKtdQK5+lRs1ts10l9ThIy8ixaZZX4IUkzu5DGM
         mNtdgoKdka6xtMD/0+cN6rNw/Pa/FCS+clDiby6k4DT028+WwXES762PEddoTQE2XJXv
         u29jVYu/Oc/9gZzWw2evjxQm9T0xkUubPhaah2TldddS2tYX9/RuSM219MnwRYFni5FV
         CjPAWEWGvHGxchaD2UltHw+isNTtAAQxhonWsv/sg15NSuVXZgRQnwMIKxL36v5gpBEv
         hJCw==
X-Gm-Message-State: ANoB5pk8+p5yMk4IBHzsv8WJlgE9EpiH5uoR12HlHLZbxf4gQkuKTov3
	3Apau6tsHldSlXT3mFIEEDX6v4x2+03l91BB5eGrbQ==
X-Google-Smtp-Source: AA0mqf6ACT1hXHaNkKcTvIqqDuxXiD+Qw3prO4hyGi38uOl9IwijS+lvf8GiQLNL3EwGrPbufcxLrNNbvCYdwt6fqnk=
X-Received: by 2002:a62:8409:0:b0:575:1168:a970 with SMTP id
 k9-20020a628409000000b005751168a970mr54638196pfd.54.1671019373770; Wed, 14
 Dec 2022 04:02:53 -0800 (PST)
MIME-Version: 1.0
References: <20221105194943.826847-1-robimarko@gmail.com> <20221105194943.826847-2-robimarko@gmail.com>
 <20221107174727.GA7535@thinkpad> <87cz9xcqbd.fsf@kernel.org> <877czn8c2n.fsf@kernel.org>
In-Reply-To: <877czn8c2n.fsf@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Wed, 14 Dec 2022 13:02:42 +0100
Message-ID: <CA+HBbNFCFtJwzN=6SCsWnDmAjPkmxE4guH1RrLc+-HByLcVVXA@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: ath11k: use unique QRTR instance ID
To: Kalle Valo <kvalo@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Robert Marko <robimarko@gmail.com>, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	gregkh@linuxfoundation.org, elder@linaro.org, hemantk@codeaurora.org, 
	quic_jhugo@quicinc.com, quic_qianyu@quicinc.com, bbhatt@codeaurora.org, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, ansuelsmth@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_040300_138836_6BDF2F89 
X-CRM114-Status: GOOD (  28.44  )
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

On Tue, Nov 22, 2022 at 12:26 PM Kalle Valo <kvalo@kernel.org> wrote:
>
> Kalle Valo <kvalo@kernel.org> writes:
>
> > Manivannan Sadhasivam <mani@kernel.org> writes:
> >
> >> On Sat, Nov 05, 2022 at 08:49:43PM +0100, Robert Marko wrote:
> >>> Currently, trying to use AHB + PCI/MHI cards or multiple PCI/MHI cards
> >>> will cause a clash in the QRTR instance node ID and prevent the driver
> >>> from talking via QMI to the card and thus initializing it with:
> >>> [    9.836329] ath11k c000000.wifi: host capability request failed: 1 90
> >>> [    9.842047] ath11k c000000.wifi: failed to send qmi host cap: -22
> >>>
> >>
> >> There is still an outstanding issue where you cannot connect two WLAN modules
> >> with same node id.
> >>
> >>> So, in order to allow for this combination of cards, especially AHB + PCI
> >>> cards like IPQ8074 + QCN9074 (Used by me and tested on) set the desired
> >>> QRTR instance ID offset by calculating a unique one based on PCI domain
> >>> and bus ID-s and writing it to bits 7-0 of BHI_ERRDBG2 MHI register by
> >>> using the SBL state callback that is added as part of the series.
> >>> We also have to make sure that new QRTR offset is added on top of the
> >>> default QRTR instance ID-s that are currently used in the driver.
> >>>
> >>
> >> Register BHI_ERRDBG2 is listed as Read only from Host as per the BHI spec.
> >> So I'm not sure if this solution is going to work on all ath11k supported
> >> chipsets.
> >>
> >> Kalle, can you confirm?
> >
> > I can't look at this in detail right now, but hopefully in few days.
> > I'll get back to you.
>
> The solution we have been thinking internally would not use
> MHI_CB_EE_SBL_MODE at all, it's not clear for me yet why the mode was
> not needed in our solution. Maybe there are firmware modifications? I
> think it's best that we submit our proposal as well, then we can then
> compare implementations and see what is the best course of action.

Kalle, any ETA when you will post your idea?
I am constantly hitting this crazy limitation and my idea does not work on cards
like QCA6390 so it's not a viable workaround at all.

Regards,
Robert
>
> But it looks that not all ath11k hardware and firmware releases support
> this feature, we would need meta data information from the firmware to
> detect it. I am working on adding firmware meta data support[1] to
> ath11k, will post patches for that "soon".
>
> [1] similar to firmware-N.bin support ath10k has
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
>
> --
> ath11k mailing list
> ath11k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath11k



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
