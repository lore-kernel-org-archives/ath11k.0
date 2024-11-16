Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800A6D68BE3
	for <ath11k@archiver.kernel.org>; Sat, 16 Nov 2024 06:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GOO379j5kHelQgT13xeDCIW+pFPJCeiM7WSIuvag78=; b=NFvBN4+tHqXz89t26bJqQH/wIE
	06keiAAX3NC6dem3/H1juZS/vNBOfMU9n3oebpa0yS3luyqXDxwhHxFyIpurVWcf//58BcbwNMnjh
	imlRCSJI5lOa58QMN05d3aK/wlakB/xHSKAPXdezHlbxVIs9CY6DVJhEv0GfiCQzvuEWklHpthrhp
	CGOXnv0jhvBlioyFMet9Mk8wG9P+vZFcvkrpk4bDv4NLifuY/nwXhjZ4YuB2l1TQ0TBKHCST8HQCt
	ZySV8etLBLQB2yDWCbtGTSZgN8MlqgJUCi0zlwcvTlGMDQwG6EfRWuX9UnniAY1IQYetjzv5BQ4vR
	DD+HZjvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCBwj-000000053N0-0k4c;
	Sat, 16 Nov 2024 06:06:13 +0000
Received: from smtp-17.smtpout.orange.fr ([80.12.242.17] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCBwe-000000053Kn-04aq;
	Sat, 16 Nov 2024 06:06:11 +0000
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id CBwItlkEVyQmhCBwItrt0n; Sat, 16 Nov 2024 07:06:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731737162;
	bh=1GOO379j5kHelQgT13xeDCIW+pFPJCeiM7WSIuvag78=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=mL98MjzVZSShtzisX9zbjDjIb7KE72buAzIx9jorkgCEIlxacBGBiKDqnznYupede
	 vEhaEvssP8Otw+abSwd4UipThVl5qw3v6w8RixuAXgrl/p9FBRiYmldRfZZljgK0OD
	 FX0UB9px2S9OjhfpAHnQggpK1elWNH8UBNVIvO5x+AsAiYtyf4oGwInz8jFtqh7DDu
	 OMNwG4GURPpChqfcVzLVhpacwz+NEqWf9xIvmwF/gxmCGy7nRrRkaf4TeGrlu6c0Ll
	 o9NHONgP90fIf7c6ZsyFFLJ/v2i9NFywx5+jxHfxBiA3eBfpU5DKAu5obNXbrUQywu
	 rI95zY+eQlUcg==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 16 Nov 2024 07:06:02 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: eahariha@linux.microsoft.com
Cc: James.Bottomley@HansenPartnership.com,
	Julia.Lawall@inria.fr,
	agordeev@linux.ibm.com,
	airlied@gmail.com,
	akpm@linux-foundation.org,
	andrew+netdev@lunn.ch,
	anna-maria@linutronix.de,
	ath11k@lists.infradead.org,
	axboe@kernel.dk,
	bcm-kernel-feedback-list@broadcom.com,
	borntraeger@linux.ibm.com,
	catalin.marinas@arm.com,
	ceph-devel@vger.kernel.org,
	christian.gmeiner@gmail.com,
	christophe.leroy@csgroup.eu,
	cocci@inria.fr,
	coreteam@netfilter.org,
	daniel@zonque.org,
	davem@davemloft.net,
	dick.kennedy@broadcom.com,
	dri-devel@lists.freedesktop.org,
	edumazet@google.com,
	etnaviv@lists.freedesktop.org,
	florian.fainelli@broadcom.com,
	gor@linux.ibm.com,
	gregkh@linuxfoundation.org,
	haojian.zhuang@gmail.com,
	hca@linux.ibm.com,
	horms@kernel.org,
	idryomov@gmail.com,
	intel-xe@lists.freedesktop.org,
	james.smart@broadcom.com,
	jeroendb@google.com,
	jikos@kernel.org,
	jinpu.wang@cloud.ionos.com,
	jjohnson@kernel.org,
	joe.lawrence@redhat.com,
	johan.hedberg@gmail.com,
	jpoimboe@kernel.org,
	kadlec@netfilter.org,
	kuba@kernel.org,
	kvalo@kernel.org,
	l.stach@pengutronix.de,
	linux+etnaviv@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	linux@armlinux.org.uk,
	linuxppc-dev@lists.ozlabs.org,
	live-patching@vger.kernel.org,
	louis.peens@corigine.com,
	lucas.demarchi@intel.com,
	luiz.dentz@gmail.com,
	maarten.lankhorst@linux.intel.com,
	maddy@linux.ibm.com,
	marcel@holtmann.org,
	martin.petersen@oracle.com,
	mbenes@suse.cz,
	mpe@ellerman.id.au,
	mripard@kernel.org,
	naveen@kernel.org,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	nicolas.palix@imag.fr,
	npiggin@gmail.com,
	obitton@habana.ai,
	ogabbay@kernel.org,
	oss-drivers@corigine.com,
	pabeni@redhat.com,
	pablo@netfilter.org,
	perex@perex.cz,
	pkaligineedi@google.com,
	pmladek@suse.com,
	rjui@broadcom.com,
	robert.jarzmik@free.fr,
	rodrigo.vivi@intel.com,
	roger.pau@citrix.com,
	sbranden@broadcom.com,
	shailend@google.com,
	simona@ffwll.ch,
	svens@linux.ibm.com,
	thomas.hellstrom@linux.intel.com,
	tiwai@suse.com,
	tzimmermann@suse.de,
	xen-devel@lists.xenproject.org,
	xiubli@redhat.com
Subject: Re: [PATCH v2 02/21] coccinelle: misc: Add secs_to_jiffies script
Date: Sat, 16 Nov 2024 07:05:40 +0100
Message-ID: <20241116060541.5798-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-2-911fb7595e79@linux.microsoft.com>
References: <20241115-converge-secs-to-jiffies-v2-2-911fb7595e79@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_220608_469069_BF5565DD 
X-CRM114-Status: GOOD (  11.39  )
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

Le 15/11/2024 à 22:26, Easwar Hariharan a écrit :
> Suggested-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>   scripts/coccinelle/misc/secs_to_jiffies.cocci | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/scripts/coccinelle/misc/secs_to_jiffies.cocci b/scripts/coccinelle/misc/secs_to_jiffies.cocci
> new file mode 100644
> index 0000000000000000000000000000000000000000..af762b1c0aac8f044f21150bfaafd9efc834ee87
> --- /dev/null
> +++ b/scripts/coccinelle/misc/secs_to_jiffies.cocci
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +///
> +/// Find usages of:
> +/// - msecs_to_jiffies(value*1000)
> +/// - msecs_to_jiffies(value*MSEC_PER_SEC)
> +///
> +// Confidence: High
> +// Copyright: (C) 2024 Easwar Hariharan Microsoft
> +//
> +// Keywords: secs, seconds, jiffies
> +//
> +
> +@@ constant C; @@
> +
> +- msecs_to_jiffies(C * 1000)
> ++ secs_to_jiffies(C)
> +
> +@@ constant C; @@
> +
> +- msecs_to_jiffies(C * MSEC_PER_SEC)
> ++ secs_to_jiffies(C)
> 
Hi,

	@@ constant C =~ "000"; @@

	* msecs_to_jiffies(C)

also spots things like msecs_to_jiffies(1000)

I'm not sure that coccinelle is enable to capture part of the regex to automate the removal of the 000 when converting from ms to s.

Just my 2c,

CJ

