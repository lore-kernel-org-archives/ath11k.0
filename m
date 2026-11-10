Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6808E606A31C
	for <ath11k@archiver.kernel.org>; Tue, 10 Nov 2026 12:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MKFisU5T;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=gWyhvU4i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=P1TOwjSBpVmzlTpkye1A7TaQqrxpcgA/ZVUQvzoOveg=; b=MKFisU5T5pXGZGSXCTjyqXVbpQ
	dGDEU2ef5pXijhyWl+fOwmloQBfXdBn8PNThtDuqbPQI0L6R7ErE9R/VYWqgDwNXwklZAQNjOMREI
	sfIJV2RO22BjPop3EcGdKZYw8lBqVPOLYw3EtdYFjsTmW2TeQ9zfk7WU4BM6NQ6DaQXm0cUomyn28
	eoxgfipIWSkOUIIQqkkwkzayECecKicRgTv3qckr8aM85Dhz7szdbKbkzzibAf3xZ2siYdE6RPc+R
	dxmO/JOrSzvDC0vIByTrP1ho2zoXWnHO7dCJZh5O9gJ3C15uITjrSURsHMz+Aep6QmZMlIxW8qk9o
	7pVAzzOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkwa-00000003qGX-2hvP;
	Tue, 10 Nov 2026 12:27:20 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkwX-00000003qFt-2usw
	for ath11k@lists.infradead.org;
	Tue, 10 Nov 2026 12:27:18 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9C16B1F8;
	Tue, 10 Nov 2026 13:24:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794313493;
	bh=Q/ns5vfPB5rYk/V3wlThFVH2cm+bdatbrKGfy+X0PNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gWyhvU4i8ZaMmE1PcuBmx2DLRuRjkFyzrDm8qlkQwbjnYOcowt0A6hVCf8K7yPyO+
	 PmGaq/RcEcqJBp6q/HBCwRVXezPl7xcEK7eOd74MS5JN4texxd9OUY3f6B0GZt7p9h
	 OMryMC/bJYlDgYkBSNCE4/Lxrwf3Manearl3b4QY=
Date: Tue, 10 Nov 2026 14:27:14 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH RESEND] wifi: ath11k: release the rproc reference on
 teardown
Message-ID: <20261110122714.GA3809@killaraus.ideasonboard.com>
References: <20261103102915.1341148-1-vulab@iscas.ac.cn>
 <a39b1918-5d04-452b-8b5a-0703963f4587@oss.qualcomm.com>
 <179430684554.3011466.3431045638041318447@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179430684554.3011466.3431045638041318447@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_042717_877896_70FF8A42 
X-CRM114-Status: GOOD (  14.08  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 10:34:05AM -0000, Wentao Liang wrote:
> Hi Jeff,
> 
> I'm sorry for taking so long to reply and for the confusion and extra
> work caused by sending patches from a shared address and failing to
> follow up on review feedback.
> 
> To keep the existing discussions clear, I'll continue to reply from
> vulab@iscas.ac.cn under my own name in the threads for patches I
> submitted. I will not send any new patches or revisions.
> 
> For context on this submission, static analysis flagged the candidate,
> and we used DeepSeek and GPT-6.1 Sol to assist with reviewing it and
> preparing the fix.

What is your core motivation for doing this ? I understand how someone
would start contributing to the kernel to fix issues they experience, or
to learn about operating systems, or for the fun of tinkering, but none
of that seems to apply to this flood of patches. What's your reason ?

> Again, I'm sorry for the confusion and the extra work this caused.
> 
> Wentao

-- 
Regards,

Laurent Pinchart

