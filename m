Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76B8C4332F
	for <ath11k@archiver.kernel.org>; Fri,  9 Dec 2022 11:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOwwD6hdQyemdGrtQ3+ODQDczlSrtHbwEM3fcfD4lTI=; b=q3aUCXQIbq2Gq5
	JEbzO22RVWhGbSKeVvrXpLjZjDhIlKbtCY+SkGbYh6x71S0nxIV6XDiub/UxfDJ5vCqshnuTmXfdr
	wCxBcSj7Y+Y3l/wR9jUVqTc1d9R8un46paEiH4qhZxZ2jBXu5pMRXu5lktoeL/cvw+wIngxHkLQKd
	i37SneWdUf2Z1Is/BtT4Hmr5knVbt0uTJ9DEmwGrBUEYg4oxeIaBZ6Un3FQv0nHLt/j1vuWbnUuJv
	b5Qxa2PGVFMbeXzIKmRiui9Bq7KfxtD8kqY/ZJEqbOHlnjwaUYdJtZNzGiuX1c5TwIfR1GFnD7O+p
	FowQxE2O6CxWfdq2IhlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3bfN-0079r3-4i; Fri, 09 Dec 2022 11:35:45 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3bfK-0079mz-4v
	for ath11k@lists.infradead.org; Fri, 09 Dec 2022 11:35:43 +0000
Received: by mail-pj1-x1029.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so7814739pje.5
        for <ath11k@lists.infradead.org>; Fri, 09 Dec 2022 03:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mzg8lYqW6VRWsnakITVoj+GziAx50d6fMFJrXXU3zAo=;
        b=BtICw9wqXghzHB8cOJPgNOAeso8hfOfLsHoyUdz8gx58FNQn1+3aeEcN/0tmtVcv9K
         gG1eYdeiUeBtK6m/4o0VabCUNUgHcUx7noAiGP05b0aKb7vQmTRSEKoRpoZ4Z85Nd11l
         IwsfN5sSScO4np3E3UAqh+ObsmCoe+VEvPUd4whqiuVRR9REgVN0ADfSnfR8yP0wtBpM
         NNjmQiy1cH8/I4suTuvHNtiNBCwX0V8GYXRAo9UkRTZ0CmSYH0DE4uTpQHlswl91vfBm
         44pCA4/PLf1ZESx3VKGyo45G32pXDAPnrKomLGBhouW028h51rqEE6Ysig4nfpdLAIWF
         z9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mzg8lYqW6VRWsnakITVoj+GziAx50d6fMFJrXXU3zAo=;
        b=Xh+FUkJy9ut5zug3l/ioGCer/lHAxgpbF/jr2nsuYMXgIEMN1/ES2D8XjvgkCf85u9
         7go/4vJBq9DyCbJniyZJha0rcCXvVLUTdsWIXYLRVPHR6oVHhGZc+RJ2JdPlm663evxC
         fI/a0L2RtmTRLS8gZ84+jS82q3B25Ip3uCv8y9qFGzajubG8kP2ELchIpp+7mEixkDQT
         I6QIagf24cx2JxY0+gATRTqevqDn3sCmxYF5maLarCsSxytYM98aqFBZUVKfRScK2X3d
         zIfV4JbG//YMQQqg28LwvHUNvYs/yCmo6EKWBmB35P8msiA6h5E1bKAZ0YxPbh0/P/7u
         9peQ==
X-Gm-Message-State: ANoB5plT7MBLrO+ePUcE5fiLoI3LYdRkGLw06d/S7+WEGOmJ/YDB0WNT
	U2zVzdaOZhJVtIpI2n8+dmFpVKeQqGjXArjOwXqpbnDbtFmjDYBy
X-Google-Smtp-Source: AA0mqf5RpYMRMASAza7+6Ajtg9nRn6kTRNNAOfMXOvyzePjXsm9EOuImvNcFsdkKd6g7kGrgQjSzyH5FTstwY5qHlMg=
X-Received: by 2002:a17:902:70c8:b0:189:d37f:d97 with SMTP id
 l8-20020a17090270c800b00189d37f0d97mr19471253plt.72.1670585738287; Fri, 09
 Dec 2022 03:35:38 -0800 (PST)
MIME-Version: 1.0
References: <CACDmYyc7G=pv5gBpwxm=tYChnbnmtTV990aEDCieLeKvwr=pOg@mail.gmail.com>
 <878rjj2ww9.fsf@kernel.org> <CA+HBbNF4MrEKjG=cVmu0d6UyO6NDyw=cVoG93hrkxVKQLF1h+w@mail.gmail.com>
 <874ju72w7g.fsf@kernel.org> <CA+HBbNHQvgt+_ihFST=ZPeuxjRzovL71oKgbP2X5B8a6ZBq0HA@mail.gmail.com>
 <87pmct214x.fsf@kernel.org>
