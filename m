Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FCAE69E95
	for <ath11k@archiver.kernel.org>; Mon,  2 Dec 2024 21:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZHtDSci4mxW9uObrOpyGXF4tVtVRk+OAevn+2+RUUc=; b=zGHAynksz6+CoBCeLtIZt2Y5qX
	jwvoQZoaaa+piIwXWF2olI1LrVp1FATTGxVsPglKiZ6V+x+arFy3WM9FrAMGl/QPTfb11O2TRHYqF
	566qyOMOHiZ4Mt5bCYBzCsBKSbMASaEQjiJSRWTjlE7sLVifCmFkw4hNjafoH6PbeV1+BYY7VU9Dd
	Q2HrCxT/BlLD33QeCoYES6FncZGxIVkS2AWxX13khHPVEqYwlCk75CZLG5duVaelaT5/qzqQtLC6T
	+DM2QTwKynGKWfljluBYpvaXLmXn8X8fudaggJMGO38PxUoUx+LiKUzu7xbJ1SByPhRXDYROO9w4y
	APvr8tqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIDn3-00000007Uwg-3WYD;
	Mon, 02 Dec 2024 21:17:09 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIDn0-00000007Uvr-2nXP;
	Mon, 02 Dec 2024 21:17:07 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7fccc26ad01so1428078a12.2;
        Mon, 02 Dec 2024 13:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733174225; x=1733779025; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FZHtDSci4mxW9uObrOpyGXF4tVtVRk+OAevn+2+RUUc=;
        b=HPmlN00S3xQ6IxZkvj/ATv9T4Mxb0FgXaxtx5VxHMDEyeT74TgKOlOZhaBi3Xv3IF8
         i2BHURX7nKI2ccJGBnT02e6Hu5h+R1Q0axE51vOP6UdA4LprJd4MFl/HmmfUYKVfJf7x
         FjghxC5lZasfulbKuVD+EyHqHplSJp8rp57DMj9RCqBc4im8sRhVE+5SqEe7oD7sCCYd
         Dj0luugurWhTmqEg+MIfr3s46GpGVgrVp+xcjL11E4fhpkNxCeuXayIbQpDBKP23mXOs
         gNXkJPeg09x/otbZHnC13OQm0SZ/Pt+iFgNaypoOHs4d7YI8259QeEt4NCkHALqZAxLP
         Yy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733174225; x=1733779025;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZHtDSci4mxW9uObrOpyGXF4tVtVRk+OAevn+2+RUUc=;
        b=neCBimVR0HpgqUoNN7w++J9Qnc6QNBS5JIQIFisROv7v5fxyLSvrQLq/Dlyw32qJTo
         bjetzrfvkCqamvrr+yrcq6Mauma9Rz6zwhwJ1ZS6ZAa5FV2olIIpz52IxSpgcr+ijWc4
         lW8JK5NMUroLtY1pPfllYfPtqZSHmNvC165PcVJYlFfonSqpH5RE4Qp8p4BUgWSFzQ38
         aQ9Jg1cYq3OYuoutKwrTJKtbT5898HpNxFlWAJBp+6N+N6TyJrBAgEwdEhxLDMa21BeB
         VB661eytwlW1FnVknmmbXB0Nal32KFInUdg2+xHgO8sdUk7VbAJg5cE2F0DFkzED8fDP
         FqNg==
X-Forwarded-Encrypted: i=1; AJvYcCUhvgSTzHlv8SqnQpkAjVyfAJAC4E0YGhQlXGMfa7Bun7t12jg+ouG076S+YLvkwA7GiF+6FL3YwRYgkqETt/o3aQ==@lists.infradead.org, AJvYcCVQkZly9ZEHIRrzwry0WL/SLOOMeQFD04C7zVkO5tGhnMxIhzmB+tCMckF4qy2SuOTBqcIoKk0=@lists.infradead.org, AJvYcCXgpado7NnKwkRUMYkZq86xNddelLzcI9HtIDR12FwwhmSn8c1mQi7mMRy+9EBEuKB7hEMQEGFWIW+/OnFlBN9qkg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBEHAzISQdrSy/pefIJCGM1tTRVwNYXGbNkxKPsE/O7qaCpbPP
	HJjQSOiF+3kq6X5DgCCMjV8B97L8zt4HwadJKBRlrK/cbbyAXoFLgrnBuac1EbRKs2aiekA2CtR
	wgxC67kHcKJWHoP71qnLPBot+CKY=
X-Gm-Gg: ASbGncv5LQ8o837Pe+/0pie8/+7GC4YVrx5pIlZfWLBdU/KJVd6JQe/KuTZy5hu0y1N
	uowA9YrDg0n/Q2kyMkOhhq9UAUyXgxA==
X-Google-Smtp-Source: AGHT+IFDh1yb6d6zM40EzPJelJu2iVMH0WClLwmjysRWgfnYNSB8awfS5UuhO/EqqMc0eH1dffTLKgwFM99xaAmy4L8=
X-Received: by 2002:a17:90b:1c09:b0:2ee:3cc1:793a with SMTP id
 98e67ed59e1d1-2ef0124c720mr32029a91.29.1733174224966; Mon, 02 Dec 2024
 13:17:04 -0800 (PST)
MIME-Version: 1.0
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-9-911fb7595e79@linux.microsoft.com>
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-9-911fb7595e79@linux.microsoft.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 2 Dec 2024 22:16:53 +0100
Message-ID: <CAH9NwWdjXKH-AcKa-prwdqj2JqWLYVp1qM+0kxtQYSwo1J1c7g@mail.gmail.com>
Subject: Re: [PATCH v2 09/21] drm/etnaviv: Convert timeouts to secs_to_jiffies()
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
	Louis Peens <louis.peens@corigine.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, netfilter-devel@vger.kernel.org, 
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
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_131706_701978_80A1B211 
X-CRM114-Status: GOOD (  17.51  )
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

Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c b/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
> index 721d633aece9d4c81f0019e4c55884f26ee61c60..0f5a2c885d0ab7029c7248e15d6ea3c31823b782 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c
> @@ -100,7 +100,7 @@ int etnaviv_cmdbuf_init(struct etnaviv_cmdbuf_suballoc *suballoc,
>                 mutex_unlock(&suballoc->lock);
>                 ret = wait_event_interruptible_timeout(suballoc->free_event,
>                                                        suballoc->free_space,
> -                                                      msecs_to_jiffies(10 * 1000));
> +                                                      secs_to_jiffies(10));
>                 if (!ret) {
>                         dev_err(suballoc->dev,
>                                 "Timeout waiting for cmdbuf space\n");
>
> --
> 2.34.1
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy

