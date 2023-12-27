Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D0FC46CD4
	for <ath11k@archiver.kernel.org>; Wed, 27 Dec 2023 09:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGFPoeldEJV5i5rBERPRwgepzaxniuwAa0Sr+o1F0NQ=; b=ZXsvc1OhH61SX56bILNh8P/Rzb
	CFkVqmo3No5aJm1KGnqV4oa3noDjhoC+Wp59qqGxDFpLzKcQaeAurvR5AJkzfBjlWOFVqQqwAPEln
	q7AD9ezgjUAoosx4Wv7kLL4CjCqAJkM+9KJXtAqqCnasz+jzSNwxdU53edw8/ettG0g2dee9Gt0Hh
	NFN5el9Fgvh3h/7XhqM6bf22kjWxRvRl0+i4m/cbzM0T9kpNcbBRFTmRmql2V4ZLUuTHdGAqlXdNi
	XYKorBfCne7BRbK/8t1Vbe8TttJC6KXLric3RAFJfujZkOsOGl2C2B/Wu+e1BgWwQSRZXMF5y7snd
	LJ2q28qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIQH5-00EIlP-2i;
	Wed, 27 Dec 2023 09:32:27 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIQH3-00EIl1-2X
	for ath11k@lists.infradead.org;
	Wed, 27 Dec 2023 09:32:27 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-555526a060aso519142a12.1
        for <ath11k@lists.infradead.org>; Wed, 27 Dec 2023 01:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703669543; x=1704274343; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGFPoeldEJV5i5rBERPRwgepzaxniuwAa0Sr+o1F0NQ=;
        b=ONZbOKHfpS2ltUfGYCeK9WnXg2SR+L0Qn4LUqcaWgpXC82lvSwyAps4rHoSN/9zpln
         ZiXcJx29LL3PqjTrxBElTvheDdCeoXPT+DNL0bqgZERSUR9AYEc5Rjhz/mIuJu/K8pVv
         3LvyGxfd6yWRFwIsotsvMHfj01CYqxH4AjfYMzFw+vsa1S8BKoXfzqjEaVFTXb0KM6uz
         AX0oxMykFz9RgddG8hyPTrfspqSrEXX7dsQr0C0egn+2u9xjEAiGy3vUtX1+Dk9ZTfYD
         SlcW0ETUFisIfTO4ISDPgkkzsxG2K/sB9vi6cTL5/O2VTx6U3Fv/vhY6xlqeHvPS0mbn
         uC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703669543; x=1704274343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGFPoeldEJV5i5rBERPRwgepzaxniuwAa0Sr+o1F0NQ=;
        b=KKWal7bocK8dcNywtQ2iJMCoKImb2MGYmZ/jwLH5CyxLJyBosGdgjWSEAeYGrJK7uG
         HHniN6drhU0xvkJ/yWHdkBLI+yuqVo7r9lnSZ5voZC+hgbxFIMzVx0W3VXJwCCSzRpgd
         pqsJsO8aPt/DhuxAQD2i++W4w3uw4lLShZZNMth3aarR4pQqsw1G2X1CGUKMGEhCQVu3
         TtQbWIzxJEldcR3CM174HW+Ue6VqFWbalM8eNQVU+ac4qiFn7bAFs49scdOC6R4904rW
         iCXRcUpWqVlkC9eu+V3P+VTQUCL1EBadVoaW/UVUgdwXodqANfKFfpax9PN8B3LMgiLz
         GPtw==
X-Gm-Message-State: AOJu0YyXuxLWleb8gAQMLre4vz4OGovToHPh9PnVRDhXHmwMmJ3aHqyU
	PPCYVXzoY0k/RdGoQgtHie7bhj66aX+bMp6h/58=
