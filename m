Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9F2C54FDF
	for <ath11k@archiver.kernel.org>; Thu, 30 Jul 2026 07:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCHJEQTS2go+xdAjlsFW/vaUrtHdmk1rhiv3rFQeuCA=; b=UG5aOKuswwhK6PzklVTLRhhn1o
	j3nXWokFkHerBZF+dqZqc+pcaztBBBhCtMq1no+MW8q9oCcU16H22D5OLCRJJe+Qtlt7XYeUu5itM
	54l24b27yMWXSXf4L84Qfe1h4v3fOIipqlBDgK9/xAB9LkVJDk2x4D0Jx8xa8ymYJMFoolkxlWSBK
	26+SRTVxYDBJx7s2BS1kM6ECUJBsZ9n7g2vrZvz/bpSaFOcQnGfDex+ljPD/KrH/1xTMtP/AM4b9C
	JWTLvql1Kxg4pvEIYZwbZ4MqgrrgnUZqCdA/UMqkOV83Ihpzn2xyjVYClfUSiWrj+eh2C84bf30+o
	a0ReCKfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLKj-00000009l43-3o8A;
	Thu, 30 Jul 2026 07:37:37 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLKh-00000009l2Y-3Xm7
	for ath11k@lists.infradead.org;
	Thu, 30 Jul 2026 07:37:36 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-4720f3bf164so244482f8f.1
        for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 00:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785397053; x=1786001853; darn=lists.infradead.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HCHJEQTS2go+xdAjlsFW/vaUrtHdmk1rhiv3rFQeuCA=;
        b=eHTto3bNIKlcPiMIcY/1OcF98KERi2H120MpkOIZgbTGu30S0X5Ph/UwtgqMlyFUDe
         MbaqRvE7/0l5TlW3Ju1DFF4H4k5rUXolLoj4Qjm/e5ALr5vHSM92cCRIOKSwNnS4Ee60
         y9q8DBVPCz63P8SBk5FaPYcyOLpjTzE49byGDM2VvAe/X0ioLZrFQFxrdPP7blnLyVNF
         WmmxRnem1SImhKaGsbOcT0VCdaslbiRPAvv3SZD9TeU/dB9Dy1DfkbTXQknVI4kTY4fJ
         uCG/NoRIvpf7ZqOYIicBzjkzQpggpcEwlpmDK+fb/cvQR4323g1f6Xi7gBCFdXPc5/RT
         KaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785397053; x=1786001853;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HCHJEQTS2go+xdAjlsFW/vaUrtHdmk1rhiv3rFQeuCA=;
        b=JME1Gy3SZWhS43MG4Z+Nzodn7Okt2lHi0HQJxNt3v41DiUawk0UJB055tgTDEihpIP
         3CIlc6zJxg+0qfG0yW8vuNItPkvc9svIP6OPNbTls/BoVwopIAIXbCIyGtA+difASfui
         KloYxzU/hV+M9S4m8KJmItGpQziUF5FbdbM5+6lSrNlbfV01313MSZTFMQla6F4IveBF
         AM2cp6E55+zyjnPE2dalf0sDgb6qo+QT9RMni0MoEn8veaAJK6LOtAetzAPDD4Ss9ww/
         D77eN5M7xQ4LJkwWGggkJum/VqyPPWjJmQm0iDwz3kKj0ENB6vdcP9KlSgF+qPKJJBMa
         1wKg==
X-Forwarded-Encrypted: i=1; AHgh+Rrd6rgKfMh4Js7p+S8NRjwCgCaThzOcL1cwQz58NtPozvheiQd77Qk5HQa6silkT0HnQCxzcp8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9KJdGlol6HwjP7g3f68oA8n6/3s7elm/1sdNEG+V99PuSlVZ2
	kuEXbGpBZAnAIttzi5d+0pCiAdX0adKwWodFcXFJ0Cs6NQ5z7ojir26s
X-Gm-Gg: AR+sD13kdcyEHuU1jwYoFiMf5qKut+QXxI69msyP4JQKHFrCPQpqR48G5Go1W9dkSlN
	ELB/di4xJCFW2C0x88LUw/3jkF2seiMUlofkVynMoO9rX3842mBrv7xY/Z9Hb6Xc+53hvgIngRI
	Y/vOOuhd2qa1YLfGEkHcvTkaP+nZQVwn/TAs/m2FX8/wihU28vkVm7jykTT47ejAZ3erE27Z70n
	vZ++cKb/z7kNKvFzSVoXxXH99zydJAkTv3GvJVx4CDCBVP0HGamVgIYHRx0PsXpANDhkZy1JVJx
	H4VujpCc6IeM4U771jAoQj+zQXr+vPrkHTO3DHWz66WigKjacBxEjcRmjZV+yPnOSKR4vHN+Mqe
	ZIas4A5aoZ1bUDwLnvbDGG0Iw3wmI8xsaAOfxJuJnpx3udChGdYpDurHs6bGFFisCa2xVfIUg37
	Z1kKba1yPSqIbwtsAd5Gqt+0UKK8zneUbKIpgtoQ6I82rnX9lbTOa5CqCbHFyuLeInrRTNP68nq
	yt26v0=
X-Received: by 2002:a5d:588a:0:b0:47f:8603:a879 with SMTP id ffacd0b85a97d-47fc8bdca86mr1528752f8f.11.1785397053158;
        Thu, 30 Jul 2026 00:37:33 -0700 (PDT)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc8941e7asm3419194f8f.36.2026.07.30.00.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 00:37:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Jul 2026 09:37:32 +0200
Message-Id: <DKBQFMYL5NRQ.1B2HU7KN1QBXP@gmail.com>
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>,
 <ath11k@lists.infradead.org>
Subject: Re: [PATCH ath-current] wifi: ath11k: reset ar->num_station on
 hardware start
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260729090347.3488257-1-nico.escande@gmail.com>
 <592c0749-c3f9-4156-9624-edfa360cf53b@oss.qualcomm.com>
In-Reply-To: <592c0749-c3f9-4156-9624-edfa360cf53b@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_003735_894102_1F73DF6E 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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

On Wed Jul 29, 2026 at 8:16 PM CEST, Jeff Johnson wrote:
> On 7/29/2026 2:03 AM, Nicolas Escande wrote:
> ...snip...> ---
>>  Sent by mistake to ath12k list, sorry for the noise
>
> you failed to send to linux-wireless so this isn't being tracked in patch=
work
>
> please resend, making sure to get all the required recipients from
> get_maintainer.pl

Yes I wrongly sent both of them to linux-wireless + ath12k instead of ath11=
k.
So I reposted them only to ath11k to correct my mistake without spamming
linux-wireless. I added a note but this was not ideal to be sure.

I'll repost a v2 of them both to the right lists. Sorry for the noise.
 =20

