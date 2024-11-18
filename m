Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95751D4920C
	for <ath11k@archiver.kernel.org>; Mon, 18 Nov 2024 11:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4K7ZFgLQYJQlGAzpq8RK54g3EqKOomWWOR+yhsr1qw=; b=pbNzLIX/usTDtpgJZ73p5thC2+
	bbu7NfI4lBInxXGmCLPI/YG0xINgft82kOjTVudmagzos0G+eN6lwj/Cwn7U/tIT/y9m1v4iH0/rd
	B5OC7FoOimBd2cL0E8r6teFe2MFGC+pOcKYdj6HFz0miUNjAebKQ1tzlVA1eJ0qTWcUMNeUGNHnA8
	FhsCf4Bs1CXOGP57AgGi+7OpWRNHSOTrXSXTxyf1uOZLwKEn53ozxdixtzIyXtL54aTLYwm9eZ8oj
	C1Px0wKpMVMyPE4EKYpMIBoA+1PQgJRTWEVBpEPa0vMv7054hYi+VseJXaz3/DXAs++SgWME/g89i
	4WgNt53g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCzai-00000009CXw-3t3f;
	Mon, 18 Nov 2024 11:06:48 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCzae-00000009CVH-3RBT
	for ath11k@lists.infradead.org;
	Mon, 18 Nov 2024 11:06:47 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-382423e1f7aso761725f8f.2
        for <ath11k@lists.infradead.org>; Mon, 18 Nov 2024 03:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731928002; x=1732532802; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q4K7ZFgLQYJQlGAzpq8RK54g3EqKOomWWOR+yhsr1qw=;
        b=R7xo6iFD/danXNwoBiO7gtgmmPIFmwOwn/BZYkB8RfgM35ej8oK+q+m7tiTuCPR5m+
         ZHUtdw8k6UEEy5RSGKUjPQUqQkkPTpvxw3eIUvkkubrrZafUmArNJaMHHpD4wt9IsdNT
         a73wOZhbuRf0aELhZ054bkdj63DmuvPPsaJAl84vHf4UKGyDDl9etj7OZDfoNzaR1fVG
         xvtWx+tCf/ektyxKRlgRX+UNfCXW05gsFm6T0TWb2Hlgh0Ul+IFILLJK15uxZsbhkQJL
         RcVM/B2uDk7I86CkP5SmsMeArLn5jkhvCpZytKEfceLpVyfD9HrW8WQKj2xTFmPNGiT8
         IhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731928002; x=1732532802;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4K7ZFgLQYJQlGAzpq8RK54g3EqKOomWWOR+yhsr1qw=;
        b=MFYJJAetffiCFWea/BMk62LxU4dOK9Uk6G2WEF/5mBYwqptrCsSE/8rpvq1m367SKW
         vQhXlntBREgqmiLuWteE4XQm2pLinftp8YGg2us6YxmbL8FFTC5kUScDsbotfSdoMLsE
         CTlqYWC6zziRTM4YHvORYkRCRb3pDcxFhQADg2AbWwttq+B1Kh5U+W66LSZIPQBDs95p
         lgWF8Tc5Iy/nnbYlvDcvbEWMXjWahxHzmZuWfTCjj6IUGbJymHIXS6fFPNAJDYPxqenZ
         gS1kT+I+fXdodHm4zHCF8u5NB2smx87RfLxqeKrmJn/T6ccNhBwsCIVleaaa/1ZN3RJy
         eXRw==
X-Forwarded-Encrypted: i=1; AJvYcCVOvJc0DpS0R+pVB/OjCnr0/hLy0DSoB9RL6A4cVuN43sEGgwhv6xBVkpqnnpNyn0RlAo+aQFI=@lists.infradead.org
X-Gm-Message-State: AOJu0YywRAC8xWMe2E0hkPEUW+IYO3xQC5uGSAZlU2wR9lNlLJYnpzED
	Skp4JHUjcDa47WSegwpVq0+EpQcr9oIvXtwq5edm5oOPAsbU9B5OFWfLqteptwA=
