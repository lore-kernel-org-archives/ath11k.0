Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D96E77180
	for <ath11k@archiver.kernel.org>; Wed, 11 Dec 2024 04:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SKADluaoUiTETH1UwG/V5DVCwgNdNCuMvx/YiXR3rAc=; b=S7syZU7mtW5a5T9qJw5aVw/U2y
	8BjYBwNm/V4/lY7HkTnE9spCKMo1Js/FhLMg0LDp/z6bPEx+JTOf7+Fr7pYFFf3JUINHMWfYRtosv
	PjvQvkFHr+RHe2rChSOaYmzss/QeOcju0+a63o5BnbUu5eyw538tpB01U9L1Tf0sHtaCVFGLSwQB+
	03fHMuHAbXd0v0EA3IK1kLgER4Y3BCqXyVRQpQ0Tck0AXLFyi09g5Loludq+Ue1XQpqojrW/pTGiZ
	yWPkSvMExbXYwI9Alq3Ov1tpUpZxakQy9vTaaWLNpvGjVemmSLJS3rvF2zw4KJcksyAX4Jhh5FV/t
	cenTn4eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLER0-0000000DlD6-4ALx;
	Wed, 11 Dec 2024 04:34:50 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLEQy-0000000DlC8-1c4u;
	Wed, 11 Dec 2024 04:34:49 +0000
Received: from [100.65.208.14] (unknown [20.236.11.185])
	by linux.microsoft.com (Postfix) with ESMTPSA id C44BD204722B;
	Tue, 10 Dec 2024 20:34:43 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C44BD204722B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1733891686;
	bh=SKADluaoUiTETH1UwG/V5DVCwgNdNCuMvx/YiXR3rAc=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=IJPud503TZQ7qC+nAh33r29ZAguv/DZaDYDmYDAbJHqsXv7vFEisx4C+2Bx4/X0Ny
	 QNmGT6WWiLLDSDyIxMX24BlKcPvLa2DRjFmS0GhpoB9JmvKOYeEniEHPcKfYI5Rx3Y
	 UFvay1FmNXEMmTdeKu7+xEJKV27TsW4+ndYHIugA=
Message-ID: <d93e388c-ed18-400c-b6cf-ec00a5979457@linux.microsoft.com>
Date: Tue, 10 Dec 2024 20:34:43 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Andrew Morton <akpm@linux-foundation.org>, eahariha@linux.microsoft.com,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King
 <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>,
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>,
 Dick Kennedy <dick.kennedy@broadcom.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Xiubo Li <xiubli@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Louis Peens <louis.peens@corigine.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-mm@kvack.org,
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org,
 oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org,
 Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH v3 00/19] Converge on using secs_to_jiffies()
To: Jakub Kicinski <kuba@kernel.org>
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
 <315e9178-5b10-4de0-bdcf-7243e0e355bb@oss.qualcomm.com>
 <20241210153604.cf99699f264f12740ffce5c7@linux-foundation.org>
 <20241210173548.5d32efe0@kernel.org>
 <20241210183130.81111d05148c41278a299aad@linux-foundation.org>
 <20241210184129.41aaf371@kernel.org>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <20241210184129.41aaf371@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_203448_484747_2F9B7CBF 
X-CRM114-Status: GOOD (  12.35  )
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

On 12/10/2024 6:41 PM, Jakub Kicinski wrote:
> On Tue, 10 Dec 2024 18:31:30 -0800 Andrew Morton wrote:
>>>> I'll just grab everything and see if anyone complains ;)  
>>>
>>> I may, if this leads to a conflict :(  
>>
>> Very unlikely, and any such conflict will be trivial.
> 
> Agreed, mainly I don't understand why we'd make an exception
> and take the patchset via a special tree.
> 
>>> Easwar, please break this up per subsystem.  
>>
>> The series is already one-patch-per-changed-file.
> 
> More confusingly still, they did send one standalone patch for 
> an Ethernet driver:
> https://lore.kernel.org/all/20241210-converge-secs-to-jiffies-v3-20-59479891e658@linux.microsoft.com/
> And yet another Ethernet driver (drivers/net/ethernet/google/gve/) 
> is converted in this series.

Sorry about the confusion, I missed pulling the gve patch from this
series. I'll send that (and ath11k) separately as well. I'll pull all
these together into a series so you can merge them together if you prefer.

Thanks,
Easwar