X-Google-Smtp-Source: AGHT+IHp+LCCnPxbrknm3dSJgwKt//0RnW9FuRR1pqlF7qxucMvdxmUPMg5mQhdWH78op1Nr6d0T9HAuYMbJIWxzO8Q=
X-Received: by 2002:a50:f60d:0:b0:555:3700:ad71 with SMTP id
 c13-20020a50f60d000000b005553700ad71mr1116581edn.36.1703669543025; Wed, 27
 Dec 2023 01:32:23 -0800 (PST)
MIME-Version: 1.0
References: <CADS+iDVE8GB_+H+1DAPwcwdpjddUqzsvRmnygtXv7yUxRwLTZQ@mail.gmail.com>
 <87a5qeof5m.fsf@kernel.org> <CADS+iDXNkGWba7cM31CNTeaAJFdr48Zi8HGtYKQutYWiKnxjdA@mail.gmail.com>
 <87o7esn7j2.fsf@kernel.org> <CADS+iDV5eGc6RpWpzPMyO83xmiV1GgbZfqgeLnAukVaPv3BnJw@mail.gmail.com>
In-Reply-To: <CADS+iDV5eGc6RpWpzPMyO83xmiV1GgbZfqgeLnAukVaPv3BnJw@mail.gmail.com>
From: Yaroslav Isakov <yaroslav.isakov@gmail.com>
Date: Wed, 27 Dec 2023 10:32:11 +0100
Message-ID: <CADS+iDX1aU9h_OuR3K+r6hTX+zUrCyN0sG4uzyKm9+tThS9LZw@mail.gmail.com>
Subject: Re: wcn6855 - stuck in 20Mhz on rx, but full 80mhz on tx
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_013225_826576_4D3669CB 
X-CRM114-Status: GOOD (  17.76  )
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

=D1=87=D1=82, 14 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 21:29, Yar=
oslav Isakov <yaroslav.isakov@gmail.com>:
>
> =D1=87=D1=82, 14 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 16:11, K=
alle Valo <kvalo@kernel.org>:
> >
> > Yaroslav Isakov <yaroslav.isakov@gmail.com> writes:
> >
> > > Thank you for answer, unfortunately, I would prefer to stay on
> > > openwrt, until it will be ruled out, that issue is not with my laptop=
.
> >
> > I'm not asking you to switch your firmware, I was merely asking if you
> > had tested this with a stock firmware or not. The more datapoints we
> > have the better chances there are to fix this.
>
> Unfortunately, I did not test it with stock firmware.
>
> >
> > BTW, please don't top post:
> >
> > https://wireless.wiki.kernel.org/en/developers/documentation/submitting=
patches#do_not_top_post_and_edit_your_quotes
>
> Sorry, my bad - this is what Gmail does by default. Thank you for pointin=
g out!
>
> >
> > --
> > https://patchwork.kernel.org/project/linux-wireless/list/
> >
> > https://wireless.wiki.kernel.org/en/developers/documentation/submitting=
patches

Hello!

I debug this issue further, a bit - it seems that it might be a
display issue. I enabled debug for ath11k driver, and it showed me
ath11k_pci 0000:02:00.0: mac peer <peer-address> phymode 11ac-vht80

Also, when testing with iperf3, it showed me 300 mbit/s, and it was
limited by CPU on router (ksoftirqd was 99%), which is much higher
than 150 mbit showed in iw dev wlan0 link

I also tried to use 802.11n on router (HT40), and with such setting,
iw dev wlan0 link showed me 300 mbit, with 40 mhz channel width
(although iperf3 showed 200 mbit) - so, it seems that this issue is
appearing only on VHT.

My phone (Pixel 7) was able to provide me HE, with which I did not
have such issue. I cannot downgrade it to VHT, to test, if the issue
will be reproduced with phone-provided WiFi, too (after disabling
802.11ac in wpa_supplicant, it rejected to find the network)

P.S. I updated firmware for laptop wifi, from
https://github.com/kvalo/ath11k-firmware/tree/master/WCN6855/hw2.0,
but, it did not change anything.