In-Reply-To: <87pmct214x.fsf@kernel.org>
From: Robert Marko <robert.marko@sartura.hr>
Date: Fri, 9 Dec 2022 12:35:27 +0100
Message-ID: <CA+HBbNFHdME47FT2-_pMvo8W3-2y79d_0YdvM7ADq1ofBtzmjQ@mail.gmail.com>
Subject: Re: wifi: ath11k: ipq6018 monitor mode is not working properly
To: Kalle Valo <kvalo@kernel.org>
Cc: Legale Legage <legale.legale@gmail.com>, ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_033542_225299_D25B892B 
X-CRM114-Status: GOOD (  41.51  )
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

On Thu, Dec 8, 2022 at 7:36 PM Kalle Valo <kvalo@kernel.org> wrote:
>
> Robert Marko <robert.marko@sartura.hr> writes:
>
> > On Wed, Dec 7, 2022 at 2:13 PM Kalle Valo <kvalo@kernel.org> wrote:
> >> Robert Marko <robert.marko@sartura.hr> writes:
> >>
> >> > The issue with mainline kernels is that there is no remoteproc support
> >> > for IPQ8074 nor IPQ6018, I have been working towards getting the
> >> > IPQ8074 and its working with remoteproc patches added but the
> >> > situation is not ideal as for example coldboot calibration does not
> >> > work which could be a bug in the remoteproc patches I am using.
> >>
> >> Nice, do you have the patches available somewhere? What distro are you
> >> using?
> >
> > Yes, they are available on my GitHub kernel repo under the
> > ipq807x-next branches:
> > https://github.com/robimarko/linux.git
>
> Thanks, I will take a look.
>
> > I am testing the next based branches with Buildroot as its quick and
> > easy as I regularly update on newer next as I am upstreaming and stuff
> > is getting merged. A lot of stuff got merged so the SoC is in a way,
> > way better shape than a year or two ago but we are still missing
> > upstream remoteproc support as well as CPR support and there is no
> > offloading obviously.
>
> Great that you brought this up. I have been thinking how could I do easy
> and quickly do some smoke testing on IPQ8074 using latest ath11k from my
> ath.git master branch and latest firmware from ath11k-firmware.git.
> Currently I'm only testing PCI devices, so quite limited testing.
>
> What you are using sounds like just what I would need as well :) Would
> you happen to have any notes, pointers etc how to get started with that?
> Unfortunately I can't use much time for this, so the simpler the
> instructions are the better. I haven't used Buildroot for years.

I made a BSP "layer" for IPQ8074 under Buildroot:
https://github.com/robimarko/buildroot-external-ipq807x.git

It allowed me to easily update through Buildroot versions and provide the
development packages I need.

So, you can easily use the defconfig like.
make BR2_EXTERNAL=../buildroot-external-ipq807x/ ipq807x_defconfig

And then modify the BSP layer for any board and include new packages with
menuconfig.

Do note that you need to add the DTS for new boards obviously.

BTW, I currently have to revert SCM/MDT loader changes cause I found out that
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20221208&id=3a99f121fe0bfa4b65ff74d9e980018caf54c2d4
broke remoteproc on IPQ8074 as now it fails on qcom_scm_pas_auth_and_reset()
and I have not found out why exactly.

>
> > I am also maintaining an OpenWrt ipq807x target that is based on 5.15
> > and 6.1 backports for which I plan to make a PR to get it officially
> > included once 6.1 backports are merged. This is what a lot of users
> > are currently using as it's gotten into quite a good state.
>
> Excellent, looking forward to that.
>
> > The one thing that has been bothering is move to FW 2.7 which is not
> > working on a number of routers as their BDF-s were generated for way
> > older BDF as well as outdated regulatory information.
>
> The board files are always a major problem. But can you tell more about
> this? Are you saying that firmware branches 2.5.0.1 [1] and 2.7.0.1 [2]
> are using different board file formats?

No, they are using the same format, but it looks like some defaults
for BDF fields
that did not exist when the vendor was generating the BDF break certain boards
or the vendor did not include regulatory DB in the BDF and currently,
QCA does not
have the regdb.bin for IPQ8074 publicly available at all so on those
devices you are
stuck with the firmware fallback of WORLD regulatory.

2.7 FW is breaking most of the boards, only the ones where
vendor-generated the BDF
against newer SPF releases it kind of works but regulatory info is
still way outdated,
however Xiaomi AX6 is completely broken, remoteproc will just crash,
so far we narrowed
it is down to it being the only device using QFP4550 FEM and BDF has
some config specific for
it.

QCA removed the firmware regulatory fallback so now if your BDF
doesn't have regulatory embedded
or it just doesn't have the regDB version field set remoteproc will
crash without an external regdb.bin
which is not public.
So, we currently cannot use 2.7 FW at all which has a lot of issues
that 2.5 FW has fixed.

I am happy to share more details, we have quite a lively community
using these devices currently.

Regards,
Robert
>
> [1] https://github.com/kvalo/ath11k-firmware/tree/master/IPQ8074/hw2.0/2.5.0.1
>
> [2] https://github.com/kvalo/ath11k-firmware/tree/master/IPQ8074/hw2.0/2.7.0.1
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches



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
