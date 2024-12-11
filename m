Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9B1E77180
	for <ath11k@archiver.kernel.org>; Wed, 11 Dec 2024 07:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JkNVVFFGbFo9FbSw2XPZzS8G5YLDR8er2AkrPtCRzJ8=; b=WbDF0+CJfg8ROXVQznK81DS98K
	64ka33UpEZRDOULwbxThvkAbIZkC11zPTlckm4v4voRB62HdHBs8sjzFdiv8XAOQcWIU/l6NMZ5bB
	pqsKj4/OSsM6wO4mnVPGC5bPYHCf8b/tErKgB3WhX03eE1phyoXNaCca9FJLztDZNg1bOtApw58Sa
	ZrwZFByhKNB1HFYkNygAgWUxA1utfOCiiYET3yU3MG7hKi1G/akhhvRTeoPOElf7vruJoGudFtMGg
	CVwp3XN5ohpDddrk+CuBGgOM+ci2jRuZ1zP0hUKUQUhmERdSA/Hs2cJJxdwLYR3XniNENeQUSNzv+
	39+zfDWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLHMr-0000000E5IC-0Gh0;
	Wed, 11 Dec 2024 07:42:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLHMe-0000000E5DQ-29Rs;
	Wed, 11 Dec 2024 07:42:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D3F25C5531;
	Wed, 11 Dec 2024 07:41:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6363CC4CED2;
	Wed, 11 Dec 2024 07:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733902951;
	bh=2uMUDx+CZ3m3qrGORQssIpf9SkBZEr5sXYGVq8CLbbk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=lzCs9W07TRdYy9JWVA19UEcEu4CvACr8Yh0wQYYSfGHV9Xmm3k/fpbGlRqmHhrV+4
	 m+NXNTf0ojEsKvo2HABNezvu0E3y4f8qwtj50O+Tpecim7ilciV/YQzBLNsRpBxgh2
	 kFcAO8hw1xQeAKLLWrzRXln1VFfP4BsLZkJYWlflCYYKj1xjZBYezOsESJaMXsh8Tr
	 hQ+/FOtWX9XeTV7X9iJbxMRHo8S8Byh7AJhYOGIti6Ul764xlpsl746ormGsN6d2KW
	 ZfV5twBXO7B+t0Fxemw7h0pYOWhdCFQdt/A+Rzvz9BButSX+3CHe4CYkaTdr1ABqIe
	 IMFDpd1/B9rEg==
From: Kalle Valo <kvalo@kernel.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,  Jozsef Kadlecsik
 <kadlec@netfilter.org>,  "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,  Julia Lawall
 <Julia.Lawall@inria.fr>,  Nicolas Palix <nicolas.palix@imag.fr>,  Daniel
 Mack <daniel@zonque.org>,  Haojian Zhuang <haojian.zhuang@gmail.com>,
  Robert Jarzmik <robert.jarzmik@free.fr>,  Russell King
 <linux@armlinux.org.uk>,  Heiko Carstens <hca@linux.ibm.com>,  Vasily
 Gorbik <gor@linux.ibm.com>,  Alexander Gordeev <agordeev@linux.ibm.com>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  Sven Schnelle
 <svens@linux.ibm.com>,  Ofir Bitton <obitton@habana.ai>,  Oded Gabbay
 <ogabbay@kernel.org>,  Lucas De Marchi <lucas.demarchi@intel.com>,  Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,  Rodrigo
 Vivi
 <rodrigo.vivi@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jeroen de Borst
 <jeroendb@google.com>,  Praveen Kaligineedi <pkaligineedi@google.com>,
  Shailend Chand <shailend@google.com>,  Andrew Lunn
 <andrew+netdev@lunn.ch>,  James Smart <james.smart@broadcom.com>,  Dick
 Kennedy <dick.kennedy@broadcom.com>,  "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,  "Martin K. Petersen"
 <martin.petersen@oracle.com>,  Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>,
  Jens Axboe <axboe@kernel.dk>,  Jeff Johnson <jjohnson@kernel.org>,
  Catalin Marinas <catalin.marinas@arm.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Jack Wang <jinpu.wang@cloud.ionos.com>,
  Marcel Holtmann <marcel@holtmann.org>,  Johan Hedberg
 <johan.hedberg@gmail.com>,  Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Florian Fainelli
 <florian.fainelli@broadcom.com>,  Ray Jui <rjui@broadcom.com>,  Scott
 Branden <sbranden@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Xiubo Li <xiubli@redhat.com>,
  Ilya Dryomov <idryomov@gmail.com>,  Josh Poimboeuf <jpoimboe@kernel.org>,
  Jiri Kosina <jikos@kernel.org>,  Miroslav Benes <mbenes@suse.cz>,  Petr
 Mladek <pmladek@suse.com>,  Joe Lawrence <joe.lawrence@redhat.com>,
  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,  Louis
 Peens <louis.peens@corigine.com>,  Michael Ellerman <mpe@ellerman.id.au>,
  Nicholas Piggin <npiggin@gmail.com>,  Christophe Leroy
 <christophe.leroy@csgroup.eu>,  Naveen N Rao <naveen@kernel.org>,
  Madhavan Srinivasan <maddy@linux.ibm.com>,
  netfilter-devel@vger.kernel.org,  coreteam@netfilter.org,
  netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,  cocci@inria.fr,
  linux-arm-kernel@lists.infradead.org,  linux-s390@vger.kernel.org,
  dri-devel@lists.freedesktop.org,  intel-xe@lists.freedesktop.org,
  linux-scsi@vger.kernel.org,  xen-devel@lists.xenproject.org,
  linux-block@vger.kernel.org,  linux-wireless@vger.kernel.org,
  ath11k@lists.infradead.org,  linux-mm@kvack.org,
  linux-bluetooth@vger.kernel.org,  linux-staging@lists.linux.dev,
  linux-rpi-kernel@lists.infradead.org,  ceph-devel@vger.kernel.org,
  live-patching@vger.kernel.org,  linux-sound@vger.kernel.org,
  oss-drivers@corigine.com,  linuxppc-dev@lists.ozlabs.org,  Anna-Maria
 Behnsen <anna-maria@linutronix.de>,  Jeff Johnson
 <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v3 14/19] wifi: ath11k: Convert timeouts to
 secs_to_jiffies()
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
	<20241210-converge-secs-to-jiffies-v3-14-ddfefd7e9f2a@linux.microsoft.com>
Date: Wed, 11 Dec 2024 09:42:11 +0200
In-Reply-To: <20241210-converge-secs-to-jiffies-v3-14-ddfefd7e9f2a@linux.microsoft.com>
	(Easwar Hariharan's message of "Tue, 10 Dec 2024 22:02:45 +0000")
Message-ID: <87sequr7ho.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_234232_636580_7A0C69B0 
X-CRM114-Status: GOOD (  15.39  )
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

Easwar Hariharan <eahariha@linux.microsoft.com> writes:

> Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
> secs_to_jiffies(). As the value here is a multiple of 1000, use
> secs_to_jiffies() instead of msecs_to_jiffies to avoid the multiplication.
>
> This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci with
> the following Coccinelle rules:
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
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>  drivers/net/wireless/ath/ath11k/debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I assume we can take this to our ath.git tree, please let us know if
that's not the case.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

