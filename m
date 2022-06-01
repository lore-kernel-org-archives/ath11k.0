Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0029BC433EF
	for <ath11k@archiver.kernel.org>; Wed,  1 Jun 2022 10:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E8tDyW98Cf+JX+Buc1F7gD87AROzuXhigOJRhtV7Yfk=; b=WrZU+/Py1pEVcl
	KRlpjtKeFp4slu3/5g5AhmeYyyEilctXJnuEo4qynENxWbZjgxPgQn/XxP9orQv5+JKG+BPPsRsh2
	soudJSfPImGHPfwVTuw+QhsOFn9DIsCxiubwgmNjFCKB8g19I9iKsN03CqbWjQjBCo8D/r2r86nHP
	ZF+ZN5WHuZmXQ3JUyPOZmTaLa92tyqyU0dJlcrTStaA9tV1Lt2EC1mXJJwGwPXICK/CeK9Yd5nmIW
	/lazc8W0Rus85hwzy2Bp8ryKtTnsZV3ay8/oA4ikCnNQBRCH4Cnzt91U4gsRI45nuOjVqo4GHfGxm
	7uXwrXwunSB4Id0b9oiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLhZ-00FLpK-Q7; Wed, 01 Jun 2022 10:35:45 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwLgp-00FLUV-Ul
	for ath11k@lists.infradead.org; Wed, 01 Jun 2022 10:35:03 +0000
Received: by mail-qt1-x82d.google.com with SMTP id y15so833691qtx.4
        for <ath11k@lists.infradead.org>; Wed, 01 Jun 2022 03:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AX1aU92WNtfdOkIt5sxzsSkaDvk1+o93dreOm4oGYGk=;
        b=MpHJ6ZZ+VY6LYh2Tbdy+UL75aLbwI+CBqbg8hdrtFQNmpeG9/j1cgb79l8nkNg/oWZ
         S5P00PFcOTyEBHx3245sZsgKdLXx46LI328Xmw8Wc0jbr318yNAwgiRAJjCMuzi9UniD
         ysuUiaiseboWAV3ANBCCwvS2RDvPZqYV3mGkQ4ieNctvI4SBEE0cGuQezTDazDxa9r7n
         jFA9p9yFbLgD6p+PnSB65+clN+etJVe7BZTN4yDoJK6efgqPUqc396RNFmr8hX7njBJQ
         nSxYfFfx4+WTyDERQrLw96Ez4crrUu/2IyekAhWxd7nPB545KMGy8oqheoTF/h/OUQJ8
         T+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AX1aU92WNtfdOkIt5sxzsSkaDvk1+o93dreOm4oGYGk=;
        b=OGvKEjVtK1CVhkuy+W2vOrvTEbgGRq/mT+RkNklBMxQrW5hLhfaQuuGypMW2d606P1
         oDR6J8G8Em38o6EhS2AP6P3NPrB+N4ZhSuy1BXVXI0avExxhinsochEbD8GeF3g2Yn7T
         0Q5ijf2prdskNbDPKH6xG3X6wevdd/yCB6g7+hAZ6GduZJSlansm0W0sAlCQhnwmoh+L
         G/l2y4Da7q8EbK0s7nnxgzRaSQgvV59xxTzdcuq9e9qMH3nLpjpgfautJHLGuc6KAOH6
         3tGJti4Yb7ndjzYqCLl8UXdI00LdU3OhJMPSR3a6B2aW5iOhSihaJRwBGZs0/6LCNbIF
         ualw==
X-Gm-Message-State: AOAM530AQRTzkzzMzjMrel0xijSUprAK448/q4JPuG+lQi5iOIFdhr2U
	XXAI/bEkGipr5dakSU0p0pvSwEevk5oBw0r7kFtoqg==
X-Google-Smtp-Source: ABdhPJyxtzlXZmOy66yFMqw6hawHCM74kzO8BgZgrPRFgx/TQPeT2PGwJX08xXjicyp+Dem9JsTuXFxZ0el5Ho78CrA=
X-Received: by 2002:ac8:5990:0:b0:304:c8d6:3147 with SMTP id
 e16-20020ac85990000000b00304c8d63147mr419347qte.370.1654079696073; Wed, 01
 Jun 2022 03:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR02MB4567E377F14F272DFF48907A92FA9@BYAPR02MB4567.namprd02.prod.outlook.com>
 <332e62e5-b04d-3a6a-38fe-924d056bf0f8@linaro.org> <87k0b8fnpj.fsf@kernel.org>
 <CAA8EJpr3Uxa-Tif5TyHfXL03j1--vrAb+DgT=0DY8KDpvHPjeQ@mail.gmail.com> <87r148opbm.fsf@kernel.org>
In-Reply-To: <87r148opbm.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 1 Jun 2022 13:34:44 +0300
Message-ID: <CAA8EJpqj57v6yetGLHHi-xZocsGfAyPfdHZFV4wZ+Cpz2XaRvg@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20220423
To: Kalle Valo <kvalo@kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
	"ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, 
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_033500_053567_9380F9A1 
X-CRM114-Status: GOOD (  19.80  )
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

On Wed, 1 Jun 2022 at 09:44, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > On Fri, 29 Apr 2022 at 08:44, Kalle Valo <kvalo@kernel.org> wrote:
> >>
> >> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> >>
> >> > Hi Kalle,
> >> >
> >> > On 27/04/2022 11:32, Kalle Valo wrote:
> >> >> Add support for QCN9074 and WCN6750 ath11k hardware families. Also
> >> >> there are several updates to existing firmwares and board files for both ath10k
> >> >> and ath11k.
> >> >>
> >> >> Please let me know if there are any problems.
> >> >
> >> > I noticed that this pull request doesn't include the board file for
> >> > WCN3990. Is there any issue with it that we can solve on our side?
> >>
> >> Oh, sorry about that. I guess this is just a bug in my scripts, I'll
> >> include the wcn3990 board file in the next pull request.
> >
> > Thank you! No problem, it was more of a question if we missed something.
>
> It was pulled now:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=86f0c5642c4c06583fccce8e03ca400300330cba
>
> Do let me know if there's anything missing or wrong.

The board file looks fine to me. Thanks a lot!

-- 
With best wishes
Dmitry

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
