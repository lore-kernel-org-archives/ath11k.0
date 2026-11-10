Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342D8606A31C
	for <ath11k@archiver.kernel.org>; Tue, 10 Nov 2026 10:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fup68qzg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:MIME-Version
	:Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Subject:Cc:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uMsKrHrfZchhh/m6IXY34VKZHA3ZjPvsm6XnygmGsDE=; b=Fup68qzgSadq7b
	i/HAczXC2H3G0ewQ9Nndf8m89fxHbW+WAdb4WupaRwh2xgQkNuwLeIUNMKuKJNdHFMB6SMwiDE/TQ
	MTdZE1jVgYykroWtQD687RsWzVmomROGkhrVW8f9TNp12Mil+Reyf8ZelbO5ldfffwMtLelgakjeq
	vaXOVk+q7wB1APL8qzTmHO8aDBOjPeaLxMj+y2Zc6BycpcL6v0Z+E7GyNR6xn2e7AgmfP6bnSLD0n
	7Ti2Ua0PEGWbYI0dETEhB1WDuQU205ttOVKRVOu5ao40Ru6pooUrp7pZlOwaN32fZuz3iRW5dWu0h
	HE8PdIDqVPVgp8enC3/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjAz-00000003T6B-3bir;
	Tue, 10 Nov 2026 10:34:05 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjAw-00000003T5M-1SFf
	for ath11k@lists.infradead.org;
	Tue, 10 Nov 2026 10:34:04 +0000
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowADnf7US8_Jqc87HAA--.1727S2;
	Tue, 10 Nov 2026 18:33:54 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org
Subject: Re: [PATCH RESEND] wifi: ath11k: release the rproc reference on teardown
In-Reply-To: <a39b1918-5d04-452b-8b5a-0703963f4587@oss.qualcomm.com>
References: <20261103102915.1341148-1-vulab@iscas.ac.cn>
 <a39b1918-5d04-452b-8b5a-0703963f4587@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 10 Nov 2026 10:34:05 -0000
Message-ID: <179430684554.3011466.3431045638041318447@iscas.ac.cn>
X-CM-TRANSID: zQCowADnf7US8_Jqc87HAA--.1727S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYs7k0a2IF6F4UM7kC6x804xWl1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
	80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr1j6rxdMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE
	74AGY7Cv6cx26r48ZrWUJr1UMxAqzxv26xkF7I0En4kS14v26r126r1DMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7IUb_-PUUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRIHA2ry1-1guAAAs1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_023402_766697_23EA8298 
X-CRM114-Status: UNSURE (   4.46  )
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

Hi Jeff,

I'm sorry for taking so long to reply and for the confusion and extra
work caused by sending patches from a shared address and failing to
follow up on review feedback.

To keep the existing discussions clear, I'll continue to reply from
vulab@iscas.ac.cn under my own name in the threads for patches I
submitted. I will not send any new patches or revisions.

For context on this submission, static analysis flagged the candidate,
and we used DeepSeek and GPT-6.1 Sol to assist with reviewing it and
preparing the fix.

Again, I'm sorry for the confusion and the extra work this caused.

Wentao


