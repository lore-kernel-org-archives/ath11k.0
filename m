Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E951AD5B870
	for <ath11k@archiver.kernel.org>; Tue, 29 Oct 2024 03:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBfFGJMsVjfPvoFpdWSsuaLfc0Q9vD4A1u3MqdAmId8=; b=3c/Tstx2j0BxIyX4K5dS8ydhT9
	Qv4ePtNAUo7oKuPkTDE4SiRtNFq2ewXlKz+CJEMvF4wGZ8zc+3H8Cp9KoaF1hjYLbeFXgkhe3jQPH
	PfZvVY9SYvapUovRkjfKq+2oAovywduNZBw41JuAeVtX7tMZOv3tsATQka+BE9qX1bU815QRHpX+G
	F18hII3KIMdmIY5FMwkyzkNOKxtH6qudMqbksY5j+8QHgTF5Pp7HI7xV9QBb0RaqlcMUBPP2rq7Ue
	Si9ldY5O8rHA/bFrBEluvUy66WR+4k2IfAqSPFc88ZXpcXhKs3D/Eff1PiMT4PNceWl4xNpele+Zd
	Q2oRPX3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5d7F-0000000D6y8-106A;
	Tue, 29 Oct 2024 03:41:57 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5d7B-0000000D6xK-3HUy
	for ath11k@lists.infradead.org;
	Tue, 29 Oct 2024 03:41:55 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6cbcc2bd800so45194086d6.0
        for <ath11k@lists.infradead.org>; Mon, 28 Oct 2024 20:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730173312; x=1730778112; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBfFGJMsVjfPvoFpdWSsuaLfc0Q9vD4A1u3MqdAmId8=;
        b=VqMUH15emD3Q/uibCbjXYHJxmXYJiBkZ0zo2BIVaRB4Q0kLhGSNL2e397pQS2NIxsW
         B04ewNDLu7IwilPgnqAYOR2bLcGSPiSOlHG8ZhyfdckaPx3QQCBZbiFKX0Lsq9dsyoNB
         vUJLf1AyvQo/GFOTJFN3oSA0ZL8J53pcg1njSjMT2xB5k7FFi6gmdHsvDOzeOEwT2c8I
         ffphBHeaNLUzhTDbHW/B8JUB9vQxYSh9rQYYH/bX6viY7ISuNGel8bX3kufo/E/VVi2P
         dPLEPmvCE1QPPZ3xCTD+MQiBumxkbUcGiZ//HPkyX4myHs9zVexweR+2zOIXe4Tdv+cD
         01Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730173312; x=1730778112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBfFGJMsVjfPvoFpdWSsuaLfc0Q9vD4A1u3MqdAmId8=;
        b=nnLanY4fhyQhNxro2Ie87UdWdNh+F4BQ54FTQBHQvMN4pQTSe07CALQyB3YJDKmzwD
         UVFyR29o7XbyR2nYcmTyHG53Kp8OSGtzDNtdePzdWDsndPlgEGqitiusqSNZ/8hNIXu9
         vG1QOPCVUyYNC8U7PwtkaIKxPs0eFthW8W5N5gV7tgPGEa74mVikM8fJTV792QA3PZQl
         fWVwVRLaeMHbHVnC1N3fIHrKY2KDVoBh0xzgKgUqdL6viNnnKSjx5ZS0NuPWnWm9ei3n
         POrWqMa56m3qDSx6vQAOKpT6HcWmfL2AYKko7v9UbjFkcw53/YYpBnZtN82iruIqHa5b
         VBRA==
X-Forwarded-Encrypted: i=1; AJvYcCXRFhImYjdCxPvJ46IdQ9lL66jZQBRZy0nV5LbSedE0qoKTnddH5L31BMpBuwVHwuViJD4HCcY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzkEz5+B7xrcEfP5Bnto/Rtd5ZivpyEgYTlTuOnNQaKUuuEK5sU
	u3U7jVdDSRt5hy09zzt1GAS7yyxr04inFyHBlOGfwoglAeHh19Gbe3pq/yZsrS+AwRz8Xjuk4lH
	vyRIY5JbLL0LFvYo48qJ3+WmwnNc=
X-Google-Smtp-Source: AGHT+IHlI6ic5+01DV2onimsBwZ66nvHEC6/lv3DtvmwpAC/1xXkqiCP2cH9Y4lhWd/7b7QShnSJMIyoGj7Aw6U0ZuM=
X-Received: by 2002:a05:6214:4508:b0:6cb:f077:f2f7 with SMTP id
 6a1803df08f44-6d2f63df3d5mr8946856d6.25.1730173311971; Mon, 28 Oct 2024
 20:41:51 -0700 (PDT)
MIME-Version: 1.0
References: <20241025064235.382-1-thunder.leizhen@huawei.com>
 <87v7xcgwb0.fsf@kernel.org> <ff8c3443-3651-480e-956e-81c7d592099d@quicinc.com>
In-Reply-To: <ff8c3443-3651-480e-956e-81c7d592099d@quicinc.com>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Tue, 29 Oct 2024 14:41:40 +1100
Message-ID: <CAGRGNgUmdKfWxOSPyj9Ofk8ULyPX0j61Qnrd_ckLAy-a0RhdKg@mail.gmail.com>
Subject: Re: [PATCH v2] ath11k: remove error checking for debugfs_create_file()
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, Zhen Lei <thunder.leizhen@huawei.com>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_204153_842719_4DD94CBE 
X-CRM114-Status: GOOD (  20.91  )
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

Hi Jeff,

On Tue, Oct 29, 2024 at 1:37=E2=80=AFAM Jeff Johnson <quic_jjohnson@quicinc=
.com> wrote:
>
> On 10/28/2024 7:02 AM, Kalle Valo wrote:
> > Zhen Lei <thunder.leizhen@huawei.com> writes:
> >
> >> Driver ath11k can work fine even if the debugfs files fail to be creat=
ed.
> >> Therefore, the return value check of debugfs_create_file() should be
> >> ignored, as it says.
> >>
> >> Suggested-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> >> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> >
> > Are you just guessing or did you confirm on a real device that ath11k
> > spectral really works without debugfs?
>
> The debugfs_create_file() documentation tells us:
>  * NOTE: it's expected that most callers should _ignore_ the errors retur=
ned
>  * by this function. Other debugfs functions handle the fact that the "de=
ntry"
>  * passed to them could be an error and they don't crash in that case.
>  * Drivers should generally work fine even if debugfs fails to init anywa=
y.
>
> The caveat is that any driver functionality that relies upon debugfs obvi=
ously
> won't work if the underlying file isn't created. Hence the language that =
the
> driver "should generally work fine" since all functionality that isn't ti=
ed to
> debugfs will still be available.

The big question for me is this:

> Since the relayfs functionality that spectral scan uses is dependent upon
> debugfs

Why?

This seems to go against the general guidance that debugfs should
essentially be "fire and forget" and return values shouldn't be
checked.

IMHO it comes down to one of two outcomes here:

1. Spectral scan isn't necessary for normal operation so we shouldn't
initialise that functionality if we can't use debugfs, which violates
the "don't check return values" guidance
2. We should break that dependency

I can envisage a lot of people making the sensible assumption that a
non-debug kernel doesn't need debugfs and therefore disabling it on
their thing, but also it seems to be enabled everywhere I have access
to: Debian Stable, WSL and Bazzite. So I could be completely missing
the point here.

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/