X-Google-Smtp-Source: AGHT+IEHvVmgRYFNhCs4UC7E5RjVk5JwGYVdnUZOYcUXsiEIWSohYFEZO8cTVp2lMrq4C8xPl0BQ1Q==
X-Received: by 2002:a05:6000:18af:b0:37d:4ef1:1820 with SMTP id ffacd0b85a97d-38225a91e80mr10392779f8f.40.1731928002298;
        Mon, 18 Nov 2024 03:06:42 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38242eef982sm4319340f8f.8.2024.11.18.03.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 03:06:41 -0800 (PST)
Date: Mon, 18 Nov 2024 12:06:34 +0100
From: Petr Mladek <pmladek@suse.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
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
	Ofir Bitton <obitton@habana.ai>, Oded Gabbay <ogabbay@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Shailend Chand <shailend@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	James Smart <james.smart@broadcom.com>,
	Dick Kennedy <dick.kennedy@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Louis Peens <louis.peens@corigine.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	cocci@inria.fr, linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-scsi@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	linux-mm@kvack.org, linux-bluetooth@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	ceph-devel@vger.kernel.org, live-patching@vger.kernel.org,
	linux-sound@vger.kernel.org, etnaviv@lists.freedesktop.org,
	oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH v2 19/21] livepatch: Convert timeouts to secs_to_jiffies()
Message-ID: <Zzsfuuv3AVomkMxn@pathway.suse.cz>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-19-911fb7595e79@linux.microsoft.com>
 <718febc4-59ee-4701-ad62-8b7a8fa7a910@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <718febc4-59ee-4701-ad62-8b7a8fa7a910@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_030644_850590_FB1112EE 
X-CRM114-Status: GOOD (  18.79  )
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

On Sat 2024-11-16 11:10:52, Christophe Leroy wrote:
> 
> 
> Le 15/11/2024 à 22:26, Easwar Hariharan a écrit :
> > [Vous ne recevez pas souvent de courriers de eahariha@linux.microsoft.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > Changes made with the following Coccinelle rules:
> > 
> > @@ constant C; @@
> > 
> > - msecs_to_jiffies(C * 1000)
> > + secs_to_jiffies(C)
> > 
> > @@ constant C; @@
> > 
> > - msecs_to_jiffies(C * MSEC_PER_SEC)
> > + secs_to_jiffies(C)
> > 
> > Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> > ---
> >   samples/livepatch/livepatch-callbacks-busymod.c |  2 +-
> >   samples/livepatch/livepatch-shadow-fix1.c       |  2 +-
> >   samples/livepatch/livepatch-shadow-mod.c        | 10 +++++-----
> >   3 files changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/samples/livepatch/livepatch-callbacks-busymod.c b/samples/livepatch/livepatch-callbacks-busymod.c
> > index 378e2d40271a9717d09eff51d3d3612c679736fc..d0fd801a7c21b7d7939c29d83f9d993badcc9aba 100644
> > --- a/samples/livepatch/livepatch-callbacks-busymod.c
> > +++ b/samples/livepatch/livepatch-callbacks-busymod.c
> > @@ -45,7 +45,7 @@ static int livepatch_callbacks_mod_init(void)
> >   {
> >          pr_info("%s\n", __func__);
> >          schedule_delayed_work(&work,
> > -               msecs_to_jiffies(1000 * 0));
> > +               secs_to_jiffies(0));
> 
> Using secs_to_jiffies() is pointless, 0 is universal, should become
> schedule_delayed_work(&work, 0);

Yes, schedule_delayed_work(&work, 0) looks like the right solution.

Or even better, it seems that the delayed work might get replaced by
a normal workqueue work.

Anyway, I am working on a patchset which would remove this sample
module. There is no need to put much effort into the clean up
of this particular module. Do whatever is easiest for you.

Best Regards,
Petr

