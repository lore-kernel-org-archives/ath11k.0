Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70751E77183
	for <ath11k@archiver.kernel.org>; Wed, 11 Dec 2024 02:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CBb7hjH4xh1oj/7iU6E/LdGW+K5cpcHxcxXfa7bm7I=; b=vd3EZhRNs5PH9UIA8iXDfs1LQl
	zmAGDhLJztNuuRp0LQnlif21p55kvca7OzihI66OIzty2OS08dqQYWkMGOrAUOisL/kF/3+U+DQcO
	wZvVFIceC+wJLNXrIT14XHJoAST/GAEhL3ahg8tArTUO3o114MxQDe8Rk7mbQN6Li0hzBWsQ+WmbB
	UUpetnyjwIenLHnnhEARsqAxve+AZhHrCmJn8YItH/v92jNCEj3nrJYmLx5CkrfduZAKoOnnuo1Pa
	nMaK2QtiNILIHdNsgVQYtEf0Yg8HeXnY66YYT3mEVYBa8liFxawBfzHgDf8tCf0UOs+B9QmBwsRi7
	fHWCG5PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLCfR-0000000DX2d-3Rh8;
	Wed, 11 Dec 2024 02:41:37 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLCfP-0000000DX26-2L58;
	Wed, 11 Dec 2024 02:41:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6B6E7A41D8D;
	Wed, 11 Dec 2024 02:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2728C4CED6;
	Wed, 11 Dec 2024 02:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733884894;
	bh=00K8MMiI4zi+Ut/RW/eta+vMQomu0Giei3szpffQQOQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Da4qREKhLmCm8yz23HYMcnYhvUPIhwEMSq3e2xy5eHqmd+lk3xFCqCL8gMV2d1qZM
	 OX/nYhIL+8FVEAH5j2G8jreOCn4t5aDyk2A67ZSa2Mkyc9Pdlwt9HWePiQrPKYupQD
	 HqnoKIQmX31F4DdpsyABbQ15F6Ui5dY/VyDtBpBstL8y1jhriA+kdAfBMPTAXFbWnS
	 63C0vjQwg5Lmz+BJiiuG775DcGC4erU4pOGbFjbFCfGrajmvqQlFUpggTSjU+aLgVs
	 HKqzofl4MBLxzwaLLU/QjjetYigVK4WMW1awwyb5uskvci+1KuE5L5PLpPOgzSWNQz
	 YP2aWNyh8AjbA==
Date: Tue, 10 Dec 2024 18:41:29 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Julia Lawall
 <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack
 <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Ofir
 Bitton <obitton@habana.ai>, Oded Gabbay <ogabbay@kernel.org>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>, Dick Kennedy
 <dick.kennedy@broadcom.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Roger Pau =?UTF-8?B?TW9ubsOp?=
 <roger.pau@citrix.com>, Jens Axboe <axboe@kernel.dk>, Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Jack Wang <jinpu.wang@cloud.ionos.com>, Marcel
 Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden
 <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Xiubo Li <xiubli@redhat.com>, Ilya
 Dryomov <idryomov@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jiri
 Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Petr Mladek
 <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Louis Peens
 <louis.peens@corigine.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, netfilter-devel@vger.kernel.org,
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
 oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen
 <anna-maria@linutronix.de>
Subject: Re: [PATCH v3 00/19] Converge on using secs_to_jiffies()
Message-ID: <20241210184129.41aaf371@kernel.org>
In-Reply-To: <20241210183130.81111d05148c41278a299aad@linux-foundation.org>
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
	<315e9178-5b10-4de0-bdcf-7243e0e355bb@oss.qualcomm.com>
	<20241210153604.cf99699f264f12740ffce5c7@linux-foundation.org>
	<20241210173548.5d32efe0@kernel.org>
	<20241210183130.81111d05148c41278a299aad@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_184135_747441_85029770 
X-CRM114-Status: GOOD (  11.11  )
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

On Tue, 10 Dec 2024 18:31:30 -0800 Andrew Morton wrote:
> > > I'll just grab everything and see if anyone complains ;)  
> > 
> > I may, if this leads to a conflict :(  
> 
> Very unlikely, and any such conflict will be trivial.

Agreed, mainly I don't understand why we'd make an exception
and take the patchset via a special tree.

> > Easwar, please break this up per subsystem.  
> 
> The series is already one-patch-per-changed-file.

More confusingly still, they did send one standalone patch for 
an Ethernet driver:
https://lore.kernel.org/all/20241210-converge-secs-to-jiffies-v3-20-59479891e658@linux.microsoft.com/
And yet another Ethernet driver (drivers/net/ethernet/google/gve/) 
is converted in this series.

