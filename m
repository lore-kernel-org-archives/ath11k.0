Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28496D68BDE
	for <ath11k@archiver.kernel.org>; Fri, 15 Nov 2024 23:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocF2UaqffllWgiGWdH3dEXBRLSQ8zx6v3UTSvYUEWBM=; b=M4hQ7ITLK+ME9d/seGiWYlhFng
	ARNTZUoMNyHjLkmIRMTdAVgH3KDLbvqPk2pFPU4k8BPIMb6kXkOaGxRHGosf0C8I1QvR8lhEJ/vRd
	aZxuMMIqfVwKPl2WQJEjzeAY66b++z5OMfI6U/sgy67g92m3TIbfB+pLNDh/uYlWf5M3gnU7OE6I4
	G+89kbTGE9tzBvjnH/5RkjHbLnipRGKWv2bz0Msm+dfksH3plRfBqI+RWVCT3phgKHcUfFAdhOdpL
	w89swbc9TlCsQFpsbXRFzwozFRgfN8dAkCMY1GuzM/UEPzqz1vQ9HJtFDL1rKf/fhal/F0C2z9COP
	H2oVYNvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC5cR-00000004XbD-2pJL;
	Fri, 15 Nov 2024 23:20:51 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC5cO-00000004Xa3-2CpT;
	Fri, 15 Nov 2024 23:20:49 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731712845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ocF2UaqffllWgiGWdH3dEXBRLSQ8zx6v3UTSvYUEWBM=;
	b=SaYzzMZW0ZsY0TGo8HlsbXzuUvCi20iDEgp+8ohYBSE4TZQXRHLKLbged2BOetLpsx4OkO
	tbZB0k+QLCEJmNzJNJ7TX06kODrXybKEr0MN0pB2oucYCsCZhXwiPTvkrVYx4d0RSom1W9
	M5V6DhOs4++KN4sHh/UkGD4PfYSgL/msvq0en1H26aBKpf6quxCthUWooMmyaT4o/QkfC2
	lCNSo4ipp434fYIwklbWGy8m/kIcsHAL1J9mGF0JwBaNElltRXstfx+KSUKFTEf5oJlO1l
	imvGv9XAnBM1fMHYuOdaaDvDY2O6X0pakSlzfvsLT9wL98INhCHIDkaV3HsBDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731712845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ocF2UaqffllWgiGWdH3dEXBRLSQ8zx6v3UTSvYUEWBM=;
	b=o0jZxjqE/bb/KZAxT0liDWVEJtakeTQr/m7JfpgliBKuwvw5FjJoNIULPPZ+hcCbxwHCjD
	VmO8h0eWyvF8dzAA==
To: Easwar Hariharan <eahariha@linux.microsoft.com>, Jeff Johnson
 <quic_jjohnson@quicinc.com>
Cc: eahariha@linux.microsoft.com, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
 etnaviv@lists.freedesktop.org, oss-drivers@corigine.com,
 linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Naveen N Rao <naveen@kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Louis Peens <louis.peens@corigine.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Lucas Stach
 <l.stach@pengutronix.de>, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela
 <perex@perex.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Miroslav Benes <mbenes@suse.cz>, Jiri Kosina
 <jikos@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Ilya Dryomov
 <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>, Broadcom internal
 kernel review list <bcm-kernel-feedback-list@broadcom.com>, Scott Branden
 <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Luiz Augusto von Dentz
 <luiz.dentz@gmail.com>, Johan Hedberg <johan.hedberg@gmail.com>, Jens
 Axboe <axboe@kernel.dk>, Marcel Holtmann <marcel@holtmann.org>, Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>, Jack
 Wang <jinpu.wang@cloud.ionos.com>, Andrew Morton
 <akpm@linux-foundation.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Praveen Kaligineedi
 <pkaligineedi@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, James
 Smart <james.smart@broadcom.com>, Dick Kennedy
 <dick.kennedy@broadcom.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Jeroen de Borst <jeroendb@google.com>, Shailend Chand
 <shailend@google.com>, Thomas Zimmermann <tzimmermann@suse.de>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>, Ofir Bitton
 <obitton@habana.ai>, Sven Schnelle <svens@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko
 Carstens <hca@linux.ibm.com>, Russell King <linux@armlinux.org.uk>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Daniel Mack <daniel@zonque.org>, Nicolas Palix
 <nicolas.palix@imag.fr>, Julia Lawall <Julia.Lawall@inria.fr>, Simon
 Horman <horms@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, "David S. Miller"
 <davem@davemloft.net>, Jozsef Kadlecsik <kadlec@netfilter.org>, Pablo
 Neira Ayuso <pablo@netfilter.org>
Subject: Re: [PATCH v2 00/21] Converge on using secs_to_jiffies()
In-Reply-To: <8127a2e6-fa62-4c85-b7ed-24748cc9e285@linux.microsoft.com>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <10ee4e8f-d8b4-4502-a5e2-0657802aeb11@linux.microsoft.com>
 <3ac480f5-549b-4449-baa9-f766e074c409@quicinc.com>
 <8127a2e6-fa62-4c85-b7ed-24748cc9e285@linux.microsoft.com>
Date: Sat, 16 Nov 2024 00:20:50 +0100
Message-ID: <87plmwytgt.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_152048_845226_66EE8AE1 
X-CRM114-Status: GOOD (  15.75  )
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

On Fri, Nov 15 2024 at 14:15, Easwar Hariharan wrote:
> On 11/15/2024 1:41 PM, Jeff Johnson wrote:
>> 
>> How do you expect this series to land since it overlaps a large number of
>> maintainer trees? Do you have a maintainer who has volunteered to take the
>> series and the maintainers should just ack? Or do you want the maintainers to
>> take the individual patches that are applicable to them?
>> 
>> /jeff
>
> I am hoping for tglx to take it through his tree since the patch
> introducing secs_to_jiffies() is in his tree, so sequencing of
> dependencies would not be an issue.

Right, but it's two days before the merge window opens, so no.

> But if tglx won't, we could push it out another cycle and individual
> maintainers can take the patches that are applicable to their tree for
> the series.

That's the easiest way forward as it does not create conflicts and all
maintainers will have the base patch in their trees after rc1.

Thanks,

        tglx

