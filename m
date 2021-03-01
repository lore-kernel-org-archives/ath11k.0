Return-Path: <SRS0=Rum7=H7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6887FC433DB
	for <ath11k@archiver.kernel.org>; Mon,  1 Mar 2021 09:47:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDD45601FE
	for <ath11k@archiver.kernel.org>; Mon,  1 Mar 2021 09:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDD45601FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUZ3ivo1AO/z3pBLx5q4XA3scPSn+konswpPT2QzPxA=; b=3YPXNFfHfaa9P+41tLNaX3QYJX
	x+KExdhNb0KivuDjx+Zwm1zFeLqUILS1hBVeN/3sUWf6dopdaX7vhosFKwvAgrtvEPJ7mW8Z66i1s
	/mtrw+9s8CqCJho51JFyNMVEUcJEDc0eFPdjRkRs7UMampuNWNW4Vue2OeCT/Kk/caCAeJasR7d3p
	gA40rwyBt4aggy9VSmbZKEBSE8zazRi4iVNxXSGsiDjTdi+rDTw8GlqwvGcGai7Ym/89lWO4fQ+kS
	L/whgt6aToa2BJhWt9pVajvQePRkFuM/DiHwmaS8Q4zYP7riKKGYjmyCBbYomguasLPDoBWgvAbPL
	Sw5WtTMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGf8t-0006GX-5H; Mon, 01 Mar 2021 09:47:07 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGf8q-0006GE-85
 for ath11k@lists.infradead.org; Mon, 01 Mar 2021 09:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1614592019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p9A6EGG6hQ/4mXfXaZeKDRiCKKFlOjbhWZdxB313VfQ=;
 b=QTiM/4ZnDcFHQN4CqBY85SeYNPeklmXgOTGwusj5KJG1uy6pqYVJGJVElWr1wflJaxNAx0
 u9FxnlHCq9pgXXWc2AUKwc+3WOzH56LpqQj/o3WEHfHvFu5mU8D0bhEekhrCQ6PQkky73A
 6EkWQZMANXgjhG4JUPJEayChlz7oCnM=
From: Sven Eckelmann <sven@narfation.org>
To: ath11k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>
Subject: Re: IPQ8074: hw2.0: Wrong mac address for 2.4GHz PHY with firmware
 2.5.0.1.r1-00004
Date: Mon, 01 Mar 2021 10:46:56 +0100
Message-ID: <4391993.8BYWHWz4yj@ripper>
In-Reply-To: <12396947.EVyyLHbfrO@ripper>
References: <12396947.EVyyLHbfrO@ripper>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_044704_529810_FCA483F1 
X-CRM114-Status: UNSURE (   5.45  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Monday, 18 January 2021 09:14:54 CET Sven Eckelmann wrote:
[...]
> Now with the new firmware WLAN.HK.2.5.0.1.r1-00004-QCAHKSWPL_SILICONZ-1, it 
> suddenly uses a mac address which is not part of the pre-cal data.

@Kalle, the QCA firmware team assumes that this is fixed in 2.5.0.1.r2. Could 
you provide this also in ath11k-firmware?

Kind regards,
	Sven




-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
