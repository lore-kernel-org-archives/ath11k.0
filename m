Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AA3C636CC
	for <ath11k@archiver.kernel.org>; Tue,  7 Feb 2023 11:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnoFDfj88OqTbD9NYvluoKDvl5KiX9A5loP8t2TRxvE=; b=j5CAd+ebu+kfvg
	urGBteGszuaVtIwJOgvJE1B4YA2hkpK8L7y1vRIVQ1a6H29jcJj9wd3Y50YBXTqjruKb3RQ5ZMGlc
	JftGQRUAy7d93Z61KLrS+zINOkOEs88ozM1/WrJKItNtzBVM+ENkqOb7n2tsXH13bvQNeyZQrjkXo
	tOio4Dv5PWRikfy87u2AhP9Oiv1SUcSbueHRJwJTc/9d3D03i4ritnpSR7etxAl24BO88vW+E3Vcp
	kEzt4mWo8zpnZL/e+b8knsPjvTY9f9E5rC4HZknp0xMCo9mmgP4YGcmACgQ6zOMYasgOUjeuljy05
	dOzwBmWc9jYhZP6OoHPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPMKE-00C0Hx-Gi; Tue, 07 Feb 2023 11:39:50 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPMK9-00C0Fg-Kx
	for ath11k@lists.infradead.org; Tue, 07 Feb 2023 11:39:49 +0000
Received: by mail-pf1-x429.google.com with SMTP id ay1so10544619pfb.7
        for <ath11k@lists.infradead.org>; Tue, 07 Feb 2023 03:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=awGdc6vvdnASa9k5c6MAYpBjpVnLRNqpBJbVcDH3NdI=;
        b=WkMT3n0DUzKUATPfbGnq8x00pCbFFpaYL+KFq7R+NnCEpVg/RnC62UgGXebohRt4bK
         iLNDtFZyXpbNYT3/fD4SQkM1gkI8DLNDG9Lw6xUtC4wLncU25IKqcWPqbuhWxn/E8Ktr
         umjvinS0IebV0fpH75vB4MPUGDNIDS/QJBZ8PIIONbeJNUjuWwOQfSm6PAzmkdSdmtNa
         VWc2KwppUr+U/PJWdsnE7nTmzElGN6NXDRi0bBF8Rw98Q9o2QpjusXL6g4iD+++EBlFd
         nuovogDhmS4UnfBc6gBXdNyxB9wJmLH9oKR8PrqrnwRBUg3XoccDEbUajMsfN2Y9ofv5
         D0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awGdc6vvdnASa9k5c6MAYpBjpVnLRNqpBJbVcDH3NdI=;
        b=5IuSTxNCh1G1Rg2xfqbWYMdgzFoG2cVCU1mw1OyQQ9u9j6k1tLNKZ1OKzZSCbpWYFy
         zt7lvdfedFuJdOUn+uhXe43F5Yvz5vl4axDtCrfdeuZfNhXJiwTsm23qFubujbRaQQSD
         mdo0k5myf6MoYSmOkXvpH7fUvaCD146+MmjwzkBUxM0zY+Q1Z83Y8N5MLU5RCskbbLao
         4gqrKV+bnk8upxPwNuHTovkOS3rF0740fXl3WfOnrYaXLhkxGZhwQg1PcyE/vSP0SHlU
         PRgOXAT8jFKpdrAGSVTpACu0qS1Q10yVA86KC+aOgE6mn12z+8BDbOdUpIrXr/J1w6LK
         RiSg==
X-Gm-Message-State: AO0yUKXDHXF3rj4FW6N2i0+Lgg+NdPrzv6prh5y/wIx4k0pYScDFLLNJ
	a0cLBKQZmDk/cJDQrfklG4ImbAYamjrsfjZA96ywlw==
X-Google-Smtp-Source: AK7set86Fg5GskT1uJxQuQ3+VRf1r3gnYlqEdILFoIa4evll1X9oCmtHX8x+0rhvgrGEc/mN5YHWM3AfWKkjzQIF4L0=
X-Received: by 2002:a63:9550:0:b0:4db:99fb:e855 with SMTP id
 t16-20020a639550000000b004db99fbe855mr473871pgn.42.1675769982746; Tue, 07 Feb
 2023 03:39:42 -0800 (PST)
MIME-Version: 1.0
References: <CAOX2RU5ATBuuPewx4DgveKjhc+E1a=Kt2COWDhYqQtLiJ1=NoQ@mail.gmail.com>
 <87o7rvzgpn.fsf@kernel.org> <CAOX2RU6oieaGjpPpYwnMtBk=-nG13=JGW+-+838REQ4HsPcRNg@mail.gmail.com>
In-Reply-To: <CAOX2RU6oieaGjpPpYwnMtBk=-nG13=JGW+-+838REQ4HsPcRNg@mail.gmail.com>
From: Robert Marko <robert.marko@sartura.hr>
Date: Tue, 7 Feb 2023 12:39:31 +0100
Message-ID: <CA+HBbNGCKvP=qTRm32Pkq+CHX5k8BB0qjahX_ppmegNyu_k1Jg@mail.gmail.com>
Subject: Re: regdb.bin availability
To: Robert Marko <robimarko@gmail.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_033945_719566_8DED7C55 
X-CRM114-Status: GOOD (  17.74  )
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

On Thu, Dec 22, 2022 at 5:26 PM Robert Marko <robimarko@gmail.com> wrote:
>
> On Thu, 22 Dec 2022 at 14:54, Kalle Valo <kvalo@kernel.org> wrote:
> >
> > Robert Marko <robimarko@gmail.com> writes:
> >
> > > Would it be possible to make the regdb.bin publicly available?
> > >
> > > Newer FW-s support using it as the external regulatory database and it
> > > would really allow the community running AHB radios to avoid being
> > > stuck with the outdated or even non-existent regulatory data in the
> > > BDF.
> >
> > I thought we were providing that for all hardware, I guess that was
> > missed. Would you mind reporting this to bugzilla? That way it's easier
> > for me to track.
>
> Currently, its available only for WCN6855.
>
> Sure, bug opened:
> https://bugzilla.kernel.org/show_bug.cgi?id=216832

Kalle, can you please look into this?
It's currently completely blocking the community from using 2.7 FW on IPQ8074.

Regards,
Robert
>
> Regards,
> Robert
> >
> > https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport
> >
> > --
> > https://patchwork.kernel.org/project/linux-wireless/list/
> >
> > https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
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
