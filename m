Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15646C4706C
	for <ath11k@archiver.kernel.org>; Fri, 12 Jan 2024 14:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3aa01SbdR3rLuS7ctkYXXTbE7QpbEckUK+sIft1n9jU=; b=gQdCZRhGQzgZjYN8Qu8r/KdV7w
	j/7Par0tDeC3KrVEARp2ZadBfL6T0FQXOtCPsvN4MYYQPMNHpI70GEMuQbMISG8jJrx8u3gNq41BY
	KIU/O+C4DGTTEjYz0txmlqoVCW5THm2feVklVo+GQZukqpTJhglK+v9uv5BeLxQUd+iB9kfo/hUDU
	9tH4P4AGib3zcOJ2YDhm4UZ8MjFlJ0rQ7nIthKaO+aQhbckaX7ZYYnesrGoUi0Af/Bi2TPzUcWiAq
	ZUhr1paU4bFvnyQE2sjeIXjrRAv+loX6DbCjSIdcZgE0FkoGkl2rJ3URTTTHZ41yqN1yRnYLrgVWn
	R5gW+d1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOIgU-0033mV-1r;
	Fri, 12 Jan 2024 14:38:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOIgR-0033m7-17
	for ath11k@lists.infradead.org;
	Fri, 12 Jan 2024 14:38:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EEC5E61DB1;
	Fri, 12 Jan 2024 14:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F555C43399;
	Fri, 12 Jan 2024 14:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1705070303;
	bh=KW7ed60w1PQm27Rd+trnG/PG3TKrhodYPisijJMp7qY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1S3iAYdxNp6r9rQUvwAPrNOWgnBiKYrUjzoumzaXJX4t/57aXDsmMfrLnkQnZGKlC
	 y8BbmjaFi7HawMIk5lmGlvDFrMqcUvUx7U7RaW9Ba4Ww/BmfLYxXwsZKwr3uEVN6bR
	 SXZb2DumHjqjuN9iPxPI2f6Ke/s/1+tZpb0gKQto=
Date: Fri, 12 Jan 2024 09:38:22 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 2/2] wifi: ath11k: add support for QCA2066
Message-ID: <20240112-dangerous-cow-of-excitement-fdbaa6@lemur>
References: <20240109021336.4143-1-quic_bqiang@quicinc.com>
 <20240109021336.4143-3-quic_bqiang@quicinc.com>
 <e19baf59-c17b-4e2b-96d7-f4fc9812c99a@quicinc.com>
 <56282bad-b59d-4572-a6f1-1b905bf0edbd@quicinc.com>
 <da6ff953-07a4-4226-a7dc-b816f8dc5724@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <da6ff953-07a4-4226-a7dc-b816f8dc5724@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_063855_448258_BAF6F9B8 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jan 10, 2024 at 08:20:46AM -0800, Jeff Johnson wrote:
> Unfortunately automated tasks don't parse cover letters. But it looks
> like b4 doesn't handle or warn about:
> prerequisite-patch-id: 640366721125b1adea0eeabd5cdfca5e91476e7c
> 
> And not quite sure how it would handle that.

B4 should be able to handle dependencies like that in the future. For example,
we can already locate this patch using:

https://lore.kernel.org/all/?q=patchid%3A640366721125b1adea0eeabd5cdfca5e91476e7c

Support for dependencies is slated to land in the next few months.

-K

