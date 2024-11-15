Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698AAD68BDD
	for <ath11k@archiver.kernel.org>; Fri, 15 Nov 2024 22:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3z7ywabUJ27i2rb14B4LEGDccer8KYu9+MGXqf4uX30=; b=Tqw2x/Pb7KkE68aEw0EXOOJa0t
	v5HWhjJVsEWO/ZN5b+hnE6hwkatFE7iP0fnrlg9oq1WfSVB+JsCN2ty1DpMGU6iIl6lKxRU+u3QII
	qiV7ocIgMAIzv4rkvYnw5SEN8AiZZjCBGJZVmb+5Cm/uVRQ1EMEMh+o9yCB3OI+CZzhnRMTePfQb8
	/6nGXS4wVscY5RxtOW5iR+QG1hHl8Rs7gJbSHi10IXuXW+vyJNhMlCjMp0lkSofZhOUlivp60zEUU
	qYVAqvNixUFZbKqH3gk8BiBqWZQ3NkbmSxTa6rG1d0MCrPz51O3XJbI0SmLJ5pyjy81AHYr+bV7fn
	wWVecYsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC4ax-00000004NZp-2WGO;
	Fri, 15 Nov 2024 22:15:15 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC4au-00000004NYV-3g4k;
	Fri, 15 Nov 2024 22:15:14 +0000
Received: from [192.168.35.166] (c-73-118-245-227.hsd1.wa.comcast.net [73.118.245.227])
	by linux.microsoft.com (Postfix) with ESMTPSA id C2E092064AEB;
	Fri, 15 Nov 2024 14:15:08 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C2E092064AEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1731708911;
	bh=3z7ywabUJ27i2rb14B4LEGDccer8KYu9+MGXqf4uX30=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=N1g55SdNOAVrXtoAUWPnvUkB3x2fHI9b6jafO92eRdbbD4Gte6s/kvOokfmkgYHJe
	 Frz5kbgdiLksPpFFaWRXGFZ7VcwJJIP77+3HbEyB4bGSyYhL140G+m7AP2fdg7ax7k
	 BFhXHlM0RPRrW6JGtgd18IntrfjEtsdFiu0GVoGc=
Message-ID: <8127a2e6-fa62-4c85-b7ed-24748cc9e285@linux.microsoft.com>
Date: Fri, 15 Nov 2024 14:15:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 Naveen N Rao <naveen@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Louis Peens <louis.peens@corigine.com>, Nicholas Piggin <npiggin@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Petr Mladek <pmladek@suse.com>,
 Joe Lawrence <joe.lawrence@redhat.com>, Miroslav Benes <mbenes@suse.cz>,
 Jiri Kosina <jikos@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Johan Hedberg <johan.hedberg@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Marcel Holtmann <marcel@holtmann.org>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jeroen de Borst <jeroendb@google.com>,
 Shailend Chand <shailend@google.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, Ofir Bitton <obitton@habana.ai>,
 Sven Schnelle <svens@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Russell King <linux@armlinux.org.uk>, Robert Jarzmik
 <robert.jarzmik@free.fr>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Daniel Mack <daniel@zonque.org>, Nicolas Palix <nicolas.palix@imag.fr>,
 Julia Lawall <Julia.Lawall@inria.fr>, Simon Horman <horms@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [PATCH v2 00/21] Converge on using secs_to_jiffies()
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <10ee4e8f-d8b4-4502-a5e2-0657802aeb11@linux.microsoft.com>
 <3ac480f5-549b-4449-baa9-f766e074c409@quicinc.com>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <3ac480f5-549b-4449-baa9-f766e074c409@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_141512_963496_8EDED202 
X-CRM114-Status: GOOD (  17.40  )
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

On 11/15/2024 1:41 PM, Jeff Johnson wrote:
> On 11/15/2024 1:29 PM, Easwar Hariharan wrote:
>> On 11/15/2024 1:26 PM, Easwar Hariharan wrote:
>>> This is a series that follows up on my previous series to introduce
>>> secs_to_jiffies() and convert a few initial users.[1] In the review for
>>> that series, Anna-Maria requested converting other users with
>>> Coccinelle. This is part 1 that converts users of msecs_to_jiffies()
>>> that use the multiply pattern of either of:
>>> - msecs_to_jiffies(N*1000), or
>>> - msecs_to_jiffies(N*MSEC_PER_SEC)
>>>
>>> The entire conversion is made with Coccinelle in the script added in
>>> patch 2. Some changes suggested by Coccinelle have been deferred to
>>> later parts that will address other possible variant patterns.
>>>
>>> CC: Anna-Maria Behnsen <anna-maria@linutronix.de>
>>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>>>
>>> [1] https://lore.kernel.org/all/20241030-open-coded-timeouts-v3-0-9ba123facf88@linux.microsoft.com/
>>> [2] https://lore.kernel.org/all/8734kngfni.fsf@somnus/
>>>
>>> ---
>>> Changes in v2:
>>> - EDITME: describe what is new in this series revision.
>>> - EDITME: use bulletpoints and terse descriptions.
>>> - Link to v1: https://lore.kernel.org/r/20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com
>>>
>>
>> Apologies, I missed out on editing the changelog here. v1 included a
>> patch that's already been accepted, there are no other changes in v2.
>>
>> Thanks,
>> Easwar
> 
> How do you expect this series to land since it overlaps a large number of
> maintainer trees? Do you have a maintainer who has volunteered to take the
> series and the maintainers should just ack? Or do you want the maintainers to
> take the individual patches that are applicable to them?
> 
> /jeff

I am hoping for tglx to take it through his tree since the patch
introducing secs_to_jiffies() is in his tree, so sequencing of
dependencies would not be an issue.

But if tglx won't, we could push it out another cycle and individual
maintainers can take the patches that are applicable to their tree for
the series.

Thanks,
Easwar

