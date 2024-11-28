Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7743AD69105
	for <ath11k@archiver.kernel.org>; Thu, 28 Nov 2024 12:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Nxf6CkGK3NslY+JLgqPcTLt32q1OCumzkrHYUKQkbE=; b=GsbADvJ1iol3lBsyM9B8X6B3Fb
	w7kgIBggWZHuI0UM2VlLKSKyWAVrzF55kK4WrJ0hGp5ezAfBcbms4ReqznKB8EqbllMUVXUsYQESU
	LzWrSO+ii2iQKSjIkIjNf4NpaSYoMRyUCH6iyao3qmigEi3Aj1Iv0szeE4nFsALiuseThDN2K4WXR
	+Xut0CNCoSW+cDR2jnAP7sNIydXifrAArqVhTVV0azoyNiugl6Re/TxIWrX0G0A/k/i/+XwyVRaUP
	Y2QeBHQgPgTmeSqT/na6+HcRb/wml6cYnKpF8BgV5wGQdh3WJPY5ZuZ76+8TU+ELtuLHfajcsubfy
	+QT46ELg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdha-0000000FUON-3h9i;
	Thu, 28 Nov 2024 12:32:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGdfj-0000000FU3T-0tDe
	for ath11k@lists.infradead.org;
	Thu, 28 Nov 2024 12:31:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732797062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Nxf6CkGK3NslY+JLgqPcTLt32q1OCumzkrHYUKQkbE=;
	b=PpY1ookJiPxgrR04PCZq5EgBMvBHthpneGQZUvPuaNTUgOESW28RINKJtkAMj0VJD2WlwS
	C6yO0YKqDJnOXSR/ZHG+KVXUxO/swwDkgjzm/MUqyWr0c6hzR6CB+HTT3GDwKZm6a7lAIQ
	1m3y45r9/gFa1ERkejZIBJalhtXFFLU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-BxKKcCgONkKak5EK7aoRrA-1; Thu, 28 Nov 2024 07:29:13 -0500
X-MC-Unique: BxKKcCgONkKak5EK7aoRrA-1
X-Mimecast-MFC-AGG-ID: BxKKcCgONkKak5EK7aoRrA
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5cfba4f3c6dso527196a12.0
        for <ath11k@lists.infradead.org>; Thu, 28 Nov 2024 04:29:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732796952; x=1733401752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Nxf6CkGK3NslY+JLgqPcTLt32q1OCumzkrHYUKQkbE=;
        b=liaAxF54P/ozRL6rVhksyV00LrcdH24Czm8/pVea1MLTT3bXtTxyT1eZDAmaoHJ7Ow
         rrtuZZJPNY6i9I9R2cU9k/szQMfGzjdbEmwRExqAOlzciqVqD6br/IRYay2uPFiVRea1
         VcbIBxwHwc0+Nac5hrxD9wf0pav3HWdFDlvBQDxIhyX8vCpNmtJzPQaCXvWXNt1u4a1D
         k/7AXy1RlFSeU/yJFEQ4PpJgN5Xqg+CX0dp7U81+H7amKS2NjQfNniqPRpLs4RFa971u
         m7eNvi/hr6yjQMNItXdnHfgtmCJO0ewJ9IbgbLVucZlOPqRej1xUHUepAwnDtIkZKMvP
         MUIg==
X-Forwarded-Encrypted: i=1; AJvYcCXEN0vuVzHH4ux3oX7pse33cSbV9aoWeKmlc8CvgGAJG1qyM8Zs791sG5kirA8d0tphXtVS558=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+PubG5aP4HGYNxYwdrEQK1EPXSTU51bGge0osrk/uj3f0gY/5
	aZZ+ZjKRRV+VGAildF4hbTHezEj1nv1afsu26xCMpvgJI0EcgOxFpyipUQij++wBYnL84POlxx/
	dSDPwitojTmHrNp4pgLJBwFa03LDhDcvqNgy9WEn1711t6vtbPIV2isnfw1jZWFWzkZALuMRibt
	i5aPhj3+i5YNr2GlBIV8Xue0kC6bkYrXY5LA==
