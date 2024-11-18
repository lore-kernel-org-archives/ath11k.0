Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5D1D591A9
	for <ath11k@archiver.kernel.org>; Mon, 18 Nov 2024 18:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lP0Zntp+HRWENCbPjrc9G2lDoefH/1cMkwirwj5j8Pw=; b=wzGnha1PUGqPcmR7bQU4vKuGFg
	GgeQQjD/4HCN+Hw5S+8x+XASyE5Reu/3c6S9zVqG45/itkZd2Wa+J9i5mkkQrG9E2tdjiSDEBmwmn
	z+5aGEJIBU3qMYEXU1duyrXFFjTGueyKfQZQT5jTFbEYmUQfo0GN0eDCFM86fO4NvWlGY14D+loqY
	hKlVhZc3EGjKGFDV/Zqwfg/lbuqCNNIzszOEj9ailOm3E+5Qz4JSrPNKMeoSYSFpPzfv5u/DzeUEz
	fnZzcys7YzTURIMWfEY47EzpB2T4x3Yp6ZxqoMGNnuTsW95KshUy698kHNlKkWQ6kgHOzFcQ7EoW4
	QbRpyezA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD69r-0000000AI25-48tc;
	Mon, 18 Nov 2024 18:07:31 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD69p-0000000AI1O-1qsb;
	Mon, 18 Nov 2024 18:07:30 +0000
Received: from [192.168.35.166] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id 3DD17206BCF9;
	Mon, 18 Nov 2024 10:07:25 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3DD17206BCF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1731953247;
	bh=lP0Zntp+HRWENCbPjrc9G2lDoefH/1cMkwirwj5j8Pw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=U8YJ5MEB+lC4gUMBqZ4Gz30eL5pByQSSZkvP1DxkMnTP1qlIes9QjQ3oHvl0/spjY
	 zaV4G+9kqg2wB6l6cY05sRrhV/1+2NwT0Di3E3r4OqgFDSinGSRYQd2YjZAhmOdf7k
	 pgtoi2CJWleSz5F2PF0YMgIK9D4gDdAFvwZB2ktQ=
Message-ID: <4a3e6cfe-35ef-4865-8b43-c002679455f3@linux.microsoft.com>
Date: Mon, 18 Nov 2024 10:07:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>, Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Jack Wang <jinpu.wang@cloud.ionos.com>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner <christian.gmeiner@gmail.com>, Louis Peens <louis.peens@corigine.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, eahariha@linux.microsoft.com, "netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>, "coreteam@netfilter.org" <coreteam@netfilter.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "cocci@inria.fr" <cocci@inria.fr>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>, "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>, "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>, "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>, "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>, "oss-drivers@corigine.com" <oss-drivers@corigine.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH v2 00/21] Converge on using secs_to_jiffies()
To: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <fb97b58c-4d77-43d1-88a0-d838d5030d3e@cs-soprasteria.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <fb97b58c-4d77-43d1-88a0-d838d5030d3e@cs-soprasteria.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_100729_528269_64E2B2B7 
X-CRM114-Status: GOOD (  13.79  )
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

On 11/16/2024 2:23 AM, LEROY Christophe wrote:
> 
> 
> Le 15/11/2024 à 22:26, Easwar Hariharan a écrit :
>> [Vous ne recevez pas souvent de courriers de eahariha@linux.microsoft.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>
>> This is a series that follows up on my previous series to introduce
>> secs_to_jiffies() and convert a few initial users.[1] In the review for
>> that series, Anna-Maria requested converting other users with
>> Coccinelle. This is part 1 that converts users of msecs_to_jiffies()
>> that use the multiply pattern of either of:
>> - msecs_to_jiffies(N*1000), or
>> - msecs_to_jiffies(N*MSEC_PER_SEC)
> 
> After applying this series on top of tip/timers/core tree, I still find
> a lot of candidates to the conversion:
> 

Thanks for looking, that pattern of seconds-denominated
msecs_to_jiffies() calls will be addressed in a later part. As mentioned
in my reply to Anna-Maria[1], I'm not super-familiar with Coccinelle. I
sent this out as part 1 as mentioned in the cover letter above to make
incremental progress as much as I could. Julia has sent me a message
with a rule that could possibly address the pattern you point out.

I also see there are some instances in the grep results that appear to
be expression * 1000 rather than constant * 1000. I'll address those in
one of the later parts as well.

Thanks,
Easwar

