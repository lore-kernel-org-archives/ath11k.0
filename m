Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C4DC36002
	for <ath11k@archiver.kernel.org>; Mon, 24 Mar 2025 07:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsIlaCaxlZSPOLg8KYTVzvnULij3FtduSNuJAIGbjHw=; b=eoOJTf2UV4zjJvndweAHdMQfbF
	7QLAcySEnqJV95GkoNcU+iGFN3WBe8UtgI52oVe9LRe+sJzMbY4c4ZCA4L7Qr/UKXPNc38ccVDfZs
	+h/Y/LgRv08TBKI8p7/pj03jnxxfUoqaqVrOUKYOxIA7ltKmU5hNaClkB/BPjaU0cnOyZA4vRE3GZ
	wFse7TCY0jTIK8pZbTfOymE19Bas64CmkvB2X/CfvJmJDYzAFQMQaW9yT9dzRJ0pKErTvY6Fd4zsk
	5po8YEShzdZqkfExqZJBP/jYqAeu2FqrhgRopY3zP8BlyTiytTeoHpnYKXto3Xq4obxvTY8+Vyboq
	BSKavxUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twcbc-00000002V3M-27Fi;
	Mon, 24 Mar 2025 07:52:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twcbZ-00000002V1b-3sFo
	for ath11k@lists.infradead.org;
	Mon, 24 Mar 2025 07:52:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 476A95C5999;
	Mon, 24 Mar 2025 07:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D769AC4CEDD;
	Mon, 24 Mar 2025 07:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742802736;
	bh=Dp5AurwzM/p53iQBJHpyX02AtDUS6HyFc/sVGsh+7u8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jaappGi4tD5n5foRED2gXV/Y6EqSOjtTYMwgmkxFocdhJKrPshPcKS7ppKeZ9T7QR
	 2NjbHm09Jwe/BZp+1yP9TQlxj8Vzd2t8GVEulo+LiQHiPj7YC5Iv46I3H3lqWa3OgK
	 rM/bmOF9N7FrNupGLG0DwNDGdDQofeqj3qARdO/CBbVi7UYEY9qf1MD/HUKpb0hUac
	 zRvVPqpd2goJquYZrEB9o1c7VvclcqFrCvlavvKnbyNrQMZlhaUgOltDfektlpeicL
	 GD3hzcLSsU27NzIrZeIskBMuCuaMXbhG8+YSqSa5B03KG61l9DQsAyVYPki1t93XaZ
	 5wLcUuZmUEjNA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1twcbX-000000001Xy-3oIu;
	Mon, 24 Mar 2025 08:52:15 +0100
Date: Mon, 24 Mar 2025 08:52:15 +0100
From: Johan Hovold <johan@kernel.org>
To: Steev Klimaszewski <steev@kali.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Clayton Craft <clayton@craftyguy.net>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: fix rx completion meta data corruption
Message-ID: <Z-EPL36eK-TkKHt2@hovoldconsulting.com>
References: <20250321145302.4775-1-johan+linaro@kernel.org>
 <CAKXuJqh0_7fduDgDXWzCE2fYNHV-mDa29Lxq15h7-vam2Nin6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKXuJqh0_7fduDgDXWzCE2fYNHV-mDa29Lxq15h7-vam2Nin6w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_005218_025684_CFB4181B 
X-CRM114-Status: GOOD (  23.82  )
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

On Sat, Mar 22, 2025 at 03:32:08PM -0500, Steev Klimaszewski wrote:
> On Fri, Mar 21, 2025 at 9:55 AM Johan Hovold <johan+linaro@kernel.org> wrote:
> >
> > Add the missing memory barrier to make sure that the REO dest ring
> > descriptor is read after the head pointer to avoid using stale data on
> > weakly ordered architectures like aarch64.
> >
> > This may fix the ring-buffer corruption worked around by commit
> > f9fff67d2d7c ("wifi: ath11k: Fix SKB corruption in REO destination
> > ring") by silently discarding data, and may possibly also address user
> > reported errors like:
> >
> >         ath11k_pci 0006:01:00.0: msdu_done bit in attention is not set
> >
> > Tested-on: WCN6855 hw2.1 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> >
> > Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> > Cc: stable@vger.kernel.org      # 5.6
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=218005
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > ---
> >
> > As I reported here:
> >
> >         https://lore.kernel.org/lkml/Z9G5zEOcTdGKm7Ei@hovoldconsulting.com/
> >
> > the ath11k and ath12k appear to be missing a number of memory barriers
> > that are required on weakly ordered architectures like aarch64 to avoid
> > memory corruption issues.
> >
> > Here's a fix for one more such case which people already seem to be
> > hitting.
> >
> > Note that I've seen one "msdu_done" bit not set warning also with this
> > patch so whether it helps with that at all remains to be seen. I'm CCing
> > Jens and Steev that see these warnings frequently and that may be able
> > to help out with testing.

> While the fix is definitely a fix, it does not seem to help with the
> `msdu_done bit in attention is not set` message as I have seen it 43
> times in the last 12 hours.

Thanks for testing, Steev. Given that that the patch makes the warnings
go away in Clayton's setup it seems we may be dealing with more than
once root cause here.

Johan