X-Gm-Gg: ASbGnctafEJkinwV/khxPmMXWPJfp9UaSqtDlycCMblUw2Rco0JsgPPu7x7uQi+R4Py
	+iTK+BFycsbvZuvqPXlIsrXoDWY4TKkY=
X-Received: by 2002:a05:6402:5243:b0:5cf:e26b:9797 with SMTP id 4fb4d7f45d1cf-5d080c604fcmr5605175a12.29.1732796951986;
        Thu, 28 Nov 2024 04:29:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuE0zkJ6zJza+fGet7qX+06h7Jmet7/bu0xRwgqC9A06SMAgod8PaoQJd1k5pY7KRDfw0cJAGqmNIglvOyUZo=
X-Received: by 2002:a05:6402:5243:b0:5cf:e26b:9797 with SMTP id
 4fb4d7f45d1cf-5d080c604fcmr5605060a12.29.1732796951475; Thu, 28 Nov 2024
 04:29:11 -0800 (PST)
MIME-Version: 1.0
References: <20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v1-18-19aadc34941b@linux.microsoft.com>
In-Reply-To: <20241115-converge-secs-to-jiffies-v1-18-19aadc34941b@linux.microsoft.com>
From: Alex Markuze <amarkuze@redhat.com>
Date: Thu, 28 Nov 2024 14:29:00 +0200
Message-ID: <CAO8a2SjKS2nWWVkAcqXkZhR+Q1TocULkwRk09ABf8XQjjzwJPQ@mail.gmail.com>
Subject: Re: [PATCH 18/22] ceph: Convert timeouts to secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>, 
	Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jack Wang <jinpu.wang@cloud.ionos.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Xiubo Li <xiubli@redhat.com>, 
	Ilya Dryomov <idryomov@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, 
	Christian Gmeiner <christian.gmeiner@gmail.com>, Louis Peens <louis.peens@corigine.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, netfilter-devel@vger.kernel.org, 
	coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RI3X-sqDB3PvD8nM0MkMYqqUeJHdgBVVrduy8EjnvPQ_1732796952
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_043103_364103_CA48B9F1 
X-CRM114-Status: GOOD (  18.20  )
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

looks good

On Fri, Nov 15, 2024 at 11:35=E2=80=AFPM Easwar Hariharan
<eahariha@linux.microsoft.com> wrote:
>
> Changes made with the following Coccinelle rules:
>
> @@ constant C; @@
>
> - msecs_to_jiffies(C * 1000)
> + secs_to_jiffies(C)
>
> @@ constant C; @@
>
> - msecs_to_jiffies(C * MSEC_PER_SEC)
> + secs_to_jiffies(C)
>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>  fs/ceph/quota.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ceph/quota.c b/fs/ceph/quota.c
> index 06ee397e0c3a6172592e62dba95cd267cfff0db1..d90eda19bcc4618f98bfed833=
c10a6071cf2e2ac 100644
> --- a/fs/ceph/quota.c
> +++ b/fs/ceph/quota.c
> @@ -166,7 +166,7 @@ static struct inode *lookup_quotarealm_inode(struct c=
eph_mds_client *mdsc,
>         if (IS_ERR(in)) {
>                 doutc(cl, "Can't lookup inode %llx (err: %ld)\n", realm->=
ino,
>                       PTR_ERR(in));
> -               qri->timeout =3D jiffies + msecs_to_jiffies(60 * 1000); /=
* XXX */
> +               qri->timeout =3D jiffies + secs_to_jiffies(60); /* XXX */
>         } else {
>                 qri->timeout =3D 0;
>                 qri->inode =3D in;
>
> --
> 2.34.1
>
>


