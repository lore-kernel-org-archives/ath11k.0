Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFF5606A336
	for <ath11k@archiver.kernel.org>; Wed, 11 Nov 2026 03:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uolepnmc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:References:In-Reply-To
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k8pe3tOEsqNneCAZxFljqZ7LcXG/k88tOXHdLWz/vDc=; b=uolepnmcE8Gc8ZfYYu1xhpRIyX
	c0DB8aysfChNwHptZHcGKfJpY/y9BH+9bAQqvnUZIiftR3pgz7CsKqDYfs23bL98SCvpSLE67hdE1
	5jkncwFLFpbodTsgy99oTunQrltNsgkmjAr8YhlwkiAqAuTOP/DkyG6XUjA7VSsLCZ1y2SVJT8L00
	t4boZUSA9rXbc5QvWLGDLbFeTPLuKnjFq7BM8qYNrEM+M4B2NnMJnifxOl2avy/ULWpKiqFS+CFyr
	Q2nz8RjyQns+vGdu7BtJQ6DfVNhntFZ4xNbs+ldN26DMMgI7Qrb6+sdH5ZBclYZXOZP/JyWTfogiD
	lXb/BUow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQzBm-00000005ZEh-0qju;
	Wed, 11 Nov 2026 03:39:58 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQzBe-00000005ZDd-2Q7Y
	for ath11k@lists.infradead.org;
	Wed, 11 Nov 2026 03:39:56 +0000
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAB3DrSB4_NqwzzZAA--.16282S2;
	Wed, 11 Nov 2026 11:39:46 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org
Subject: Re: [PATCH RESEND] wifi: ath11k: release the rproc reference on teardown
In-Reply-To: <20261110122714.GA3809@killaraus.ideasonboard.com>
References: <20261103102915.1341148-1-vulab@iscas.ac.cn>
 <a39b1918-5d04-452b-8b5a-0703963f4587@oss.qualcomm.com>
 <179430684554.3011466.3431045638041318447@iscas.ac.cn>
 <20261110122714.GA3809@killaraus.ideasonboard.com>
Date: Wed, 11 Nov 2026 03:39:57 -0000
Message-ID: <179436839700.3055208.16759622808608708086@iscas.ac.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: zQCowAB3DrSB4_NqwzzZAA--.16282S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw18Zw47JFWxGryfurW3Wrg_yoWkXFbEka
	4qvFykKw1UXFZF9a1Sqr43Zrs29FW2v34UJ34Fqa1kZ345GF47XF4akFnxAr1SyrZ0kF43
	Wr13Gw4Fyw1xujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxAYjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4
	AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48J
	MxAIw28IcVCjz48v1sIEY20_Gr43Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r12
	6r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07
	b5lk3UUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAIIA2rzsLXizwAAs0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_193951_045367_EAEE2317 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Laurent,

My main goal is to study how to find bugs in the Linux kernel. When
that work finds a bug, I also want to help fix it and contribute to
the kernel.

Static analysis flagged possible bugs, and we reviewed them by hand
with help from DeepSeek and GPT-6.1 Sol. Even after that review, many
of them still seemed worth looking into. I got excited about the
findings and sent more patches than I could follow up on. I regretted
that decision soon afterward. I should have sent fewer patches and
replied sooner. I'm sorry for the extra work this caused.

I'll use this shared address only to reply to feedback I haven't yet
answered on patches I've already sent. I'll go through that feedback
one message at a time and respect the decisions maintainers have
already made. If any of the remaining patches are still worth
considering, I'd be grateful for the chance to answer questions
about them.

I still hope to contribute to the kernel in the future. If I have
the chance to do so, I'll use my own email address, respect the
maintainers' requests, and send only as many patches as I can
follow up on promptly.

Thanks,
Wentao


