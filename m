Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177F5D60D0A
	for <ath11k@archiver.kernel.org>; Tue, 19 Nov 2024 01:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TLGZPhgwiSdTuoKO9EIOhX+7x+wgHfPfCEdlENWql4=; b=z1+s8XF7nsXWT0c3rQPhBy7d+v
	jdV3cZYq1eKPVvWoVdpKZ7JSE9MHuGHQsY1PsrtI7bl1zTWngqv47Ir1S+n7pVH6lnBeFwhbqqbrj
	HCRyUEfm1A0si0n8fmK7RG87NbbVVZYVTwUED5hd2QcTfWUHk1wrcozKXZ39pF0rLWTOYkz43Rp5m
	ZQSZ6LIeOdKPmi96lw8e2CGgiXtRm4AHu7VoUK7yfsKJxsYETU0rsZi1ler2n0E8uqGyzSdggjuM4
	vHNoMYQ8DWvsnnFj4ac9VT/JOa5bgM5jAD1utZQ4kPoFoHMFGRxPs3WWNRQtVHlzlbwI56TvMGtAW
	MWd7Hv+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDDHs-0000000B5ok-4BIV;
	Tue, 19 Nov 2024 01:44:17 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDDHq-0000000B5o7-3ZGp;
	Tue, 19 Nov 2024 01:44:16 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20cf6eea3c0so3660465ad.0;
        Mon, 18 Nov 2024 17:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731980653; x=1732585453; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TLGZPhgwiSdTuoKO9EIOhX+7x+wgHfPfCEdlENWql4=;
        b=jRDQAWeUjU1vK/lG4atcQXKqF7IV9c2LLRiRPvnhyjb8V8ibc+nhH21et5g1k8Fn1c
         YJnvRGsjIXGHoZXGsmSTxxO5DHiv4uu0N5CS0vhHoy7bHkFHZTMaPM1idzGxFfZ4JboB
         kYEuC/FGqJ7RF7KTStz2kyMzVABXG6Py1M9KsTBQzeq/mgCqSwnVoehxPEAINDfSnplx
         58hLfrVbYKyKEzYqFC+2KDtXP7F8F5HcNkP3EGkZgDHRAWMBxzV7tdBmw84dEDgJVLyD
         iCrpuZ+pqHO5Mr0pfvxa3H6aHIiuvFaMxk3Gn70L66Ksxdabl1hmPSJ0aRoV0yooSXs6
         m2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731980653; x=1732585453;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TLGZPhgwiSdTuoKO9EIOhX+7x+wgHfPfCEdlENWql4=;
        b=GFxCNjOA0J3l4AJhSHgAMd9ZVLw6JnADKOprfzLi9eb/1n52BJE+3DbgixlINH61Zp
         AWht0wiaR5ej0PGWeinCmx5wpHdtw21qSQKQZjTYniRAlkg/3DcBOEJPWPpnnFOm6qb6
         BoMB79GMymFdRnaYrqrJ05h/XGt+Mg42erHMMb3E7G98rTp8qLHg6/fB5+NbjnClVo5I
         R+6UI6EpwSbQxYG3hvj92wBHmDVEzJi4/23euPRkpdtpCZZK33nIA0Ot9Z8mAkaduorU
         eykeBKgkiaaTg00oidxlpopR+gXAMCtYrM7LFUb1cavxPHNQ4+kpUXt2IJZZNXd+AE4t
         qCkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtVUzTctReE4EtrNGv9Q09GWeAzIgnAlsbaMfVmbiuEfFTqh3YNC/WBGqwfUDy6PX/+whRcUzy+c6NOgkyG+8DKg==@lists.infradead.org, AJvYcCV5/3csWiZUjp9QswO8O8vRZe4dTWzXsaxMLEj33U84wT+IxBOHaZRxb+uqsJHE29wybhcA75FTaeHqny5jN8epXg==@lists.infradead.org, AJvYcCVEe0UgyhKTfqmu2UBO0k/DsvfP0qCMy48O412C90lNhmQBoSpURp6tcUDGbXDneUdSjP/b30U=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSF3rDIPqzsZg7f9VfNZcclgBQqFQ/t+M7bquRFGqNZOHpQk4c
	fQMLuPO9Lma+AQxg24hyB+vqjxbNum8qVXPnsxGk2cosLP1tYDqd
X-Google-Smtp-Source: AGHT+IGKOuuVyAvdbfIttKIxJSv7PNCbNBMgaHYEIodVhJO4YNPmnFai9XI15Qs6QZqqMPXdK5RTjA==
X-Received: by 2002:a17:903:186:b0:212:46c2:632e with SMTP id d9443c01a7336-21246c26707mr25423135ad.15.1731980653295;
        Mon, 18 Nov 2024 17:44:13 -0800 (PST)
Received: from smtpclient.apple ([198.11.178.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f6182bsm62977715ad.277.2024.11.18.17.43.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Nov 2024 17:44:12 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH v2 19/21] livepatch: Convert timeouts to secs_to_jiffies()
From: zhang warden <zhangwarden@gmail.com>
In-Reply-To: <96f3b51b-c28c-4ea8-b61e-a4982196215f@linux.microsoft.com>
Date: Tue, 19 Nov 2024 09:43:32 +0800
Cc: Petr Mladek <pmladek@suse.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Russell King <linux@armlinux.org.uk>,
 Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Ofir Bitton <obitton@habana.ai>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>,
 Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jack Wang <jinpu.wang@cloud.ionos.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Xiubo Li <xiubli@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Louis Peens <louis.peens@corigine.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org,
 netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org,
 linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org,
 linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org,
 ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org,
 linux-sound@vger.kernel.org,
 etnaviv@lists.freedesktop.org,
 oss-drivers@corigine.com,
 linuxppc-dev@lists.ozlabs.org,
 Anna-Maria Behnsen <anna-maria@linutronix.de>
Content-Transfer-Encoding: quoted-printable
Message-Id: <99755FD2-270C-4122-8A22-6C73A81028F6@gmail.com>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-19-911fb7595e79@linux.microsoft.com>
 <718febc4-59ee-4701-ad62-8b7a8fa7a910@csgroup.eu>
 <Zzsfuuv3AVomkMxn@pathway.suse.cz>
 <96f3b51b-c28c-4ea8-b61e-a4982196215f@linux.microsoft.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_174414_889728_E48821F0 
X-CRM114-Status: GOOD (  18.71  )
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



> On Nov 19, 2024, at 02:18, Easwar Hariharan =
<eahariha@linux.microsoft.com> wrote:
>=20
> On 11/18/2024 3:06 AM, Petr Mladek wrote:
>> On Sat 2024-11-16 11:10:52, Christophe Leroy wrote:
>>>=20
>>>=20
>>> Le 15/11/2024 =C3=A0 22:26, Easwar Hariharan a =C3=A9crit :
>>>> [Vous ne recevez pas souvent de courriers de =
eahariha@linux.microsoft.com. D=C3=A9couvrez pourquoi ceci est important =
=C3=A0 https://aka.ms/LearnAboutSenderIdentification ]
>>>>=20
>>>> Changes made with the following Coccinelle rules:
>>>>=20
>>>> @@ constant C; @@
>>>>=20
>>>> - msecs_to_jiffies(C * 1000)
>>>> + secs_to_jiffies(C)
>>>>=20
>>>> @@ constant C; @@
>>>>=20
>>>> - msecs_to_jiffies(C * MSEC_PER_SEC)
>>>> + secs_to_jiffies(C)
>>>>=20
>>>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>>>> ---
>>>>  samples/livepatch/livepatch-callbacks-busymod.c |  2 +-
>>>>  samples/livepatch/livepatch-shadow-fix1.c       |  2 +-
>>>>  samples/livepatch/livepatch-shadow-mod.c        | 10 +++++-----
>>>>  3 files changed, 7 insertions(+), 7 deletions(-)
>>>>=20
>>>> diff --git a/samples/livepatch/livepatch-callbacks-busymod.c =
b/samples/livepatch/livepatch-callbacks-busymod.c
>>>> index =
378e2d40271a9717d09eff51d3d3612c679736fc..d0fd801a7c21b7d7939c29d83f9d993b=
adcc9aba 100644
>>>> --- a/samples/livepatch/livepatch-callbacks-busymod.c
>>>> +++ b/samples/livepatch/livepatch-callbacks-busymod.c
>>>> @@ -45,7 +45,7 @@ static int livepatch_callbacks_mod_init(void)
>>>>  {
>>>>         pr_info("%s\n", __func__);
>>>>         schedule_delayed_work(&work,
>>>> -               msecs_to_jiffies(1000 * 0));
>>>> +               secs_to_jiffies(0));
>>>=20
>>> Using secs_to_jiffies() is pointless, 0 is universal, should become
>>> schedule_delayed_work(&work, 0);
>>=20
>> Yes, schedule_delayed_work(&work, 0) looks like the right solution.
>>=20
>> Or even better, it seems that the delayed work might get replaced by
>> a normal workqueue work.
>>=20
>> Anyway, I am working on a patchset which would remove this sample
>> module. There is no need to put much effort into the clean up
>> of this particular module. Do whatever is easiest for you.
>>=20
>> Best Regards,
>> Petr
>=20
> If we're removing the module, I'll drop it from the series. Just to
> clarify, do you mean to remove all of samples/livepatch/* or some
> particular file(s)?
>=20
> Thanks,
> Easwar
>=20

Hi Easwar!

I think Petr is going to remove just this module away. Anyway, I don't =
think
removing all of them is a good idea.

Thanks.
Wardenjohn.=20


